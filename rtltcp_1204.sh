#!/usr/bin/env bash

echo "-- Script starting.";
rtl_tcp -d 00004000 -f 433000000 -s 2048000 -g 35 -a 127.0.0.1 -p 1240 -N

echo "-- Script exiting";
