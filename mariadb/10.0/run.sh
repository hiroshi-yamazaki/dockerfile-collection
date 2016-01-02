#!/bin/bash

docker run -t -i -d -p 3306:3306 -h 'mariadb100' --name 'mariadb100' mariadb:10.0
