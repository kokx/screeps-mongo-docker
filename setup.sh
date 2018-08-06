#!/bin/sh

docker-compose build

docker-compose up -d

sleep 5

docker-compose exec screeps ./reset-data.sh

docker-compose stop
