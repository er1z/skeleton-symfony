#!/bin/sh

ENVS=`cat /tmp/env`
export $ENVS >> /dev/null

exec /usr/local/sbin/php-fpm -c /usr/local/etc/php/php-fpm.ini