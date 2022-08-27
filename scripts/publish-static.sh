#! /usr/bin/env sh

# Static Content Publication Script

BASEDIR=$(dirname "$0")
cd "$BASEDIR/../server/ansible" || exit 1

ansible-playbook playbook-set-up-services.yml --tags=app-static