#! /usr/bin/env zsh

BASEDIR=$(dirname "$0")
ROOTDIR=$(realpath "$BASEDIR/..")

DOCKERDIR="$ROOTDIR/server/docker"
DOCKER_ENV="$DOCKER_DIR/env/parameters.local.env"

set -a
source "$DOCKERENV"
set +a

set +e
mkdir "$SERVER_CERTIFICATE_DIR" &> /dev/null
mkdir "$SERVER_CERTIFICATE_LOG_DIR" &> /dev/null
set -e

docker compose --file $DOCKERDIR/docker-compose.yml --project-directory $ROOTDIR $@	