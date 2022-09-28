#!/usr/bin/env bash
set -e 

docker volume list --filter dangling=true --quiet | grep -v "^bartmr-docker-workspaces" | xargs docker volume rm
