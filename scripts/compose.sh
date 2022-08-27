#! /usr/bin/env sh

BASE_DIR=$(dirname "$0")
ROOT_DIR=$(realpath "$BASE_DIR/..")

DOCKER_DIR="$ROOT_DIR/server/docker"
DOCKER_ENV="$DOCKER_DIR/env/parameters.local.env"

set -a
. "$DOCKER_ENV"
set +a

docker compose --file "$DOCKER_DIR/docker-compose.yml" --project-directory "$ROOT_DIR" $@