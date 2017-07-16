#!/usr/bin/env bash
source /home/vagrant/output.sh

#== Import script args ==

timezone=$(echo "$1")
swapfile=$(echo "$2")


#== Bash helpers ==

print_title "Provision-script user: `whoami`"

#== Provision script ==


export DEBIAN_FRONTEND=noninteractive

print_title 'SETTING UP SWAP'
fallocate -l $(echo $swapfile)M /swapfile
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile
echo '/swapfile none swap defaults 0 0' >> /etc/fstab


print_title "Configure timezone"
timedatectl set-timezone ${timezone} --no-ask-password

print_title "Update OS software"
apt-get update -qq
apt-get upgrade -yqq

print_title "Install additional software"
apt-get install git nginx -yqq
apt-get install git curl vim mc htop -yqq



