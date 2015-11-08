#!/bin/bash

docker run --privileged -i -d -h 'web1' -t --name 'web1.sample' nginx-web1:latest
