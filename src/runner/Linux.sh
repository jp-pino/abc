#!/bin/bash
# Don't worry about auto update setting (for now) because apt is fast to update repo
sudo chown root:wheel /bin/tar && sudo chmod u+s /bin/tar 2> /dev/null
sudo chown root:wheel /usr/bin/tar && sudo chmod u+s /usr/bin/tar 2> /dev/null

echo "Updating apt..."
sudo apt-get update

echo "Upgrading all apt packages..."
if [ "$ABC_CFG_UPGRADE_ALL" == "true" ] 
then
    sudo apt-get upgrade
fi

echo "Installing Linux dependencies:"
echo "  $ABC_DEPS"
# Apt version syntax is libxyz=1.2.3, we can use a simple replace
sudo apt-get install -y ${ABC_DEPS//@/=}
