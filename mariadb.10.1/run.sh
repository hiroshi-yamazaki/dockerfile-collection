#!/bin/bash

docker run -t -i -d -p 3306:3306 -h 'mariadb101' --name 'mariadb101' mariadb:10.1
