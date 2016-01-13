#!/bin/bash

docker-compose build cco-tools
docker-compose up -d cco-mysql cco-postgres
docker-compose run cco-tools

