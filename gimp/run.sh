#!/usr/bin/env bash

# https://blog.jessfraz.com/post/docker-containers-on-the-desktop/

docker inspect "gimp:latest" > /dev/null 2>&1
INSPECT_RESULT=$?

set -e

if [ $INSPECT_RESULT -ne 0 ]
then
  echo "Build"
  docker build --build-arg TZ=$TZ --tag gimp .
fi

mkdir -p ./data

xhost +"local:docker@"

set +e

docker start gimp
START_RESULT=$?

set -e

if [ $START_RESULT -ne 0 ]
then
  docker run -d \
    --net host \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -e DISPLAY=unix$DISPLAY \
    -v $(pwd)/data:/usr/src/app \
    --device /dev/dri \
    --name gimp \
    gimp
fi
