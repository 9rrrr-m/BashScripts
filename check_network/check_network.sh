#!/bin/bash

# Variable Definition
# local gateway ip
echo -n "Gateway IP address(default: 192.168.10.2)? : "
read IP1
IP1="${IP1:-192.168.10.2}"

IP2=168.126.63.1      # external ip
IP3=www.google.com    # domain address

# Function Definition
. functions.sh

# Main Function
# Local network connection check
print_info "ping $IP1"
ping -c 1 $IP1 > /dev/null 2>&1
if [ $? -eq 0 ] ; then
    print_good "[  OK  ] Local Network Connection"
else
    print_error "[ FAIL ] Local Network Connection"
    cat << EOF
    (a) VMWare > Edit > Virtual Network Editor
    (b) VMware > VM > Settings > Network Adapter
    (c) # ifconfig
EOF
    exit 1
fi    

# External network connection check
print_info "ping $IP2"
ping -c 1 $IP2 >/dev/null 2>&1
if [ $? -eq 0 ] ; then
        print_good "[  OK  ] External Network Connection"
else
        print_error "[ FAIL ] External Network Connection"
        echo "    (a) # netstat -nr (# route -n)"
        exit 2
fi

# Domain name query check
print_info "ping $IP3"
ping -c 1 $IP3 >/dev/null 2>&1
if [ $? -eq 0 ] ; then
        print_good "[  OK  ] Domain name query"
else
        print_error "[ FAIL ] Domain name query"
        echo "    (a) # cat /etc/resolv.conf"
        exit 3
fi
