#!/bin/bash

docker run --privileged -d -i -p 3306:3306 -t -h 'mariadb' --name 'mariadb.sample' mariadb:latest
