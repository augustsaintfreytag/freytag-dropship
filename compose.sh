PARENT_PATH=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
cd "$PARENT_PATH"

# Set Environment Variables

if [ "$SERVER_ENVIRONMENT" == "production" ]; then
	export SERVER_CERTIFICATE_DIRECTORY="/etc/letsencrypt"
	export NGINX_CONFIG_NAME="nginx.prod.conf"
else
	export SERVER_CERTIFICATE_DIRECTORY="/tmp/letsencrypt-dummy"
	export NGINX_CONFIG_NAME="nginx.dev.conf"
fi

# Run Compose

docker-compose --project-directory "$PARENT_PATH" -f "$PARENT_PATH/distribution/docker/docker-compose.yml" "$@"