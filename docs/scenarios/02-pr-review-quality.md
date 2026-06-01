# Scenario 2: Pull Request Review and Quality

## Goal

Use GitHub Copilot to help tech leads review pull requests with better consistency, speed, and focus.

## Tech lead workflow

1. Ask Copilot to summarize the PR intent, changed files, and risk areas.
2. Ask for missing tests, edge cases, observability gaps, and security concerns.
3. Compare the implementation with repository standards.
4. Convert repeated review comments into reusable repository guidance.
5. Coach developers using review patterns instead of one-off comments.

## Recommended review prompts

```text
Review this pull request as a tech lead. Focus only on correctness, maintainability, security, test coverage, and operational risk. Do not comment on style unless it affects behavior or maintainability.
```

```text
Summarize the user-visible behavior change, identify the riskiest files, and list the top five review questions I should ask before approving.
```

## Success indicators

- Shorter review cycles.
- Fewer repeated review comments.
- Better test coverage for risky changes.
- More consistent review expectations across the team.

