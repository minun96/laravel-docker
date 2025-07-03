#!/bin/sh
# assicuro ownership e permessi ad ogni avvio
chown -R laravel:laravel /var/www/html/storage /var/www/html/bootstrap/cache
chmod -R 775 /var/www/html/storage /var/www/html/bootstrap/cache

# poi lancio php-fpm con l’utente corretto
exec php-fpm -y /usr/local/etc/php-fpm.conf -R