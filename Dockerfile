# docker build -t myphp-fpm .

FROM php:7.4-fpm

RUN apt-get -y update && apt-get install -y libssl-dev pkg-config libzip-dev unzip git \
locales curl wget mlocate tree gnupg gcc make autoconf libc-dev libpq-dev libonig-dev

RUN pecl install zlib zip && docker-php-ext-enable zip

RUN docker-php-ext-install pgsql
RUN docker-php-ext-install mbstring

RUN echo "fr_FR.UTF-8 UTF-8" > /etc/locale.gen && locale-gen
ENV LANG='fr_FR.UTF-8' LANGUAGE='fr_FR:en' LC_ALL='fr_FR.UTF-8'

RUN apt-get clean && rm -rf /var/lib/apt/lists/*

RUN cp /usr/local/etc/php/php.ini-production /usr/local/etc/php/php.ini
RUN echo "date.timezone=Europe/Paris" >> /usr/local/etc/php/php.ini

EXPOSE 9000
CMD ["php-fpm"]
