# Scripts

## collect-engineering-metrics.ps1

Collects aggregated GitHub engineering metrics for tech lead analysis.

### Requirements

- PowerShell 7 or Windows PowerShell 5.1+
- GitHub CLI
- Authenticated GitHub CLI session:

```powershell
gh auth login
```

### Example

```powershell
.\scripts\collect-engineering-metrics.ps1 `
  -Organization "contoso" `
  -Repositories "contoso/api","contoso/web" `
  -MonthsBack 6 `
  -IncludeCopilotMetrics
```

