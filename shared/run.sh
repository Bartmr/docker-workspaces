#!/usr/bin/env bash
set -e

name=""
run_args=()

index=0
for i in "$@";
do

  if [ "$index" == "0" ]
  then
    name=$i
  else
    run_args+=($i)
  fi

  index=$(expr $index + 1)

done

set +e

docker inspect "$name:latest" > /dev/null 2>&1
LAST_RESULT=$?

set -e

if [ $LAST_RESULT -ne 0 ]
then
  docker build \
    --build-arg USER_UID=$(id -u) \
    --build-arg USER_GID=$(id -g) \
    --tag $name "../$name"
fi

#
#

mkdir -p "../$name/bin"

mkdir -p "../$name/data"
chmod go+rw "../$name/data"

#
#

xhost +"local:docker@"

set +e

docker container inspect $name  > /dev/null 2>&1
LAST_RESULT=$?

set -e

if [ $LAST_RESULT -ne 0 ]
then
  docker run \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -e DISPLAY=unix$DISPLAY \
    -v $(pwd)/data:/home/$name/docker-data \
    -v $(pwd)/bin:/home/$name/docker-bin \
    ${run_args[@]} \
    --name $name \
    $name
else
  docker start $name -a
fi
