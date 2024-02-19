#!/bin/sh

EP_DIR=$(dirname $(readlink -f $0))
echo $EP_DIR

chmod 600 $EP_DIR/credentials.ini

certbot certonly --noninteractive \
    --agree-tos \
    --email alexander@web-stoffel.de \
    --preferred-challenges dns \
    --authenticator dns-ionos \
    --dns-ionos-credentials /opt/certbot/credentials.ini \
    --dns-ionos-propagation-seconds 60 \
    --cert-name wc-web-stoffel-de \
    -d '*.web-stoffel.de'
