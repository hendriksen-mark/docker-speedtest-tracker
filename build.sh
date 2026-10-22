#!/bin/bash

# Set default tag
TAG="speedtest-tracker-docker"

# Determine the release tag
RELEASE_TAG=${1:-current}
SOURCE_REPOSITORY=${SOURCE_REPOSITORY:-alexjustesen/speedtest-tracker}
BUILD_VERSION=${BUILD_VERSION:-$RELEASE_TAG}

# Build the Docker image with dynamic tagging
docker buildx build \
    --build-arg RELEASE_TAG=${RELEASE_TAG} \
    --build-arg SOURCE_REPOSITORY=${SOURCE_REPOSITORY} \
    --build-arg BUILD_VERSION=${BUILD_VERSION} \
    -t ${TAG}:${RELEASE_TAG} \
    .

echo "Image built and tagged as ${TAG}:${RELEASE_TAG}"
