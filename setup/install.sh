#!/usr/bin/env bash

readonly rootdir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"/..

#
# install /etc/default
#
cp ${rootdir}/etc/default/* /etc/default



#
# update rc.d
#
update-rc.d isc-dhcp-server start
