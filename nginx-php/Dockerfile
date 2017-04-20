FROM phusion/baseimage

MAINTAINER Andrey Mostovoy <stalk.4.me@gmail.com>

ADD ./build /build

RUN /build/env.sh
RUN /build/ssh.sh
RUN /build/php.sh
RUN /build/nginx.sh
RUN /build/configs.sh
RUN /build/services.sh
RUN /build/cleanup.sh

RUN chown www-data:www-data -R /var/www

EXPOSE 80
