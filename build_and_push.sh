#!/usr/bin/env bash
# build_and_push.sh - Build and optionally push Docker images for accrobotics projects
# Usage:
#   ./build_and_push.sh [--push]
#
# Builds Docker images defined in the script and tags them.
# If --push is provided, the images are pushed to GHCR (requires docker login).

set -euo pipefail

# --- Configuration ---
# Define images to build as an associative array
# Key: Directory containing the Dockerfile
# Value: Full image name and tag
declare -A IMAGES
IMAGES["isaac"]="ghcr.io/accrobotics/isaaclab:latest"
# Add more images here in the future, e.g.:
# IMAGES["another-app"]="ghcr.io/accrobotics/another-app:latest"

# --- Script Logic ---

# Check if --push flag is provided
PUSH_FLAG=false
if [[ "${1:-}" == "--push" ]]; then
    PUSH_FLAG=true
fi

# Loop over all defined images
for DOCKERFILE_DIR in "${!IMAGES[@]}"; do
    IMAGE_NAME="${IMAGES[$DOCKERFILE_DIR]}"
    DOCKERFILE_PATH="$DOCKERFILE_DIR/Dockerfile"

    echo "--------------------------------------------------"
    echo "Processing image: $IMAGE_NAME"
    echo "--------------------------------------------------"

    # Build the image
    echo "Building $IMAGE_NAME from $DOCKERFILE_PATH..."
    docker build -t "$IMAGE_NAME" -f "$DOCKERFILE_PATH" "$DOCKERFILE_DIR"
    echo "Build complete for $IMAGE_NAME."

    # Optionally push
    if [[ "$PUSH_FLAG" == true ]]; then
        echo "Pushing $IMAGE_NAME to GHCR..."
        docker push "$IMAGE_NAME"
        echo "Push complete for $IMAGE_NAME."
    else
        echo "Skipping push for $IMAGE_NAME. Use --push to enable."
    fi
    echo # Add a blank line for readability
done

if [[ "$PUSH_FLAG" == false ]]; then
    echo "All builds finished. Use --push to push images to GHCR."
fi
