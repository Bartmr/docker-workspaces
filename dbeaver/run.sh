#!/usr/bin/env bash

# https://blog.jessfraz.com/post/docker-containers-on-the-desktop/

docker inspect "dbeaver:latest" > /dev/null 2>&1
LAST_RESULT=$?

set -e

if [ $LAST_RESULT -ne 0 ]
then
  docker build --tag dbeaver .
fi

mkdir -p ./data

xhost +"local:docker@"

set +e

docker container inspect dbeaver  > /dev/null 2>&1
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
    -v $(pwd)/data:/usr/src/app \
    --name dbeaver \
    dbeaver
else
  docker start dbeaver
fi
