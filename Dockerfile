FROM php:7.0-apache

RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng-dev \
        libxslt-dev \
        libicu-dev \
    && docker-php-ext-install -j$(nproc) mcrypt xsl zip intl pdo_mysql soap bcmath \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd \
    && apt-get install -y \
        git \
        nano \
	iproute2 \
	composer

RUN pecl install xdebug
RUN docker-php-ext-enable xdebug

COPY php.ini /tmp/php.ini
RUN cat /tmp/php.ini >> /usr/local/etc/php/php.ini

COPY magento.local.conf /etc/apache2/sites-available/

RUN a2ensite magento.local.conf
RUN a2enmod rewrite

