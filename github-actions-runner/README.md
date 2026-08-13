# GitHub Actions Runner

## Project

[docker-github-actions-runner](https://github.com/myoung34/docker-github-actions-runner)

## Description

Self-hosted GitHub Actions runner. Registers against a single repo and can run Docker-based jobs via the host socket.

## Setup

Set these variables in Dockhand when deploying the stack:

| Variable | Description |
| --- | --- |
| `REPO_URL` | Repo to register the runner on, e.g. `https://github.com/nicobenz/homelab` |
| `ACCESS_TOKEN` | GitHub PAT with permission to register runners (`repo` for private repos, or `public_repo` + admin on the repo) |
| `RUNNER_WORKDIR` | Absolute host path for job workspaces, e.g. `/volume1/dockhand/stacks/Home/github-actions-runner/tmp/runner`. Must be created before deploy; the same path is mounted into the container. |

Create these folders in File Station before deploying (Synology will not create bind-mount sources):

- `data`
- the directory you set as `RUNNER_WORKDIR`

Runner config is persisted in `./data` so the container can restart without re-registering. The workdir should live under the stack folder so it survives DSM reboots (unlike `/tmp`).
