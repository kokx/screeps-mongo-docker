#!/bin/sh

docker-compose build

docker-compose up -d

docker-compose exec screeps ./reset-data.sh

docker-compose stop
