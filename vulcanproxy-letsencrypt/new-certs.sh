#!/bin/sh

set -x
set -e

ETCD_ENDPOINT=${ETCD_ENDPOINT:-172.17.0.1:4001}
# this hopes that inside the container ifconfig first reports for `eth0`
CONTAINER_ETH0_IP=`ifconfig eth0| perl -nle 's/dr:(\S+)/print $1/e'|head -n1`
MYIP=${MYIP:-$CONTAINER_ETH0_IP}

# tell the frontend where we are
curl -X PUT http://$ETCD_ENDPOINT/v2/keys/vulcand/backends/letsencrypt/backend -d 'value={"Type": "http"}'
curl -X PUT http://$ETCD_ENDPOINT/v2/keys/vulcand/frontends/letsencrypt/frontend -d 'value={"Type": "http", "BackendId": "letsencrypt", "Route": "PathRegexp(\"/.well-known/.*\")"}'
curl -X PUT http://$ETCD_ENDPOINT/v2/keys/vulcand/backends/letsencrypt/servers/srv1 -d "value={\"url\":\"http://$MYIP\"}"

certbot certonly --standalone --standalone-supported-challenges http-01 $*

curl -X DELETE http://$ETCD_ENDPOINT/v2/keys/vulcand/frontends/letsencrypt?recursive=true
curl -X DELETE http://$ETCD_ENDPOINT/v2/keys/vulcand/backends/letsencrypt?recursive=true