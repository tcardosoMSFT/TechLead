# Runbook 01: Engineering Metrics

## Objective

Create a repeatable metrics process that helps tech leads understand GitHub Copilot adoption and pull request flow without turning the data into individual performance surveillance.

## Best fit

Use this runbook when you need to answer questions such as:

- Which teams or repositories are adopting GitHub Copilot?
- How many pull requests are created and merged each month?
- Are review bottlenecks increasing?
- Where should enablement or coaching be focused?

## Environment prerequisites

| Requirement | Why it matters |
| --- | --- |
| GitHub CLI authenticated with `gh auth login` | Used by the metrics script to call GitHub APIs. |
| Repository read access | Required to query PR data. |
| Organization-level Copilot metrics permission | Required only for Copilot metrics. PR metrics can run without it. |
| Clear list of repositories or organization scope | Defines the measurement boundary. |
| Local output folder not committed to Git | Prevents raw exports from being published. |

## Setup steps

1. Clone this repository:

   ```powershell
   git clone https://github.com/tcardosoMSFT/TechLead.git
   cd TechLead
   ```

2. Authenticate GitHub CLI:

   ```powershell
   gh auth login
   gh auth status
   ```

3. Select a measurement scope:

   ```powershell
   $repositories = @(
     "contoso/api",
     "contoso/web",
     "contoso/mobile"
   )
   ```

4. Run the metrics collector:

   ```powershell
   .\scripts\collect-engineering-metrics.ps1 `
     -Organization "contoso" `
     -Repositories $repositories `
     -MonthsBack 6 `
     -OutputDirectory ".\output\contoso"
   ```

5. If you have Copilot metrics permissions, include Copilot metrics:

   ```powershell
   .\scripts\collect-engineering-metrics.ps1 `
     -Organization "contoso" `
     -Repositories $repositories `
     -MonthsBack 6 `
     -IncludeCopilotMetrics `
     -OutputDirectory ".\output\contoso"
   ```

## Expected outputs

| File | Purpose |
| --- | --- |
| `pull-request-metrics.csv` | Easy-to-read monthly PR metrics. |
| `pull-request-metrics.json` | Structured PR metrics for automation or dashboards. |
| `copilot-metrics.json` | Copilot metrics when permissions allow. |
| `summary.json` | Run metadata and output file references. |

## How to interpret the results

| Pattern | Interpretation | Action |
| --- | --- | --- |
| PRs created are much higher than PRs merged | Work may be accumulating before merge. | Review PR size, reviewer capacity, and CI reliability. |
| PR volume is stable but Copilot usage is low | Copilot may not be embedded in the team workflow. | Run enablement sessions and share prompts by role/language. |
| Copilot usage is high but flow is unchanged | Process bottlenecks may limit productivity gains. | Inspect review latency, build failures, and requirement clarity. |
| One repository dominates PR activity | Team capacity or ownership may be concentrated. | Review ownership model and support plans. |

## Tech lead operating rhythm

1. Run metrics monthly.
2. Review repository-level trends with engineering managers and leads.
3. Share aggregated insights with teams.
4. Define one or two enablement actions per month.
5. Re-run the report and compare against the previous baseline.

## Privacy rules

- Do not rank individual developers by Copilot usage.
- Prefer repository, team, and organization-level summaries.
- Do not commit generated output files.
- Use the data for enablement, workflow improvement, and coaching.

## Validation checklist

- The script exits successfully.
- CSV and JSON outputs are generated.
- PR counts match a spot check in GitHub search.
- Copilot metrics are either generated or reported as unavailable with a warning.
- The generated data is stored outside tracked source files.

