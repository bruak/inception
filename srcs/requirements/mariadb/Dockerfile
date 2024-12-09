FROM debian:bullseye

RUN apt-get update && apt-get install -y mariadb-server
RUN apt-get update && apt-get install -y gettext-base

EXPOSE 3306

COPY ./tools/setup-env.sh /usr/local/bin/setup-env.sh
COPY ./tools /var/www/

RUN chmod +x /usr/local/bin/setup-env.sh

ENTRYPOINT ["/usr/local/bin/setup-env.sh"]

CMD ["mysqld"]
