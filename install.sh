set -ex


apk add autoconf g++ make

# nginx
apk add nginx

# redis
apk add redis

# ext-redis
printf '\n' | pecl install redis-6.2.0 && docker-php-ext-enable redis

# ext-mssql
curl https://download.microsoft.com/download/e/4/e/e4e67866-dffd-428c-aac7-8d28ddafb39b/msodbcsql17_17.10.6.1-1_amd64.apk > ms.apk
printf '\n' | apk add --allow-untrusted ms.apk
rm ms.apk

apk add unixodbc-dev

pecl install pdo_sqlsrv-5.10.1

docker-php-ext-enable pdo_sqlsrv

# ext-mysql
docker-php-ext-install pdo_mysql

# ssh
apk add openssh-server
/usr/bin/ssh-keygan -A
echo 'root:root' | chpasswd