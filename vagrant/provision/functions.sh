#!/usr/bin/env bash
source /home/vagrant/provision/output.sh

# $1 - repo url like git@github.com:%username%/%project%.git
function repo_access_check {
    git ls-remote "$1" &>-
    if [ "$?" -ne 0 ]; then
        print_error "Repo $1 is not accessible"
    else
        print_info "Repo $1 is accessible"
    fi
}

# $1 - variable name
function fail_if_empty {
    if [ -z "$1" ]; then
        print_error "Empty string detected"
    fi
}

# $1 - search
# $2 - replace
# $3 - file
function str_replace_file {
    if [ -z "$1" ]; then
        print_error "str_replace_file: wrong search var"
    fi
    if [ -z "$2" ]; then
        print_error "str_replace_file: wrong replace var"
    fi
    if [ -z "$3" ]; then
        print_error "str_replace_file: wrong file var"
    fi

    sed -i "s|$1|$2|" $3
}

# $1 - amount of second
function pause () {
    sleep "$1"s
}

function internet_connection_check () {

    wget -q --spider http://google.com

    if [ $? -ne 0 ]; then
        print_error "Look like you don't have internet connection."
    fi

}


# @param $1 bash file
function call () {
    if [ -z "$1" ]; then
        print_error "call: empty bash file passed"
    fi

    mkdir /home/vagrant/provision/logs -p
    touch /home/vagrant/provision/logs/$1.log

    print_title "Calling $1.sh script"
    print_info "Provision-script user: `whoami`" &> /home/vagrant/provision/logs/$1.log

    if [ "$debug" == true ]; then
        bash /home/vagrant/provision/installations/$1.sh
    else
        bash /home/vagrant/provision/installations/$1.sh &>> /home/vagrant/provision/logs/$1.log
    fi

    local status=$?
    print_info "script return code $status " &>> /home/vagrant/provision/logs/$1.log

    if [ $status -ne 0 ]; then
        if [ "$debug" == false ]; then
            cat /home/vagrant/provision/logs/$1.log
        fi
        print_error "non zero return code"
    fi

}

function die_if_not_sudo () {
    if [ "$(whoami)" != "root" ]; then
        print_error "Sorry, you are not root."
    fi
}

function die_if_sudo () {
    if [ "$(whoami)" == "root" ]; then
        print_error "Sorry, you are root."
    fi
}
