#!/bin/bash

# (1) Host Name
# (2) Connection Name
# (3) Ethernet Adapter
# (4) Method Check
# (5) IPv4 Address
# (6) Default Gateway
# (7) DNS Servers

# Variable Definition
export LANG=en_US.UTF-8
TMP=/tmp/tmp1

# Main Function
# (1) Host Name
HOST=$(hostname)
echo "Host Name .......... : $HOST"

# (2) Connection Name
nmcli -f NAME connection | tail -n +2 > $TMP
for CON in $(cat $TMP)
do
    # (3) Ethernet Adapter
    NIC=$(echo $(nmcli connection show $CON \
                | grep "connection.interface-name:" \
                | awk -F: '{print $2}'))

    # (4) Method Check
    METHOD=$(echo $(nmcli connection show $CON \
                | grep "ipv4.method:" \
                | awk -F: '{print $2}'))

    if [ $METHOD = 'manual' ] ; then
        # (5) IPv4 Address
        IP=$(echo $(nmcli connection show $CON \
                | grep "ipv4.addresses:" \
                | awk -F: '{print $2}'))
        # (6) Default Gateway
        GW=$(echo $(nmcli connection show $CON \
                | grep "ipv4.gateway:" \
                | awk -F: '{print $2}'))
        # (7) DNS Servers
        DNS=$(echo $(nmcli connection show $CON \
                | grep "ipv4.dns:" \
                | awk -F: '{print $2}'))
    
    elif [ $METHOD = 'auto' ] ; then
        # (5) IPv4 Address
        IP=$(echo $(nmcli connection show $CON \
                | fgrep "IP4.ADDRESS[1]:" \
                | awk -F: '{print $2}'))
        # (6) Default Gateway
        GW=$(echo $(nmcli connection show $CON \
                | grep "IP4.GATEWAY:" \
                | awk -F: '{print $2}'))
        # (7) DNS Servers
        DNS=$(echo $(nmcli connection show $CON \
                | fgrep "IP4.DNS[1]:" \
                | awk -F: '{print $2}'))
    else
        echo "[ FAIL ] Only 'manual' of 'auto' settings can be checked."
    fi

    # Output
    cat << EOF

Connection Name ...... : $CON
Ethernet adapter ..... : $NIC
Method ............... : $METHOD
IPv4 Address ......... : $IP
Default Gateway ...... : $GW
DNS Servers .......... : $DNS
EOF

done
