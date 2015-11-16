#!/bin/bash

docker run --privileged -d -i -p 25432:5432 -t -h 'pgsql94slave' --name 'pgsql94slave.sample' pgsql94slave:latest
