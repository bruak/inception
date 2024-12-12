FROM debian:bullseye

# MariaDB'yi yükle
RUN apt-get update && apt-get install -y mariadb-server && \
    mkdir -p /run/mysqld /var/lib/mysql /var/log && \
    chown -R mysql:mysql /run/mysqld /var/lib/mysql /var/log && \
    chmod -R 755 /run/mysqld /var/lib/mysql /var/log

EXPOSE 3306

COPY ./tools/setup-env.sh /usr/local/bin/setup-env.sh
RUN chmod +x /usr/local/bin/setup-env.sh

ENTRYPOINT ["/usr/local/bin/setup-env.sh"]
