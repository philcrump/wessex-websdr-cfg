#!/usr/bin/env bash

echo "-- Script starting.";
rtl_tcp -d 00002000 -f 144000000 -s 2048000 -g 35 -a 127.0.0.1 -p 1220 -N

echo "-- Script exiting";
