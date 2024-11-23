FROM alpine:3.14

# Gerekli paketleri ve PHP ile ilgili bağımlılıkları kuruyoruz
RUN apk add --no-cache php7 php7-fpm php7-mysqli php7-pdo php7-pdo_mysql \
    php7-opcache php7-session php7-json php7-zlib php7-xml php7-simplexml \
    php7-mbstring php7-curl php7-iconv php7-tokenizer php7-fileinfo php7-ctype \
    php7-zip php7-dom bash curl && \
    mkdir -p /var/www/html

RUN adduser -S -D -H -G www-data www-data || true

# WordPress'in çalışması için çalışma dizinini ayarlıyoruz
WORKDIR /var/www/html

# PHP-FPM'in çalışması için doğru izinleri ayarlıyoruz
RUN chown -R www-data:www-data /var/www/html

# WordPress dosyalarını konteynıra kopyalıyoruz
COPY ./conf /var/www/html

# PHP-FPM için gerekli portu açıyoruz
EXPOSE 9000

# PHP-FPM'in varsayılan giriş noktasını kullanıyoruz
ENTRYPOINT ["/usr/sbin/php-fpm7"]

# PHP-FPM'i başlatmak için varsayılan komut
CMD ["-F"]
