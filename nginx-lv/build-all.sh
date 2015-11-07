#!/bin/bash

current=`pwd`

cd $current/lv && sh ./build.sh
cd $current/web1 && sh ./build.sh
cd $current/web2 && sh ./build.sh
