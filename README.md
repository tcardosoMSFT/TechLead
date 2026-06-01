# TechLead

Reusable GitHub Copilot scenarios, skills, agents, and automation patterns for tech leads.

This repository is organized around four high-value ways tech leads can use GitHub Copilot to improve engineering execution, quality, governance, and onboarding.

## Scenarios

| Scenario | Purpose | Main assets |
| --- | --- | --- |
| 1. Engineering Metrics with GitHub Copilot CLI and GitHub APIs | Collect objective engineering signals such as Copilot usage, pull requests per month, merged PRs, and team delivery trends. | `docs/scenarios/01-engineering-metrics.md`, `scripts/collect-engineering-metrics.ps1`, `agents/engineering-metrics-agent.md`, `skills/engineering-metrics.skill.md` |
| 2. Pull Request Review and Quality | Help tech leads standardize review depth, summarize changes, detect risk, and coach reviewers. | `docs/scenarios/02-pr-review-quality.md`, `agents/pr-review-agent.md`, `skills/pull-request-review.skill.md` |
| 3. Technical Standards and Architecture Governance | Turn engineering principles into reusable Copilot guidance for consistency across teams. | `docs/scenarios/03-standards-architecture.md`, `agents/standards-agent.md`, `skills/engineering-standards.skill.md` |
| 4. Onboarding and Knowledge Transfer | Accelerate ramp-up by using Copilot to explain codebases, flows, decisions, and tests. | `docs/scenarios/04-onboarding-knowledge.md`, `agents/onboarding-agent.md`, `skills/onboarding-knowledge.skill.md` |

## Repository structure

```text
TechLead/
├── agents/              # Agent definitions and operating instructions
├── docs/scenarios/      # Scenario playbooks
├── scripts/             # Automation scripts
├── skills/              # Reusable skill prompts/instructions
├── templates/           # Output schemas and reusable templates
└── .github/workflows/   # Repository validation workflows
```

## Quick start

1. Install and authenticate the GitHub CLI:

   ```powershell
   gh auth login
   ```

2. Run the engineering metrics collector:

   ```powershell
   .\scripts\collect-engineering-metrics.ps1 `
     -Organization "contoso" `
     -Repositories "contoso/app1","contoso/app2" `
     -MonthsBack 6 `
     -IncludeCopilotMetrics
   ```

3. Use the scenario playbooks in `docs/scenarios` to introduce the patterns with your teams.

4. Use the bilingual environment runbooks in `docs/runbooks` to apply each scenario inside a real team or organization.

## Notes

- The metrics script requires a GitHub token with access to the target organization and repositories.
- Copilot metrics endpoints require the right GitHub plan and organization/enterprise permissions.
- Do not commit raw exports that contain private user-level data. Keep generated files in `output/`, which is ignored by Git.

