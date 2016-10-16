FROM ubuntu:16.04

RUN \
  apt-get update

# Install apache
RUN \
    apt-get install -y \
        apache2 \
    && a2enmod actions ssl rewrite headers expires

# Install php environment
RUN apt-get install -y \
        php7.0 \
        php7.0-cli \
        php7.0-json \
        php7.0-intl \
        php7.0-curl \
        php7.0-mysql \
        php7.0-mcrypt \
        php7.0-gd \
        php7.0-sqlite3 \
        php7.0-ldap \
        php7.0-opcache \
        php7.0-soap \
        php7.0-zip \
        php7.0-mbstring \
        php7.0-bcmath \
        php7.0-xmlrpc \
        php7.0-xsl \
        php7.0-bz2 \
        php-apcu \
        php-redis \
        php-memcached \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin/ --filename=composer

# Install MySQL.
ENV MYSQL_PASS=root

RUN \
  apt-get install -y mysql-server && \

EXPOSE 80 443 3306
