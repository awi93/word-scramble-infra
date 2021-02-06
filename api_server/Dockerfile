FROM webdevops/php-nginx:7.4

COPY migration-entry.sh /opt/docker/provision/entrypoint.d
COPY cron/scramble /opt/docker/etc/cron/root

RUN apt-get update && apt-get install -y unzip

RUN curl https://codeload.github.com/awi93/word-scramble-api/zip/v1.0.32 --output app.zip

RUN echo "A" | unzip app.zip -d app

RUN mv /app/word-scramble-api-1.0.32/.[!.]* /app
RUN mv /app/word-scramble-api-1.0.32/* /app
RUN rm -r /app/word-scramble-api-1.0.32

RUN rm app.zip

WORKDIR /app

RUN mv .env.example .env

USER root

RUN chmod a+w ./ -R

RUN php composer.phar install

EXPOSE 80 443