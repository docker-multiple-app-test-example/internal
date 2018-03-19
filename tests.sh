#!/usr/bin/env bash
set -e

echo "Starting docker-compose..."
docker-compose \
  -p ci \
  -f ../compose/docker-compose.yml \
  -f ./docker-compose.local.yml \
  -f ./docker-compose.test.yml \
  up -d --build

echo "Waiting for tests end..."
result=$(docker wait ci_test_internal_1)
echo $(docker logs ci_test_internal_1)

echo "Stopping containers before exit..."
docker stop $(docker ps -q) > /dev/null

if [ $result != "0" ]
then
  exit 1
fi
