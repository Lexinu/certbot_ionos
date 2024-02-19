# Ionos Developer Portal:
https://developer.hosting.ionos.de/keys

# Direct build command:
```bash
docker build \
    /opt/certbot/build/. \
    --tag certbot-ionos

docker run --rm \
    -v /opt/certbot/letsencrypt:/etc/letsencrypt \
    -v /opt/certbot/logs:/var/log/letsencrypt/ \
    certbot-ionos
```

# Crontab entry:
```bash
0    2  * * *   root    /opt/certbot/build/cronjob-certs.sh >> /opt/certbot/cron-logs/certs-$(date +\%Y-\%m-\%d).log 2>&1
```
