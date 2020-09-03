#!/bin/bash

firewall-cmd --new-zone=freeswitch --permanent 
firewall-cmd --reload

# Allow SIP
firewall-cmd --add-service=sip --zone=freeswitch

# Allow RTP
firewall-cmd --add-port=16384-32768/udp --zone=freeswitch

# Allow EventSocket
firewall-cmd --add-port=8021/tcp --zone=freeswitch

# Add source
echo "Please add source which allow freeswitch-traffic using following command."
echo "  firewall-cmd --zone=freeswitch --add-source=XX.XX.XX.XX/XX"


