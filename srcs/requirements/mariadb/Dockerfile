FROM alpine:3.14

# Install necessary dependencies for MariaDB
RUN apk add --no-cache mariadb=10.5.19-r0 mariadb-client=10.5.19-r0

# Optional: Set environment variables for MariaDB (you can override them in your docker-compose.yml)
ENV MYSQL_ROOT_PASSWORD=root \
    MYSQL_DATABASE=test \
    MYSQL_USER=test \
    MYSQL_PASSWORD=test

RUN mkdir -p /var/lib/mysql /run/mysqld && \
chown -R mysql:mysql /var/lib/mysql /run/mysqld


# Fix permissions for PAM authentication plugin
RUN mkdir -p /usr/lib/mariadb/plugin/auth_pam_tool_dir && \
    chown -R root:root /usr/lib/mariadb/plugin/auth_pam_tool_dir && \
    chmod -R 755 /usr/lib/mariadb/plugin/auth_pam_tool_dir && \
    chmod 4755 /usr/lib/mariadb/plugin/auth_pam_tool_dir/auth_pam_tool


COPY ./conf/docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

# Expose MariaDB port
EXPOSE 3306

USER mysql

# Use MariaDB's default entrypoint and command
ENTRYPOINT ["docker-entrypoint.sh"]

# Default command (can be overridden in your docker-compose.yml)
CMD ["mysqld"]
