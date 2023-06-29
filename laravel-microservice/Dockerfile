#####Building the Laravel application
FROM composer:2 AS builder

WORKDIR /app
COPY . .
RUN composer install --no-dev --optimize-autoloader
RUN php artisan optimize

####Creating the final lightweight image
FROM php:7.4-apache

WORKDIR /var/www/html

####Copying the built Laravel application from the building stage
COPY --from=builder /app .

####Laravel app will be running below port
EXPOSE 2728

####Command to run the Laravel app
CMD ["apache2-foreground"]

