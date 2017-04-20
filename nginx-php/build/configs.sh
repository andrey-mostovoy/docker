#!/bin/sh

set -e

cp /build/configs/php-fpm.conf /etc/php/7.1/fpm/php-fpm.conf
cp /build/configs/php-fpm.www.conf /etc/php/7.1/fpm/pool.d/www.conf
cp /build/configs/php.ini /etc/php/7.1/cli/php.ini
cp /build/configs/php.ini /etc/php/7.1/fpm/php.ini
cp /build/configs/www.profile /var/www/.profile

chown www-data:www-data /var/www/.profile
