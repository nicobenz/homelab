# GitHub Actions Runner

## Project

[docker-github-actions-runner](https://github.com/myoung34/docker-github-actions-runner)

## Description

Two self-hosted GitHub Actions runners. Each registers against its own repo and can run Docker-based jobs via the host socket.

## Setup

Set these variables in Dockhand when deploying the stack:

| Variable | Description |
| --- | --- |
| `REPO_URL_1` | First repo to register a runner on, e.g. `https://github.com/nicobenz/homelab` |
| `REPO_URL_2` | Second repo to register a runner on |
| `ACCESS_TOKEN` | GitHub PAT with permission to register runners on both repos (`repo` for private repos, or `public_repo` + admin on each repo) |
| `RUNNER_WORKDIR_1` | Absolute host path for runner 1 job workspaces, e.g. `/volume1/dockhand/stacks/Home/github-actions-runner/tmp/runner-1`. Must be created before deploy; the same path is mounted into the container. |
| `RUNNER_WORKDIR_2` | Absolute host path for runner 2 job workspaces, e.g. `/volume1/dockhand/stacks/Home/github-actions-runner/tmp/runner-2` |

Create these folders in File Station before deploying (Synology will not create bind-mount sources):

- `data-1`
- `data-2`
- the directories you set as `RUNNER_WORKDIR_1` and `RUNNER_WORKDIR_2`

Each runner persists its config in its own `./data-*` folder so the containers can restart without re-registering. Workdirs should live under the stack folder so they survive DSM reboots (unlike `/tmp`).

If you already had a single-runner stack, move the existing `data` folder to `data-1` and rename `REPO_URL` / `RUNNER_WORKDIR` to `REPO_URL_1` / `RUNNER_WORKDIR_1` in Dockhand.
