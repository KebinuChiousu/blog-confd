#!/usr/bin/env bash

/usr/local/bin/confd -onetime -backend env
chmod +x /echo
#/echo
cat /echo.py
python3 /echo.py
