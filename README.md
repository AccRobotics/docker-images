# Docker images

This repository contains Dockerfiles and build automation for images used in AccRobotics projects. Images are built and published to the GitHub Container Registry (GHCR) for easy reuse across the organization.

👉 **[View all AccRobotics packages on GHCR](https://github.com/orgs/AccRobotics/packages)**

## Images

| Image Name                  | Dockerfile Location      | Description                                 |
|-----------------------------|-------------------------|---------------------------------------------|
| `ghcr.io/accrobotics/isaaclab` | `isaac/Dockerfile`        | Isaac Lab environment with PyTorch, IsaacLab, and dependencies |

## Usage

### Pulling from GHCR

You can pull any published image using Docker:

```sh
docker pull ghcr.io/accrobotics/isaaclab:latest
```

### Building and Pushing Locally

To build the image locally:

```sh
./build_and_push.sh
```

To build and push the image to GHCR (requires Docker login):

```sh
./build_and_push.sh --push
```

You must be logged in to GHCR with Docker to push:

```sh
echo $CR_PAT | docker login ghcr.io -u USERNAME --password-stdin
```
Where `CR_PAT` is a GitHub personal access token with `write:packages` scope.