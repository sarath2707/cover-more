####Building the Flask microservice
FROM python:3.9 as flask-builder
WORKDIR /app/flask-microservice
COPY flask-microservice/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY flask-microservice/ .
EXPOSE 2727
CMD ["python", "app.py"]

####Building the PHP Laravel microservice
FROM php:8.0-apache as laravel-builder
WORKDIR /app/laravel-microservice
COPY laravel-microservice/ .
RUN apt-get update && apt-get install -y \
    libonig-dev \
    libzip-dev \
    zip \
    unzip
RUN docker-php-ext-install mbstring zip
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN composer install --no-dev --optimize-autoloader
RUN chown -R www-data:www-data storage bootstrap/cache
EXPOSE 2728
CMD ["apache2-foreground"]

#####Building the React microservice
FROM node:14 as react-builder
WORKDIR /app/react-microservice
COPY react-microservice/ .
RUN npm install
RUN npm run build
EXPOSE 2729
CMD ["npm", "start"]

#####Creating a runtime image and copy to built the microservices
FROM python:3.9
WORKDIR /app
COPY --from=flask-builder /app/flask-microservice /app/flask-microservice
COPY --from=laravel-builder /app/laravel-microservice /app/laravel-microservice
COPY --from=react-builder /app/react-microservice /app/react-microservice

####Defining the startup command
CMD ["python", "/app/flask-microservice/app.py"]

