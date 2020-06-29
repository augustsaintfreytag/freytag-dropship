#! /usr/bin/env bash

PARENT_PATH=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
cd "$PARENT_PATH"

# Set Environment Variables

if [ "$SERVER_ENVIRONMENT" == "production" ]; then
	export SERVER_CERTIFICATE_ROOT="/etc/letsencrypt"
	export NGINX_CONFIG_NAME="nginx.prod.conf"
else
	export SERVER_CERTIFICATE_ROOT="/tmp/letsencrypt-dummy"
	export NGINX_CONFIG_NAME="nginx.dev.conf"
fi

# Run Compose

docker-compose -p "freytag_drop" "$@"