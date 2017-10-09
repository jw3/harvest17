#!/usr/bin/env bash

readonly profile="1"
readonly rootdir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"/..

#
# install bin to /usr/local/bin
#
cp ${rootdir}/bin/* /usr/local/bin

#
# install /etc/default
#
cp ${rootdir}/etc/default/* /etc/default

#
# append /etc/hosts
#
cat ${rootdir}/etc/hosts.append.${profile} | tee -a /etc/hosts

#
# disable predictable network names
#
ln -s /dev/null /etc/systemd/network/99-default.link


#
# add init.d scripts
#
cp ${rootdir}/etc/init.d/* /etc/init.d

#
# update rc.d
#
update-rc.d isc-dhcp-server defaults
update-rc.d camviewers defaults
update-rc.d power-button defaults

#
# install cron jobs
#
cp ${rootdir}/etc/cron.d/* /etc/cron.d
