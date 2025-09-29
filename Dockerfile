FROM php:8.2-fpm-alpine

RUN apk add --no-cache \
    icu-dev \
    libxml2-dev \
    oniguruma-dev \
    zip \
    unzip \
    git \
    curl \
    postgresql-dev \
    jpeg-dev \
    libpng-dev \
    freetype-dev

RUN docker-php-ext-install intl pdo pdo_pgsql mbstring xml opcache bcmath pcntl gd exif

COPY --from=composer:2.6 /usr/bin/composer /usr/bin/composer

WORKDIR /var/www/html

COPY . /var/www/html

ENV COMPOSER_ALLOW_SUPERUSER=1
RUN composer install --no-dev --optimize-autoloader

RUN chown -R www-data:www-data /var/www/html

EXPOSE 9000
CMD ["php-fpm"]
