#!/bin/bash

docker run --privileged -d -i -t -h 'cassandra' --name 'cassandra.sample' cassandra:latest
