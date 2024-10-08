# Usa la imagen base oficial de PHP con Apache
FROM php:8.2-apache

# Instala las extensiones necesarias para Laravel
RUN docker-php-ext-install pdo pdo_mysql

# Instala Composer globalmente
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Copia los archivos de la aplicación al directorio del servidor web
COPY . /var/www/html

# Otorga los permisos correctos para las carpetas necesarias
RUN chown -R www-data:www-data /var/www/html/storage /var/www/html/bootstrap/cache

# Habilita el módulo de reescritura de URLs en Apache
RUN a2enmod rewrite

# Establece el directorio de trabajo
WORKDIR /var/www/html

# Ejecuta Composer para instalar dependencias de Laravel
RUN composer install --no-interaction --optimize-autoloader --no-dev
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

# Expone el puerto 80 para la aplicación Laravel
EXPOSE 8000


