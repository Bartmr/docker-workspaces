#!/usr/bin/env bash
set -euo pipefail


docker_workspaces_dir="$(dirname "$(dirname "$(realpath $0)")")"

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

docker inspect "bartmr-docker-workspaces/$name:latest" > /dev/null 2>&1
LAST_RESULT=$?

set -e

if [ $LAST_RESULT -ne 0 ]
then
  $docker_workspaces_dir/shared/rebuild.sh $name
fi

#
#

mkdir -p "$docker_workspaces_dir/$name/bin"

mkdir -p "$docker_workspaces_dir/$name/data"
chmod go+rw "$docker_workspaces_dir/$name/data"

#
#

xhost +"local:docker@"

set +e

docker container inspect "bartmr-docker-workspaces-$name"  > /dev/null 2>&1
LAST_RESULT=$?

set -e

if [ $LAST_RESULT -ne 0 ]
then
  docker run \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -e DISPLAY=unix$DISPLAY \
    -v "$docker_workspaces_dir/$name/data:/home/$name/docker-data" \
    -v "$docker_workspaces_dir/$name/bin:/home/$name/docker-bin" \
    ${run_args[@]} \
    --name "bartmr-docker-workspaces-$name" \
    "bartmr-docker-workspaces/$name"
else
  docker start "bartmr-docker-workspaces-$name" -a
fi
