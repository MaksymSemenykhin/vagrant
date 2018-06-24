#!/usr/bin/env bash
source /home/vagrant/provision/output.sh
source /home/vagrant/provision/functions.sh
source /home/vagrant/provision/config_read.sh

print_info "timezone:${timezone}"

timedatectl set-timezone ${timezone} --no-ask-password
