#!/usr/bin/env bash

#
# install apt dependencies
#
apt-get update
apt-get install -y git nano jq screen omxplayer isc-dhcp-server gpm python-pip

#
# clone repo
#
cd /tmp
git clone https://github.com/jw3/mvf.git

/tmp/mvf/install.sh
