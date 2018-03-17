#!/usr/bin/env bash
set -e

echo "Starting docker-compose..."
docker-compose \
  -p ci \
  -f ../compose/docker-compose.yml \
  -f ./docker-compose.yml \
  up -d --build

echo "Waiting for tests end..."
result=$(docker wait ci_test_internal_1)

if [ $result != "0" ]
then
  echo "Tests exited with code 1. See:"
  echo ""
  echo "    docker logs ci_test_internal_1"
  echo ""
  exit 1
fi

echo "Tests passed"
