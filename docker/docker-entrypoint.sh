#!/usr/bin/env bash

/usr/local/bin/confd -onetime -backend env
/usr/bin/chmod +x /echo
/echo
