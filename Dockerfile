FROM wordpress:latest

# Install necessary PHP extensions
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libzip-dev \
    unzip \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd zip mysqli

# Enable Apache mod_rewrite for WordPress permalinks
RUN a2enmod rewrite

# Set permissions for WordPress
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html

# Copy custom configuration if needed
# COPY ./wp/wp-config.php /var/www/html/wp-config.php

# Expose the default HTTP port
EXPOSE 80