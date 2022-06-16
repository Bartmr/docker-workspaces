#!/usr/bin/env bash

# https://blog.jessfraz.com/post/docker-containers-on-the-desktop/

docker inspect "chrome:latest" > /dev/null 2>&1
LAST_RESULT=$?

set -e

if [ $LAST_RESULT -ne 0 ]
then
  docker build --tag chrome .
fi

mkdir -p ./data
chmod go+rw ./data

xhost +"local:docker@"

set +e

docker container inspect chrome  > /dev/null 2>&1
LAST_RESULT=$?

set -e

if [ $LAST_RESULT -ne 0 ]
then
  # Might need to use 
  # -v /dev/shm:/dev/shm \

  docker run -d \
    --net host \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -e DISPLAY=unix$DISPLAY \
    -v $(pwd)/data/downloads:/home/chrome/data \
    -v /home/chrome/chrome-data \
    --device /dev/snd \
    --device /dev/dri \
    --name chrome \
    chrome
else
  docker start chrome
fi
