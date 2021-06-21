#! /usr/bin/env bash

# Static Content Publication Script

BASEDIR=$(dirname "$0")
cd "$BASEDIR/../distribution/ansible"

ansible-playbook playbook-set-up-services.yml --tags=app-static