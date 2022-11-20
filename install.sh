#!/bin/bash
if [[ $EUID -ne 0 ]]; then
   echo "You must be root to install." 1>&2
   exit
fi
echo "Installing requirements."
apt-get install -y --no-install-recommends less nano
echo "Installing notecrypt."
cp sysadminjournal.sh /usr/bin/sysadminjournal
chmod +x /usr/bin/sysadminjournal
echo Done.
