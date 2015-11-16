#!/bin/bash

current=`pwd`

cd $current/master && sh ./build.sh
cd $current/slave && sh ./build.sh
