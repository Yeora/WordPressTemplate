FROM wordpress:php7.4-apache
MAINTAINER MB

ARG user_id=1000

RUN apt-get update && apt-get install -y \
                libfreetype6-dev \
                wget \
                subversion \
                libjpeg62-turbo-dev \
                libpng-dev \
                zip \
                libzip-dev \
                default-mysql-client \
                && chown www-data /var/www/ -R \
                && usermod -u $user_id www-data \
                && pecl install xdebug \
                && curl -O https://phar.phpunit.de/phpunit-7.5.9.phar \
                && chmod +x phpunit-7.5.9.phar \
                && chown www-data phpunit-7.5.9.phar \
                && mv phpunit-7.5.9.phar /usr/local/bin/phpunit \
                && curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
                && chmod +x wp-cli.phar \
                && chown www-data wp-cli.phar \
                && mv wp-cli.phar /usr/local/bin/wp

COPY docker/php/php.ini /usr/local/etc/php
COPY ./wp-completion.bash /var/tmp/wp-completion.bash
COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer
COPY ./preparation/composer.json /var/www/html

# WP CLI Tab Complete
USER www-data
RUN echo "source /var/tmp/wp-completion.bash" >> ~/.bashrc