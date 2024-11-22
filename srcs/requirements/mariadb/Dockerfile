FROM mariadb:10.5.19

# Optional: Set environment variables for MariaDB (you can override them in your docker-compose.yml)
ENV MYSQL_ROOT_PASSWORD=root
ENV MYSQL_DATABASE=test
ENV MYSQL_USER=test
ENV MYSQL_PASSWORD=test

# MariaDB will automatically initialize if /var/lib/mysql is empty and environment variables are set
# Expose MariaDB port
EXPOSE 3306

# Mount the volume correctly in your docker-compose.yml
VOLUME /var/lib/mysql

# Use the default entrypoint from the official MariaDB image
ENTRYPOINT ["docker-entrypoint.sh"]

# Default command (can be overridden in your docker-compose.yml)
CMD ["mysqld"]
