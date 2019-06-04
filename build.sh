#!/bin/bash

set -xe

source targets.cfg

for i in $TARGETS; do
  repo=$(echo $i|cut '-d|' -f 1)
  tag=$(echo $i|cut '-d|' -f 2)
  url=$(echo $i|cut '-d|' -f 3)
  checksum=$(echo $i|cut '-d|' -f 4)
  filename=$(basename "$url")
  buildah bud --isolation rootless \
              -t $REGISTRY/$REGISTRY_USER/$repo:$tag \
              --build-arg SRC_FILE=$filename \
              --build-arg DEST_FILE=disk.qcow2 \
              cci
done

