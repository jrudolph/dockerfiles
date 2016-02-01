FROM quay.io/letsencrypt/letsencrypt:latest

VOLUME /etc/letsencrypt /var/lib/letsencrypt /var/log/letsencrypt

RUN apt-get update && \
    apt-get install -y curl && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

COPY new-certs.sh /new-certs.sh

ENTRYPOINT [ "/new-certs.sh" ]