#!/bin/bash

echo "Timestamp: $(date +"%Y-%m-%d_%H:%M")"

docker build \
    /opt/certbot/build/. \
    --tag certbot-ionos

docker run --rm \
    -v /opt/certbot/letsencrypt:/etc/letsencrypt \
    -v /opt/certbot/logs:/var/log/letsencrypt/ \
    certbot-ionos

echo "Log Rotate after 14 days"
find /opt/certbot/logs/letsencrypt* -mtime +14 | xargs rm
find /opt/certbot/cron-logs/certs-* -mtime +14 | xargs rm

echo ""
