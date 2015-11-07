#!/bin/bash

docker run --privileged -i -d -p 80:80 -h 'lv' --name 'lv.sample' -t nginx-lv:latest
