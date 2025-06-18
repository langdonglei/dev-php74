FROM php:7.4-fpm-alpine

EXPOSE 80 22

COPY entrypoint.sh /
ENTRYPOINT ["sh","/entrypoint.sh"]

COPY install.sh /
RUN sh /install.sh

COPY config/nginx.conf /etc/nginx/
COPY config/redis.conf /etc/
COPY config/php.ini /usr/local/etc/php/
COPY config/www.conf /usr/local/etc/php-fpm.d/
COPY config/sshd_config /etc/ssh/