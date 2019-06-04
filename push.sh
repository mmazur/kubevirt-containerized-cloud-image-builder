#!/bin/bash

set -e

source targets.cfg

echo "Logging into $REGISTRY"
echo "$REGISTRY_PASSWORD" | podman login -u "$REGISTRY_USER" --password-stdin "$REGISTRY"

set -xe

for i in $TARGETS; do
  repo=$(echo $i|cut '-d|' -f 1)
  tag=$(echo $i|cut '-d|' -f 2)
  podman push $REGISTRY/$REGISTRY_USER/$repo:$tag
done

