#!/usr/bin/env bash

# https://blog.jessfraz.com/post/docker-containers-on-the-desktop/

docker inspect "gimp:latest" > /dev/null 2>&1
LAST_RESULT=$?

set -e

if [ $LAST_RESULT -ne 0 ]
then
  docker build --build-arg TZ=$TZ --tag gimp .
fi

mkdir -p ./data

xhost +"local:docker@"

set +e

docker container inspect gimp  > /dev/null 2>&1
LAST_RESULT=$?

set -e

if [ $LAST_RESULT -ne 0 ]
then
  docker run -d \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -e DISPLAY=unix$DISPLAY \
    -v $(pwd)/data:/usr/src/app \
    --device /dev/dri \
    --name gimp \
    gimp
else
  docker start gimp
fi
