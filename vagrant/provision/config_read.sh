#!/usr/bin/env bash
source /home/vagrant/provision/output.sh

#== jq installation. Tool that helps to read from json ==
sudo apt-get install jq -yqq

#print_title "Vagrant config:"
#jq '.' /home/vagrant/config/vagrant-local.json

#== Import script args ==

timezone=$(jq '.timezone' /home/vagrant/config/vagrant-local.json -r )
swap_file=$(jq '.swap' /home/vagrant/config/vagrant-local.json -r )
additional_software=$(jq '.software.additional' /home/vagrant/config/vagrant-local.json -r )
main_software=$(jq '.software.main' /home/vagrant/config/vagrant-local.json -r )
arguments_software=$(jq '.software.arguments' /home/vagrant/config/vagrant-local.json -r )
debug=$(jq '.debug' /home/vagrant/config/vagrant-local.json -r )

fail_if_empty "$timezone"
fail_if_empty "$swap_file"
fail_if_empty "$additional_software"
fail_if_empty "$debug"
