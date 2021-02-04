FROM webdevops/php-nginx:7.4

COPY cron/scramble /opt/docker/etc/cron/root

RUN apt-get update && apt-get install -y unzip

RUN curl https://codeload.github.com/awi93/word-scramble-api/zip/v1.0.21 --output app.zip

RUN echo "A" | unzip app.zip -d app

RUN mv /app/word-scramble-api-1.0.21/.[!.]* /app
RUN mv /app/word-scramble-api-1.0.21/* /app
RUN rm -r /app/word-scramble-api-1.0.21

RUN rm app.zip

ENV DB_CONNECTION="pgsql"
ENV DB_HOST="128.199.217.247"
ENV DB_PORT="5432"
ENV DB_DATABASE="word_scramble"
ENV DB_USERNAME="postgres"
ENV DB_PASSWORD="postgres"

WORKDIR /app

RUN mv .env.example .env

USER root

RUN chmod a+w ./ -R

RUN php composer.phar install

RUN echo "yes" | php artisan migrate

RUN php artisan passport:install

EXPOSE 80 443