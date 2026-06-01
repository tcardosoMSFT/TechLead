# Scenario 3: Technical Standards and Architecture Governance

## Goal

Use GitHub Copilot to scale technical standards across repositories and teams.

## Tech lead workflow

1. Define repository instructions for architecture, naming, testing, observability, and security.
2. Create reusable prompts for common implementation patterns.
3. Ask Copilot to check new code against team standards.
4. Convert recurring review issues into updated standards.
5. Keep guidance close to the codebase.

## Example standards areas

| Area | Example guidance |
| --- | --- |
| API design | Use consistent error responses, versioning, and validation. |
| Observability | Include structured logs, metrics, and trace correlation. |
| Security | Avoid secrets in code, validate inputs, enforce least privilege. |
| Testing | Add unit tests for business rules and integration tests for critical flows. |
| Reliability | Handle retries, timeouts, and idempotency explicitly. |

## Success indicators

- Fewer architecture drift issues.
- More consistent implementation patterns.
- Faster onboarding into team conventions.
- Better alignment between code review and written guidance.

