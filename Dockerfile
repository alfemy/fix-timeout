FROM php:7.4-apache
# Show all errors
RUN echo "error_reporting = E_ALL" >> /usr/local/etc/php/conf.d/docker-php-error-reporting.ini

# Display errors and logs errors to a stderr stream
RUN echo "display_errors = On" >> /usr/local/etc/php/conf.d/docker-php-error-reporting.ini
RUN echo "log_errors = On" >> /usr/local/etc/php/conf.d/docker-php-error-reporting.ini
RUN echo "error_log = /dev/stderr" >> /usr/local/etc/php/conf.d/docker-php-error-reporting.ini


# Copy long-running script and change permissions
COPY long-running.php /var/www/html/long-running.php
COPY index.php /var/www/html/index.php
RUN chmod 755 /var/www/html/*.php

# Copy docker-entrypoint.sh with execution permissions
COPY docker-entrypoint.sh /usr/local/bin/

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["apache2-foreground"]
