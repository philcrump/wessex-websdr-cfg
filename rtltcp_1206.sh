#!/usr/bin/env bash

echo "-- Script starting.";
rtl_tcp -d 00006000 -L -f 619000000 -s 2048000 -g 35 -a 127.0.0.1 -p 1260 -N

echo "-- Script exiting";
