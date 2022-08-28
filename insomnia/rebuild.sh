#!/usr/bin/env bash

docker container rm insomnia

set -e

docker build \
    --build-arg USER_UID=$(id -u) \
    --build-arg USER_GID=$(id -g) \
    --tag insomnia .
