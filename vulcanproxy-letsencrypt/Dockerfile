FROM ubuntu

VOLUME /etc/letsencrypt /var/lib/letsencrypt /var/log/letsencrypt

RUN apt-get update && \
    apt-get install -y curl certbot && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

COPY new-certs.sh /new-certs.sh

ENTRYPOINT [ "/new-certs.sh" ]