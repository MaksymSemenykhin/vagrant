#!/usr/bin/env bash
source /home/vagrant/provision/output.sh
source /home/vagrant/provision/functions.sh
source /home/vagrant/provision/config_read.sh

print_info "additional_software:${additional_software}"

apt-get install ${additional_software} -y