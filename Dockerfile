FROM php:7.4-fpm-alpine

EXPOSE 80

COPY install.sh /
RUN sh /install.sh

COPY nginx.conf /etc/nginx/
COPY redis.conf /etc/
COPY php.ini /usr/local/etc/php/
COPY www.conf /usr/local/etc/php-fpm.d/

COPY entrypoint.sh /
ENTRYPOINT ["sh","/entrypoint.sh"]