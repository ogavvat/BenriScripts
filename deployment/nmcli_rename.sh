#!/bin/bash

NIC_OLD=$1
NIC_NEW=$2

if [ -z "$NIC_OLD" ]; then
  echo "usage:"
  echo "  nmcli_rename [CURRENT NIC NAME] [NEW NIC NAME]"
  echo ""
  echo "  e.g)"
  echo "    nmcli_rename "Wired connection 1" eth1"
  exit
fi

if [ -z "$NIC_NEW" ]; then
  echo "usage:"
  echo "  nmcli_rename [CURRENT NIC NAME) [NEW NIC NAME]"
  echo ""
  echo "  e.g)"
  echo "    nmcli_rename "Wired connection 1" eth1"
  exit
fi

nmcli con
nmcli con mod "$NIC_OLD" connection.id $NIC_NEW
nmcli con mod "$NIC_NEW" connection.interface-name $NIC_NEW
nmcli con


