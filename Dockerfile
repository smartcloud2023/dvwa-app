FROM php:8.3-apache

# Enable Apache modules
RUN a2enmod rewrite

# Install system packages needed by DVWA
RUN apt-get update && apt-get install -y \
    git \
    mariadb-client \
    libpng-dev \
    && docker-php-ext-install mysqli pdo pdo_mysql gd

# Download DVWA
RUN git clone https://github.com/digininja/DVWA.git /var/www/html/DVWA

# Fix the MySQL.php file by removing 'IF NOT EXISTS' in the ALTER TABLE queries
RUN sed -i "s/ADD COLUMN IF NOT EXISTS role/ADD COLUMN role/" /var/www/html/DVWA/dvwa/includes/DBMS/MySQL.php \
    && sed -i "s/ADD COLUMN IF NOT EXISTS account_enabled/ADD COLUMN account_enabled/" /var/www/html/DVWA/dvwa/includes/DBMS/MySQL.php

# Set permissions
RUN chown -R www-data:www-data /var/www/html/DVWA && \
    chmod -R 755 /var/www/html/DVWA

# Copy custom config (will create this file next)
COPY config.inc.php /var/www/html/DVWA/config/config.inc.php

# Apache DocumentRoot
WORKDIR /var/www/html/DVWA
