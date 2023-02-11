#!/usr/bin/env bash

echo "-- Script starting.";
rtl_tcp -d 00001000 -f 50974000 -s 2048000 -g 35 -a 127.0.0.1 -p 1210 -N

echo "-- Script exiting";
