[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [string]$Organization,

    [string[]]$Repositories,

    [int]$MonthsBack = 6,

    [string]$OutputDirectory = ".\output",

    [switch]$IncludeCopilotMetrics,

    [string]$TeamSlug
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Assert-Command {
    param([string]$Name)

    if (-not (Get-Command $Name -ErrorAction SilentlyContinue)) {
        throw "Required command '$Name' was not found. Install it and try again."
    }
}

function Invoke-GhJson {
    param([string[]]$Arguments)

    $output = & gh @Arguments 2>&1
    if ($LASTEXITCODE -ne 0) {
        throw "GitHub CLI command failed: gh $($Arguments -join ' ')`n$output"
    }

    if ([string]::IsNullOrWhiteSpace($output)) {
        return $null
    }

    return $output | ConvertFrom-Json
}

function Get-MonthWindows {
    param([int]$Count)

    $currentMonth = Get-Date -Day 1 -Hour 0 -Minute 0 -Second 0
    $windows = @()

    for ($offset = $Count - 1; $offset -ge 0; $offset--) {
        $start = $currentMonth.AddMonths(-$offset)
        $end = $start.AddMonths(1).AddDays(-1)
        $windows += [pscustomobject]@{
            Month = $start.ToString("yyyy-MM")
            Start = $start.ToString("yyyy-MM-dd")
            End   = $end.ToString("yyyy-MM-dd")
        }
    }

    return $windows
}

function Get-SearchCount {
    param([string]$SearchQuery)

    $query = @'
query($searchQuery: String!) {
  search(query: $searchQuery, type: ISSUE, first: 1) {
    issueCount
  }
}
'@

    $result = Invoke-GhJson -Arguments @("api", "graphql", "-f", "query=$query", "-f", "searchQuery=$SearchQuery")
    return [int]$result.data.search.issueCount
}

function Get-OrganizationRepositories {
    param([string]$Org)

    $json = & gh repo list $Org --limit 1000 --json nameWithOwner 2>&1
    if ($LASTEXITCODE -ne 0) {
        throw "Could not list repositories for organization '$Org'.`n$json"
    }

    return ($json | ConvertFrom-Json).nameWithOwner
}

Assert-Command -Name "gh"

if ($MonthsBack -lt 1) {
    throw "MonthsBack must be greater than zero."
}

if (-not $Repositories -or $Repositories.Count -eq 0) {
    Write-Host "No repositories provided. Listing repositories for organization '$Organization'..."
    $Repositories = @(Get-OrganizationRepositories -Org $Organization)
}

if (-not $Repositories -or $Repositories.Count -eq 0) {
    throw "No repositories were found for organization '$Organization'."
}

New-Item -ItemType Directory -Force -Path $OutputDirectory | Out-Null

$monthWindows = Get-MonthWindows -Count $MonthsBack
$prRows = New-Object System.Collections.Generic.List[object]

foreach ($repo in $Repositories) {
    foreach ($window in $monthWindows) {
        $createdQuery = "repo:$repo is:pr created:$($window.Start)..$($window.End)"
        $mergedQuery = "repo:$repo is:pr is:merged merged:$($window.Start)..$($window.End)"

        Write-Host "Collecting PR metrics for $repo / $($window.Month)..."

        $created = Get-SearchCount -SearchQuery $createdQuery
        $merged = Get-SearchCount -SearchQuery $mergedQuery
        $ratio = if ($merged -eq 0) { $null } else { [math]::Round($created / $merged, 2) }

        $prRows.Add([pscustomobject]@{
            organization = $Organization
            repository = $repo
            month = $window.Month
            prs_created = $created
            prs_merged = $merged
            created_to_merged_ratio = $ratio
        })
    }
}

$prCsvPath = Join-Path $OutputDirectory "pull-request-metrics.csv"
$prJsonPath = Join-Path $OutputDirectory "pull-request-metrics.json"
$prRows | Export-Csv -NoTypeInformation -Encoding UTF8 -Path $prCsvPath
$prRows | ConvertTo-Json -Depth 10 | Out-File -Encoding UTF8 -FilePath $prJsonPath

$copilotOutputPath = $null
if ($IncludeCopilotMetrics) {
    $since = $monthWindows[0].Start
    $until = $monthWindows[$monthWindows.Count - 1].End
    $endpoint = if ($TeamSlug) {
        "orgs/$Organization/team/$TeamSlug/copilot/metrics?since=$since&until=$until"
    }
    else {
        "orgs/$Organization/copilot/metrics?since=$since&until=$until"
    }

    Write-Host "Collecting Copilot metrics from $endpoint..."

    try {
        $copilotMetrics = Invoke-GhJson -Arguments @("api", $endpoint, "--paginate")
        $copilotOutputPath = Join-Path $OutputDirectory "copilot-metrics.json"
        $copilotMetrics | ConvertTo-Json -Depth 20 | Out-File -Encoding UTF8 -FilePath $copilotOutputPath
    }
    catch {
        Write-Warning "Copilot metrics could not be collected. Confirm plan, permissions, and endpoint availability. Details: $($_.Exception.Message)"
    }
}

$summary = [pscustomobject]@{
    organization = $Organization
    repositories = $Repositories
    months_back = $MonthsBack
    generated_at = (Get-Date).ToString("o")
    pull_request_metrics_csv = $prCsvPath
    pull_request_metrics_json = $prJsonPath
    copilot_metrics_json = $copilotOutputPath
}

$summaryPath = Join-Path $OutputDirectory "summary.json"
$summary | ConvertTo-Json -Depth 10 | Out-File -Encoding UTF8 -FilePath $summaryPath

Write-Host ""
Write-Host "Engineering metrics collection completed."
Write-Host "PR metrics CSV: $prCsvPath"
Write-Host "PR metrics JSON: $prJsonPath"
Write-Host "Summary: $summaryPath"
if ($copilotOutputPath) {
    Write-Host "Copilot metrics JSON: $copilotOutputPath"
}

