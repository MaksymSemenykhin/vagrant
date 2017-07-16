#!/usr/bin/env bash
source /home/vagrant/output.sh

print_title "Provision-script user: `whoami`"

print_title "Enabling colorized prompt for guest console"
sed -i "s/#force_color_prompt=yes/force_color_prompt=yes/" /home/vagrant/.bashrc