#!/bin/bash

docker run --privileged -d -i -p 6379:6379 -t -h 'redis' --name 'redis.sample' redis:latest
