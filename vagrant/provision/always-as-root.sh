#!/usr/bin/env bash
source /home/vagrant/provision/output.sh
source /home/vagrant/provision/functions.sh
source /home/vagrant/provision/config_read.sh

print_title "Provision-script user: `whoami`"

print_title "Restart web-stack"
service nginx restart

print_title "Vagrant config:"
jq '.' /home/vagrant/config/vagrant-local.json

