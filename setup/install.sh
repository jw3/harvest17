#!/usr/bin/env bash

readonly profile="1"
readonly rootdir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"/..

#
# install /etc/default
#
cp ${rootdir}/etc/default/* /etc/default

#
# append /etc/hosts
#
cat ${rootdir}/etc/hosts.append.${profile} | tee -a /etc/hosts

#
# update rc.d
#
update-rc.d isc-dhcp-server start
