#!/usr/bin/env bash
source /home/vagrant/provision/output.sh
source /home/vagrant/provision/functions.sh
source /home/vagrant/provision/config_read.sh

apt-get autoremove -y
apt-get autoclean -y
