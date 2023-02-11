#!/usr/bin/env bash

echo "-- Script starting.";
rtl_tcp -d 00005000 -f 436000000 -s 2048000 -g 35 -a 127.0.0.1 -p 1250 -N

echo "-- Script exiting";
