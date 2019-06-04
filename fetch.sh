#!/bin/bash

set -xe

source targets.cfg

if [ ! -e images ]; then
  mkdir images
fi

for i in $TARGETS; do
  repo=$(echo $i|cut '-d|' -f 1)
  tag=$(echo $i|cut '-d|' -f 2)
  url=$(echo $i|cut '-d|' -f 3)
  checksum=$(echo $i|cut '-d|' -f 4)
  filename=$(basename "$url")
  if [ -e "images/$filename" ]; then
    echo "$checksum images/$filename"|sha256sum -c --strict - || rm -f "images/$filename"
  fi
  if [ ! -e "images/$filename" ]; then
    curl -g -L "$url" -o images/$filename
    echo "$checksum images/$filename"|sha256sum -c --strict - || exit 1
  fi
done

