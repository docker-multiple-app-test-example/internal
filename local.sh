#!/usr/bin/env bash
set -e

docker-compose \
  -p ci \
  -f ../compose/docker-compose.yml \
  -f ./docker-compose.local.yml \
  up --build
