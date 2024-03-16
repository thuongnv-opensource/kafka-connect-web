#!/bin/sh

ROOT_DIR=/app/dist

sed -i 's|CONNECT_SERVER_DOCKER_ENV|'${CONNECT_SERVER_DOCKER_ENV}'|g' /etc/nginx/conf.d/default.conf

nginx -g "daemon off;"