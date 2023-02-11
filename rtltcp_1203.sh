#!/usr/bin/env bash

echo "-- Script starting.";
rtl_tcp -d 00003000 -f 146000000 -s 2048000 -g 35 -a 127.0.0.1 -p 1230 -N

echo "-- Script exiting";
