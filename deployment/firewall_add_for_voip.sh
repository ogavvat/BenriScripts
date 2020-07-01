#!/bin/sh

firewall-cmd --list-all --zone=public

# Allow SIP
firewall-cmd --add-service=sip --zone=public

# Allow RTP
firewall-cmd --add-port=10000-20000/udp --zone=public


firewall-cmd --list-all --zone=public

