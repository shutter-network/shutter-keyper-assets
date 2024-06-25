#!/usr/bin/env bash

set -eux

IMAGE_NAME=${IMAGE_NAME:-ghcr.io/shutter-network/assets}
TARGET="$1"
TAG="$2"

if [[ -z "$TARGET" || -z "$TAG" ]]; then
  echo "Usage: $0 <target-dir> <tag>"
  exit 1
fi

if [[ ! -d "$TARGET" ]]; then
  echo "Error: $TARGET is not a directory"
  exit 1
fi

docker build -t ghcr.io/shutter-network/assets:"$TARGET-$TAG" --build-arg "TARGET=$TARGET" --build-arg "TAG=$TAG" .
