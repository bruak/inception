#!/bin/bash

if [ -f /run/secrets/db_password ]; then
    export MYSQL_USER_PASS=$(cat /run/secrets/db_password)
else
    echo "db_password.txt bulunamadı, şifre ayarlanamadı."
fi

if [ -f /run/secrets/credentials ]; then
    export MYSQL_USER=$(grep MYSQL_USER /run/secrets/credentials | cut -d '=' -f2 | tr -d '[:space:]')
else
    echo "credentials.txt bulunamadı, kullanıcı adı ayarlanamadı."
fi

if [ -f /run/secrets/db_root_password ]; then
    export MYSQL_ROOT_PASS=$(cat /run/secrets/db_root_password)
else
    echo "db_root_password.txt bulunamadı, root şifresi ayarlanamadı."
fi

mysqld_safe --skip-grant-tables &
sleep 5

mysql --verbose <<EOF 
FLUSH PRIVILEGES;
ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASS';
CREATE DATABASE IF NOT EXISTS wordpress;
CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_USER_PASS';
GRANT ALL PRIVILEGES ON wordpress.* TO '$MYSQL_USER'@'%';
FLUSH PRIVILEGES;
EOF

mysqladmin -u root -p$MYSQL_ROOT_PASS shutdown

exec mysqld