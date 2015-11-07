#!/bin/bash

docker run --privileged -i -d -h 'web2' -t --name 'web2.sample' nginx-web2:latest
