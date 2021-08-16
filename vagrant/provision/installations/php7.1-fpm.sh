#!/usr/bin/env bash
source /home/vagrant/provision/output.sh
source /home/vagrant/provision/functions.sh
source /home/vagrant/provision/config_read.sh


print_title "php 7.1-fpm install"
sudo apt-get install software-properties-common -y
sudo add-apt-repository ppa:ondrej/php -y
sudo apt-get update
sudo apt-get install php7.1 php7.1-cli php7.1-common php7.1-json php7.1-opcache php7.1-mysql php7.1-mbstring php7.1-mcrypt php7.1-zip php7.1-fpm -y
sudo systemctl restart php7.1-fpm.service
