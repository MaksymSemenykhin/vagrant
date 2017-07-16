#!/usr/bin/env bash
source /home/vagrant/output.sh

print_title "Provision-script user: `whoami`"

print_title "Restart web-stack"
service nginx restart
