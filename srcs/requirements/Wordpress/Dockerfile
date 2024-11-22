FROM php:7.4-fpm

# Gerekli PHP eklentilerini kuruyoruz (WordPress için)
RUN docker-php-ext-install mysqli pdo pdo_mysql

# WordPress'in yüklenmesi için gerekli dosya ve dizinleri ayarlıyoruz
WORKDIR /var/www/html

# PHP-FPM'in çalışması için doğru izinleri sağlıyoruz
RUN chown -R www-data:www-data /var/www/html

# WordPress için gerekli dosyaları /var/www/html dizinine alıyoruz
COPY ./conf /var/www/html

# PHP-FPM'yi çalıştıracak olan default entrypoint'i kullanıyoruz
ENTRYPOINT ["docker-php-entrypoint"]

CMD ["php-fpm"]
