#!/usr/bin/env bash

name=$1

docker container rm $name

set -e 
  
docker build \
  --build-arg USER_UID=$(id -u) \
  --build-arg USER_GID=$(id -g) \
  --tag $name "../$name"
