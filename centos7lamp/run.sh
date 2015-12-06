#!/bin/sh

docker run --privileged -d -i -p 20022:22 -p 3306:3306 -p 80:80 -h centos7lamp --name "centos7lamp.sample" -t centos7lamp:latest 
