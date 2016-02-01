# letsencrypt / vulcanproxy integration

A docker image that allows to request certificates from https://letsencrypt.org if you use [vulcan proxy](http://vulcand.github.io/).

Preliminaries:
 * etcd cluster configuring vulcand must be accessible at $ETCD_ENDPOINT
 * letsencrypt starts a server that must be accessible from vulcand under $MYIP which defaults to the eth0 ip address of this container

Run like this:

```
docker run --rm -ti -v /data/letsencrypt/etc:/etc/letsencrypt -v /data/letsencrypt/varlib/:/var/lib/letsencrypt -v /data/letsencrypt/log/:/var/log/letsencrypt jrudolph/vulcanproxy-letsencrypt -m <your-mail> -t -d <host-to-get-certificate-for>
```