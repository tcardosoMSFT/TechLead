# Runbook 03: Technical Standards and Architecture Governance

## Objective

Use GitHub Copilot to scale technical standards and architecture guidance across teams, repositories, and pull requests.

## Best fit

Use this runbook when:

- Teams implement the same pattern in different ways.
- Architecture decisions are not consistently applied.
- Tech leads repeat the same feedback across PRs.
- New repositories need consistent engineering guidance.

## Environment prerequisites

| Requirement | Why it matters |
| --- | --- |
| Agreed engineering standards | Copilot needs explicit guidance to follow. |
| Repository-level documentation location | Keeps standards close to the code. |
| PR review process | Reinforces the standards in day-to-day work. |
| Tech lead ownership | Ensures standards remain practical and current. |

## Setup steps

1. Start with the template:

   ```powershell
   Copy-Item `
     .\templates\repository-instructions-template.md `
     .\repository-instructions.md
   ```

2. Fill in the standards for the target repository:

   - Architecture boundaries
   - API design
   - Testing expectations
   - Security requirements
   - Observability requirements
   - Pull request expectations

3. Ask Copilot to refine the instructions:

   ```text
   Improve these repository instructions for a real engineering team. Make them practical, enforceable in PR review, and specific to this codebase.
   ```

4. Add the final guidance to the repository location your team uses for Copilot instructions or engineering standards.

5. During PR review, ask Copilot to compare changes against the standards:

   ```text
   Review this change against our repository instructions. Identify only material deviations that affect architecture, testing, security, reliability, or maintainability.
   ```

## Governance loop

1. Capture recurring review feedback.
2. Convert repeated feedback into a standard.
3. Add examples of the preferred pattern.
4. Use Copilot to check future changes against the standard.
5. Remove or revise standards that are not useful.

## Suggested standards backlog

| Standard area | Example deliverable |
| --- | --- |
| API consistency | Error response contract and validation rules. |
| Observability | Required log fields and trace correlation pattern. |
| Security | Secret handling, dependency policy, and input validation. |
| Testing | Minimum test expectations by change type. |
| Reliability | Retry, timeout, and idempotency guidance. |

## Validation checklist

- Standards are written in plain, actionable language.
- Developers can apply the guidance without asking the tech lead.
- PR reviews reference the standards consistently.
- Repeated comments decrease over time.
- Standards are updated when architecture decisions change.

