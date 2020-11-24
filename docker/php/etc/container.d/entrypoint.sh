#!/bin/sh

usermod --non-unique --uid $APP_CONTAINER_UID app
groupmod --non-unique --gid $APP_CONTAINER_GID app

# environment variables workaround
/etc/container.d/process-env.sh > /tmp/env

ln -s /app/node_modules/@symfony/webpack-encore/bin/encore.js /usr/bin/encore

su-exec app /etc/container.d/exec.sh

/usr/bin/supervisord --config /etc/supervisor/supervisord.conf