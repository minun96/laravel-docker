FROM nginx:alpine

ENV NGINXUSER=laravel
ENV NGINXGROUP=laravel

RUN mkdir -p /var/www/html/public

ADD nginx/default.prod.conf /etc/nginx/conf.d/default.conf
ADD nginx/laravel-docker.test.pem /etc/nginx/certs/laravel-docker.test.pem
ADD nginx/laravel-docker.test-key.pem /etc/nginx/certs/laravel-docker.test-key.pem

RUN sed -i "s/user www-data/user ${NGINXUSER}/g" /etc/nginx/nginx.conf

RUN addgroup -S ${NGINXGROUP} && \
    adduser -S -G ${NGINXGROUP} -s /bin/sh ${NGINXUSER}