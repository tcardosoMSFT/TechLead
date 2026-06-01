# Runbook 02: Pull Request Review and Quality

## Objective

Use GitHub Copilot to help tech leads review pull requests with better consistency, stronger quality signals, and less repetitive manual effort.

## Best fit

Use this runbook when:

- PR reviews are slow or inconsistent.
- Reviewers repeatedly miss the same categories of issues.
- Tech leads spend too much time summarizing large changes.
- The team needs a shared review checklist.

## Environment prerequisites

| Requirement | Why it matters |
| --- | --- |
| GitHub Copilot available in the IDE or CLI | Used to summarize and analyze changes. |
| Local repository clone | Lets reviewers inspect diffs and run tests. |
| GitHub CLI authenticated | Useful for checking out PRs and reading metadata. |
| Existing build/test commands | Needed to validate review concerns. |

## Setup steps

1. Clone the target repository:

   ```powershell
   git clone https://github.com/contoso/app.git
   cd app
   ```

2. Check out the pull request:

   ```powershell
   gh pr checkout 123
   ```

3. Ask Copilot to summarize the PR:

   ```text
   Summarize this pull request for a tech lead. Include intent, changed areas, behavior impact, tests, and risk areas.
   ```

4. Ask Copilot for a quality-focused review:

   ```text
   Review this pull request as a tech lead. Focus on correctness, maintainability, security, reliability, observability, and test coverage. Report only issues that materially affect quality or delivery risk.
   ```

5. Validate the output manually before commenting. Copilot should assist review judgment, not replace it.

## Review checklist

| Area | Questions |
| --- | --- |
| Correctness | Does the implementation satisfy the intended behavior? |
| Tests | Are the most important paths covered? Are edge cases tested? |
| Security | Are inputs validated? Are secrets avoided? Are permissions minimal? |
| Reliability | Are timeouts, retries, and idempotency handled where needed? |
| Observability | Are logs, metrics, or traces sufficient for production support? |
| Maintainability | Is the change understandable and aligned with existing patterns? |

## Recommended tech lead workflow

1. Use Copilot to summarize the PR.
2. Review the diff yourself.
3. Use Copilot to identify risks and missing tests.
4. Run the relevant tests.
5. Leave only high-signal comments.
6. Convert repeated comments into repository instructions or standards.

## Example review comment prompt

```text
Turn these review findings into concise GitHub PR comments. Keep the tone constructive. Do not comment on style unless it affects correctness, maintainability, or risk.
```

## Validation checklist

- Copilot summary matches the actual diff.
- Suggested issues are manually confirmed.
- Tests or checks were run where practical.
- Review comments are specific and actionable.
- Repeated feedback is captured for future reuse.

