#!/bin/sh
set -e

# Eğer /var/lib/mysql dizini boşsa, MariaDB'yi başlatmadan önce gerekli sistem tablolarını oluşturuyoruz
if [ -z "$(ls -A /var/lib/mysql)" ]; then
    echo 'Initializing database'
    mysql_install_db --user=mysql --datadir=/var/lib/mysql
    echo 'Database initialized'
fi

exec "$@"