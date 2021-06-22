#! /usr/bin/env zsh

BASEDIR=$(dirname "$0")
ROOTDIR=$(realpath "$BASEDIR/..")

DOCKERDIR="$ROOTDIR/server/docker"
DOCKERENV="$DOCKERDIR/env/parameters.dev.env"

set -a
source "$DOCKERENV"
set +a

set +e
mkdir "$SERVER_CERTIFICATE_ROOT" &> /dev/null
mkdir "$SERVER_CERTIFICATE_LOG_ROOT" &> /dev/null
set -e

docker compose --file $DOCKERDIR/docker-compose.yml --project-directory $ROOTDIR $@	