#! /usr/bin/env sh

BASE_DIR=$(dirname "$0")
ROOT_DIR=$(realpath "$BASE_DIR/..")
FS_DIR="$ROOT_DIR/fs"

cd "$FS_DIR" || exit 1

# Generate root and domain certificates

minica --domains "app.intra"
minica --domains "cockpit.app.intra"

# Generate DH params

openssl dhparam -out dhparams.pem 4096