# docker build -t myphp-fpm .

FROM php:7.4-fpm

RUN apt-get -y update && apt-get install -y libssl-dev pkg-config libzip-dev \
locales gnupg gcc make autoconf libc-dev libpq-dev libonig-dev

RUN docker-php-ext-install pgsql
RUN docker-php-ext-install mbstring
RUN apt-get clean && rm -rf /var/lib/apt/lists/*
RUN cp /usr/local/etc/php/php.ini-production /usr/local/etc/php/php.ini
RUN echo "date.timezone=Europe/Paris" >> /usr/local/etc/php/php.ini

EXPOSE 9000
CMD ["php-fpm"]
