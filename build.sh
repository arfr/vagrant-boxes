#!/bin/bash

root_dir=`pwd`

echo $root_dir

echo "
--------------------------------------------------------------------------------
    VAGRANT BOXES (linux builder)
--------------------------------------------------------------------------------
    0 - All

    1 - Debian 7.8
    2 - Debian 8.1
    3 - Ubuntu 14.04 (14.04.3 LTS)
    4 - CentOS 6.7
    5 - CentOS 7.1.1503 (amd64 only)

    q - Quit
--------------------------------------------------------------------------------
"

os[1]='debian-7.8';
os[2]='debian-8.1';
os[3]='ubuntu-14.04';
os[4]='centos-6.7';
os[5]='centos-7.1.1503';

read -p "Please choice: " choice
echo

box=${os[$choice]}

_build() {
    echo build $1

    _add $1
    _remove $1
    echo
}

_add() {
    echo add $1
}

_remove() {
    echo remove $1
}

_finish() {
    echo finished
}

if [ $choice == 'q' ]; then
    echo quit
    exit
elif [ $choice == 0 ]; then
    for i in ${os[@]}; do
        _build ${i}
    done
else
    _build $box
fi

_finish
