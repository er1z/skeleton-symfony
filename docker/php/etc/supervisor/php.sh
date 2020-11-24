#!/bin/sh

ENVS=`cat /tmp/env`
export $ENVS

exec /usr/local/bin/php $@
