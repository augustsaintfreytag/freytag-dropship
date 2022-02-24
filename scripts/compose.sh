#! /usr/bin/env zsh

BASE_DIR=$(dirname "$0")
ROOT_DIR=$(realpath "$BASE_DIR/..")

DOCKER_DIR="$ROOT_DIR/server/docker"
DOCKER_ENV="$DOCKER_DIR/env/parameters.local.env"

set -a
source "$DOCKER_ENV"
set +a

set +e
mkdir "$SERVER_CERTIFICATE_DIR" &> /dev/null
mkdir "$SERVER_CERTIFICATE_LOG_DIR" &> /dev/null
set -e

docker compose --file $DOCKER_DIR/docker-compose.yml --project-directory $ROOT_DIR $@	