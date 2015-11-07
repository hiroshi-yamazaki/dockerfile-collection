#!/bin/bash

current=`pwd`

cd lv && sh ./build.sh

cd $current
cd web1 && sh ./build.sh

cd $current
cd web2 && sh ./build.sh
