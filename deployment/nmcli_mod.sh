#!/bin/bash

NIC=$1
IPADDR=$2

if [ -z "$NIC" ]; then
  echo "usage:"
  echo "  nmcli_mod [NIC] [IP Address]"
  echo ""
  echo "  e.g)"
  echo "    nmcli_mod eth1 192.168.11.10/24"
  exit
fi

if [ -z "$IPADDR" ]; then
  echo "usage:"
  echo "  nmcli_mod [NIC] [IP Address]"
  echo ""
  echo "  e.g)"
  echo "    nmcli_mod eth1 192.168.11.10/24"
  echo "    nmcli_mod eth1 192.168.11.10/24,192.168.11.11/24,"
  exit
fi

ip address show $NIC
nmcli con mod $NIC ipv4.method manual ipv4.address $IPADDR connection.autoconnect "yes"
nmcli con down $NIC; sudo nmcli con up $NIC
ip address show $NIC



