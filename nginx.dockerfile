FROM nginx:alpine

ENV NGINXUSER=laravel
ENV NGINXGROUP=laravel

RUN mkdir -p /var/www/html/public

ADD nginx/default.conf /etc/nginx/conf.d/default.conf

RUN sed -i "s/user www-data/user ${NGINXUSER}/g" /etc/nginx/nginx.conf

RUN addgroup -S ${NGINXGROUP} && \
    adduser -S -G ${NGINXGROUP} -s /bin/sh ${NGINXUSER}