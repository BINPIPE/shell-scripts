#!/bin/bash
# Shell script to be run via ansible to install netdata on multiple nodes together.



#Enable KSM
echo 1 >/sys/kernel/mm/ksm/run
echo 1000 >/sys/kernel/mm/ksm/sleep_millisecs

#install prerequisites
curl -Ss 'https://raw.githubusercontent.com/netdata/netdata/master/packaging/installer/install-required-packages.sh' >/tmp/install-required-packages.sh

bash /tmp/install-required-packages.sh  -i netdata --dont-wait --non-interactive

#launch installer
# download it - the directory 'netdata' will be created
git clone https://github.com/netdata/netdata.git --depth=100
cd netdata

# run script with root privileges to build, install, start Netdata
./netdata-installer.sh --dont-wait
