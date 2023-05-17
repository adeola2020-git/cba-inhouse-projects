#!/bin/bash
# terraform/modules/bastion/templates/userdata.sh.tpl:
set -o errexit
set -o nounset

apt-get -q update
apt-get -qy install awscli