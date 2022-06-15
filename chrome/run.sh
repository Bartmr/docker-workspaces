#!/usr/bin/env bash

# https://blog.jessfraz.com/post/docker-containers-on-the-desktop/

docker inspect "chrome:latest" > /dev/null 2>&1
INSPECT_RESULT=$?

set -e

if [ $INSPECT_RESULT -ne 0 ]
then
  echo "Build"
  docker build --build-arg TZ=$TZ --tag chrome .
fi

mkdir -p ./data/downloads

xhost +"local:docker@"

set +e

docker start chrome
START_RESULT=$?

set -e

if [ $START_RESULT -ne 0 ]
then
  # Might need to use 
  # -v /dev/shm:/dev/shm \

  docker run -d \
    --net host \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -e DISPLAY=unix$DISPLAY \
    -v $(pwd)/data/downloads:/home/chrome/Downloads \
    -v /home/chrome/chrome-data \
    --device /dev/snd \
    --device /dev/dri \
    --name chrome \
    chrome
fi
