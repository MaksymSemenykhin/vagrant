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



