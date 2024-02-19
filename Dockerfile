FROM certbot/certbot

WORKDIR /opt/certbot

RUN pip install certbot-dns-ionos

COPY credentials.ini /opt/certbot/
COPY entrypoint.sh /opt/certbot/

RUN chmod +x /opt/certbot/entrypoint.sh

ENTRYPOINT [ "/opt/certbot/entrypoint.sh" ]
