FROM nginx:alpine

RUN apk add --no-cache nginx-mod-http-lua shadow

COPY etc/nginx /etc/nginx

RUN chmod -R go+rx /etc/nginx \
    && chmod -R go+rwx /var/log/nginx \
    && chmod -R go+rwx /var/lib/nginx \
    && chmod -R go+rwx /var/tmp/nginx \
    && chmod -R go+rwx /var/run
