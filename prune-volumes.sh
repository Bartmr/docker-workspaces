#!/usr/bin/env bash

set -e

docker volume list --filter dangling=true --format "{{.Name}}" | grep -v "chrome-data" | xargs docker volume rm
