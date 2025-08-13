# Docker images (and automations)

This repository contains Dockerfiles and build automation for images used in AccRobotics projects. Images are built and published to the GitHub Container Registry (GHCR) for easy reuse across the organization.

## Images

| Image Name                  | Dockerfile Location      | Description                                 |
|-----------------------------|-------------------------|---------------------------------------------|
| `ghcr.io/accrobotics/isaaclab` | `isaac/Dockerfile`        | Isaac Lab environment with PyTorch, IsaacLab, and dependencies |

## Usage

You can pull any published image using Docker:

```sh
docker pull ghcr.io/accrobotics/isaaclab:latest
```

## Automation

GitHub Actions workflows automatically build and push images to GHCR on every push to `main`.
