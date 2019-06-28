#! /bin/bash
/root/.acme.sh/acme.sh  --installcert  -d  $1   \
        --key-file   /etc/nginx/ssl/$1.key \
        --fullchain-file /etc/nginx/ssl/$1.pem \
        --reloadcmd  "nginx -s reload"