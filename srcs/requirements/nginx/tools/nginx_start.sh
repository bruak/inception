#!/bin/bash

if [ -f /run/secrets/credentials ]; then
    export COUNTRY=$(grep COUNTRY /run/secrets/credentials | cut -d '=' -f2 | tr -d '[:space:]')
    export STATE=$(grep STATE /run/secrets/credentials | cut -d '=' -f2 | tr -d '[:space:]')
    export LOCALITY=$(grep LOCALITY /run/secrets/credentials | cut -d '=' -f2 | tr -d '[:space:]')
    export COMMON_NAME=$(grep COMMON_NAME /run/secrets/credentials | cut -d '=' -f2 | tr -d '[:space:]')
else
    echo "credentials.txt file not found, didnt get information for SSL."
fi

echo "***************************************************************************************************"
echo "COUNTRY = $COUNTRY"
echo "STATE = $STATE"
echo "LOCALITY = $LOCALITY"
echo "COMMON_NAME = $COMMON_NAME"
echo "***************************************************************************************************"

if [ ! -f /etc/ssl/certs/nginx.crt ]; then
    openssl req -x509 -nodes -days 365 -newkey rsa:4096 \
     -keyout /etc/ssl/private/nginx.key -out /etc/ssl/certs/nginx.crt \
	 -subj "/C=$COUNTRY/ST=$STATE/L=$LOCALITY/O=42Kocaeli/CN=$COMMON_NAME";
fi

echo "***************************************************************************************************"
echo "keyout--------> =" 
cat /etc/ssl/private/nginx.key
echo "out--------> ="
cat /etc/ssl/certs/nginx.crt
echo "***************************************************************************************************"

exec "$@"



