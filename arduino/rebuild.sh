#!/usr/bin/env bash

docker container rm arduino

set -e

docker build \
    --build-arg USER_UID=$(id -u) \
    --build-arg USER_GID=$(id -g) \
    --tag arduino .
