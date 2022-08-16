#!/bin/bash

mvn -Pprod -DskipTests -DencorePortalRedirectUrl=https://test.encorebim.eu clean install

# Build test image
LATEST_COMMIT_TIMESTAMP=$(git log -1 --format=%cd_%h --date=format:'%Y-%m-%d')

DOCKER_IMAGE_TAG="gitlab.atb-bremen.de:5555/encore/deployment/dms:${LATEST_COMMIT_TIMESTAMP}_TEST"

echo "building docker image with tag ${DOCKER_IMAGE_TAG}.."

docker build -t ${DOCKER_IMAGE_TAG} .

docker push ${DOCKER_IMAGE_TAG}