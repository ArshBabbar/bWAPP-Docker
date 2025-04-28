FROM php:7.4-apache

RUN apt-get update && apt-get install -y unzip wget

RUN wget https://sourceforge.net/projects/bwapp/files/latest/download -O /tmp/bwapp.zip

RUN unzip /tmp/bwapp.zip -d /var/www/html

RUN chown -R www-data:www-data /var/www/html

RUN a2enmod rewrite

# Fix connect_i.php to use the correct MySQL service name
RUN sed -i 's/localhost/mysql/' /var/www/html/connect_i.php

RUN rm /tmp/bwapp.zip

EXPOSE 80
