# Runbook 04: Onboarding and Knowledge Transfer

## Objective

Use GitHub Copilot to help new engineers understand the codebase, delivery workflow, and first contribution path faster.

## Best fit

Use this runbook when:

- New engineers take too long to make their first contribution.
- Important knowledge lives only with senior engineers.
- Legacy code is hard to explain.
- Teams need repeatable onboarding material.

## Environment prerequisites

| Requirement | Why it matters |
| --- | --- |
| Local repository setup | New engineers need to run and test the code. |
| Access to required docs and repos | Prevents blocked onboarding. |
| Defined first contribution path | Makes onboarding measurable and safe. |
| Tech lead review | Ensures generated explanations are accurate. |

## Setup steps

1. Clone and open the target repository.

2. Ask Copilot for a repository explanation:

   ```text
   Explain this repository to a new engineer. Focus on the main runtime flow, key modules, local development commands, test strategy, and the safest first contribution.
   ```

3. Ask Copilot to generate a code walkthrough:

   ```text
   Create a 30-minute onboarding walkthrough for this codebase. Include files to read, concepts to understand, commands to run, and a small safe change to make.
   ```

4. Ask Copilot to map important flows:

   ```text
   Trace the main request or execution flow through the codebase. List the files involved and explain what each one does.
   ```

5. Have the tech lead review the generated material.

6. Publish the final onboarding guide in the team's documentation location.

## Suggested onboarding package

| Artifact | Purpose |
| --- | --- |
| Repository overview | Explains what the system does and how it is structured. |
| Local setup guide | Helps the engineer run the app and tests. |
| Main flow walkthrough | Explains how important features work. |
| First contribution task | Gives a safe, meaningful first PR. |
| Troubleshooting guide | Captures common setup and test issues. |

## First contribution examples

- Add a missing unit test for a simple business rule.
- Improve error message coverage.
- Add structured logging to a low-risk path.
- Update documentation for a known setup issue.
- Refactor a small duplicated helper with tests.

## Tech lead operating rhythm

1. Create the onboarding guide once per major repository.
2. Ask each new engineer to follow it.
3. Capture confusing steps as issues.
4. Update the guide after the first PR.
5. Review onboarding effectiveness monthly.

## Validation checklist

- A new engineer can run the project locally.
- The guide identifies the most important files and flows.
- The first contribution is safe and reviewable.
- The generated explanations were reviewed by someone familiar with the system.
- Onboarding feedback is incorporated into the guide.

