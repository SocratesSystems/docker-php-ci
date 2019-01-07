FROM php:7.2-cli

RUN pecl install xdebug \
    && docker-php-ext-enable xdebug

RUN apt-get update && apt-get install -y \
    libpq-dev \
    libicu-dev \
    libxml2-dev \
    zlib1g-dev \
    && docker-php-ext-install pdo_pgsql zip xml soap intl
