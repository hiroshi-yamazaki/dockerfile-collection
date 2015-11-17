#!/bin/bash

docker run --privileged -d -i -p 3306:3306 -p 6379:6379 -t -h 'redis-mariadb' --name 'redis-mariadb.sample' redis-mariadb:latest
