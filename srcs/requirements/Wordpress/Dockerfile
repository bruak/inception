FROM debian:bullseye

RUN apt-get update && apt-get -y install php7.4 php-mysqli php-fpm wget

EXPOSE 9000

COPY ./conf/wp-config.conf /etc/php/7.4/fpm/pool.d
COPY ./tools /var/www/

RUN chmod +x /var/www/wordpress-start.sh

ENTRYPOINT [ "/var/www/wordpress-start.sh" ]

CMD ["/usr/sbin/php-fpm7.4", "--nodaemonize"]
