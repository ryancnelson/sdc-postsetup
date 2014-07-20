#!/bin/bash -x
export PATH=$PATH:/opt/smartdc/bin
# Copyright 2011 Joyent, Inc. All rights reserved.

# This is an example post-install script.
# Post-install scripts are not formally suported features
# and are not intended to be used for anything other than
# test purposes.


set -o errexit
set -o pipefail


/mnt/usbkey/scripts/post-setup-chores/create_cloudapi 

/mnt/usbkey/scripts/post-setup-chores/add_external_nic $(vmadm lookup alias=adminui0)

### /mnt/usbkey/scripts/post-setup-chores/add_external_nic $(vmadm lookup alias=cloudapi0)

/mnt/usbkey/scripts/post-setup-chores/add_external_nic $(vmadm lookup alias=imgapi0)

/mnt/usbkey/scripts/post-setup-chores/make_headnode_provisionable 

curl -si http://ryan.net/coal_ping?coal_setup_complete > /dev/null

exit 0;
