FROM php:8-fpm-alpine

ENV PHPUSER=laravel
ENV PHPGROUP=laravel

RUN addgroup -S ${PHPGROUP} && \
    adduser -S -G ${PHPGROUP} -s /bin/sh ${PHPUSER}

RUN sed -i "s/user www-data/user ${PHPUSER}/g" /usr/local/etc/php-fpm.d/www.conf
RUN sed -i "s/user www-data/group ${PHPGROUP}/g" /usr/local/etc/php-fpm.d/www.conf

RUN mkdir -p /var/www/html/public

RUN docker-php-ext-install pdo pdo_mysql

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

CMD ["docker-entrypoint.sh"]

CMD ["php-fpm","-y","/usr/local/etc/php-fpm.conf", "-R"]