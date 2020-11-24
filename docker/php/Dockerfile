FROM php:7.4-fpm-alpine

# https://github.com/karthanistyr/riot-web-docker/commit/71cfa7a7da457716daf5e0824c001122514b1ea5
COPY ./patch_pamd_chpasswd /etc/pam.d/chpasswd

RUN apk add --update --no-cache php7-xdebug zsh git shadow curl curl-dev postgresql-dev libpng-dev \
    libmcrypt-dev nodejs nodejs-npm imagemagick-dev autoconf build-base bash su-exec rabbitmq-c-dev py-pip make \
    && docker-php-ext-install bcmath gd intl opcache pdo pdo_pgsql sockets \
    && pecl install amqp imagick xdebug \
    && docker-php-ext-enable amqp imagick \
    && echo "root:root" | chpasswd \
    && pip install supervisor \
# Symfony's encore requires these one
    && npm install -g yarn

RUN addgroup -S app && adduser -S -G app -s /bin/zsh app \
    && echo -e "app\napp" | passwd app

RUN curl -s https://getcomposer.org/installer | php \
    && mv composer.phar /usr/bin/composer

COPY etc /etc
COPY ./usr/local/etc /usr/local/etc

RUN (su-exec app sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" || :) \
    && ln -s /etc/container.d/php-xdebug.sh /usr/bin/phpxd \
    && chmod 0777 /opt \
    && mv /usr/local/bin/php /usr/local/bin/php7 \
    && ln -s /etc/container.d/php.sh /usr/local/bin/php \
    && ln -s /etc/container.d/php.sh /usr/bin/php \
    && chmod a+rx /etc/container.d/*.sh \
    && chmod a+rx /etc/supervisor/fpm.sh \
    && chmod -R a+rx /usr/local/etc/php \
    && cp /etc/home_prototype/.zshrc /home/app/.zshrc

EXPOSE 80
WORKDIR /app

ENTRYPOINT ["/etc/container.d/entrypoint.sh"]
