set -ex

apk add autoconf g++ make nginx redis
printf '\n' | pecl install redis-6.2.0 && docker-php-ext-enable redis

curl -O https://download.microsoft.com/download/e/4/e/e4e67866-dffd-428c-aac7-8d28ddafb39b/msodbcsql17_17.10.6.1-1_amd64.apk
printf '\n' | apk add --allow-untrusted msodbcsql17_17.10.6.1-1_amd64.apk
apk add unixodbc-dev
pecl install pdo_sqlsrv-5.11.1
docker-php-ext-enable pdo_sqlsrv
docker-php-ext-install pdo_mysql