# Day 43 – Jobs, Steps, Env Vars & Conditionals

## Task 1: Multi-Job Workflow
Create `.github/workflows/multi-job.yml` with 3 jobs:
- `build` — prints "Building the app"
- `test` — prints "Running tests"
- `deploy` — prints "Deploying"

Make `test` run only **after** `build` succeeds.
Make `deploy` run only **after** `test` succeeds.

**Verify:** Check the workflow graph in the Actions tab — does it show the dependency chain? 

> Yes, it does showw the dependency chain.

[Multi-Job](https://github.com/Habeebwasif/github-actions-practice/blob/main/.github/workflows/multi-job.yml)

