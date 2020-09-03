#!/bin/bash

firewall-cmd --new-zone=asterisk --permanent 
firewall-cmd --reload

# Allow SIP
firewall-cmd --add-service=sip --zone=asterisk

# Allow RTP
firewall-cmd --add-port=10000-20000/udp --zone=asterisk

# Add source
echo "Please add source which allow asterisk-traffic using following command."
echo "  firewall-cmd --zone=asterisk --add-source=XX.XX.XX.XX/XX"


