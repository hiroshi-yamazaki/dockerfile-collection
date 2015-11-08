#!/bin/bash

docker run --privileged -i -d -p 80:80 -h 'lb' --name 'lb.sample' -t nginx-lb:latest
