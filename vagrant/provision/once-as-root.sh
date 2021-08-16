#!/usr/bin/env bash
source /home/vagrant/provision/output.sh
source /home/vagrant/provision/functions.sh
source /home/vagrant/provision/config_read.sh

print_title "Provision-script once-as-root.sh user: `whoami`"


export DEBIAN_FRONTEND=noninteractive

call swapfile
call timezone
call update
call additional_software
call main_software
call autoremove
call docker
call php7.1-fpm
call composer


cd /app/vagrant/provision/docker-compose
bahs bash ./start-daemon.sh

print_title "Done | once-as-root"




