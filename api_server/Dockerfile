FROM webdevops/php-nginx:latest

COPY app /app
COPY cron/scramble /opt/docker/etc/cron/root

WORKDIR /app

RUN php composer.phar install

RUN php artisan migrate

EXPOSE 80 443