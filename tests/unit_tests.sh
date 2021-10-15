#!/bin/bash

function finish {
  echo "Cleaning up docker-compose..."
  docker-compose -f docker-compose.tests.yml down --remove-orphans
  echo "Done!"
}
trap finish EXIT

docker-compose -f docker-compose.tests.yml build web
docker-compose -f docker-compose.tests.yml run web pytest tests/