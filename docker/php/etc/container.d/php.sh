#!/bin/sh

ENVS=`cat /tmp/env`
export ${ENVS} > /dev/null

/usr/local/bin/php7 "$@"
