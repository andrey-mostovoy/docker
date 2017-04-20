#!/bin/sh

set -e

apt-get install -y language-pack-en-base
LC_ALL=en_US.UTF-8 add-apt-repository ppa:ondrej/php
apt-get update

apt-get install -y php7.1 php7.1-fpm php7.1-cgi php-apcu php-redis php7.1-curl php7.1-intl \
    php7.1-mysql php7.1-xsl php7.1-pgsql php7.1-mcrypt php7.1-gd php-imagick php7.1-mbstring \
    php-msgpack php-geoip geoip-database libzookeeper-mt2 php7.1-bcmath libgmp10 php-memcache

# dev packages: to be removed after build
apt-get install -y libzookeeper-mt-dev libmemcached-dev php7.1-dev make libpcre3-dev pkg-config \
    g++ unzip cmake libssl-dev libgmp-dev openssl php-pear

# memcached
curl -sL https://github.com/php-memcached-dev/php-memcached/archive/php7.zip  -o /tmp/memcached.zip && \
    unzip /tmp/memcached.zip -d /tmp/ && \
    rm /tmp/memcached.zip
cd /tmp/php-memcached-php7
phpize
./configure
make && make install
echo 'extension=memcached.so' > /etc/php/7.1/mods-available/memcached.ini
ln -sf /etc/php/7.1/mods-available/memcached.ini /etc/php/7.1/fpm/conf.d/25-memcached.ini
ln -sf /etc/php/7.1/mods-available/memcached.ini /etc/php/7.1/cli/conf.d/25-memcached.ini

# lzf
curl -sL https://github.com/php/pecl-file_formats-lzf/archive/LZF-1.6.5.tar.gz | tar -xz -C /tmp
cd /tmp/pecl-file_formats-lzf-LZF-1.6.5
phpize
./configure
make && make install
echo 'extension=lzf.so' > /etc/php/7.1/mods-available/lzf.ini
ln -sf /etc/php/7.1/mods-available/lzf.ini /etc/php/7.1/fpm/conf.d/20-lzf.ini
ln -sf /etc/php/7.1/mods-available/lzf.ini /etc/php/7.1/cli/conf.d/20-lzf.ini

# removing dev packages
apt-get remove -y libzookeeper-mt-dev php7.1-dev make libpcre3-dev pkg-config g++ unzip cmake \
    libssl-dev libgmp-dev php-pear
apt-get autoremove -y
