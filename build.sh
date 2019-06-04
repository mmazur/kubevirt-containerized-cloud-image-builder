#!/bin/bash

set -e

echo "Logging into $REGISTRY"
echo "$REGISTRY_PASSWORD" | podman login -u "$REGISTRY_USER" --password-stdin "$REGISTRY"

set -xe

buildah bud -t $REGISTRY/$REGISTRY_USER/fedora:30 --build-arg OS_VER=30 image

podman push $REGISTRY/$REGISTRY_USER/fedora:30 $REGISTRY/$REGISTRY_USER/fedora:30

