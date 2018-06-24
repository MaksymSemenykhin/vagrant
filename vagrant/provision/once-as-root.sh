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

#print_title 'SETTING UP SWAP'
#fallocate -l ${swap_file}M /swapfile
#touch  /swapfile
#chmod 600 /swapfile
#mkswap /swapfile
#swapon /swapfile
#echo '/swapfile none swap defaults 0 0' >> /etc/fstab

#print_title "Configure timezone"
#timedatectl set-timezone ${timezone} --no-ask-password
#
#print_title "Update OS software"
#apt-get update -${arguments_software}
#apt-get upgrade -y${arguments_software}
#
#print_title "Install additional software"
#apt-get install ${additional_software} -y${arguments_software}
#
#print_title "Install main software"
#apt-get install ${main_software} -y${arguments_software}
#
#print_title "Removing unused soft"
#apt autoremove -y${arguments_software}
#



