#!/bin/bash

# This script is just for testing the teedy build against the atb gitlab container registry

mvn -Pprod -DskipTests clean install

# Build test image
LATEST_COMMIT_TIMESTAMP_AND_HASH=$(git log -1 --format=%cd_%h --date=format:'%Y-%m-%d')

DOCKER_IMAGE_TAG="gitlab.atb-bremen.de:5555/encore/deployment/dms:${LATEST_COMMIT_TIMESTAMP_AND_HASH}"

echo "building docker image with tag ${DOCKER_IMAGE_TAG}.."

docker build -t ${DOCKER_IMAGE_TAG} .

docker push ${DOCKER_IMAGE_TAG}