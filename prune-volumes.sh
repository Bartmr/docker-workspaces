#!/usr/bin/env bash

set -e

docker volume prune --filter label!=chrome-data
