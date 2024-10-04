#!/bin/bash

# (1) Package Installation
# (2) Service Enable/Start
# (3) Service Configuration
# (4) Firewall Configuration
# (5) SELinux Configuration

############################ TELNET SERVICE ############################
# Variable Definition
TELNET_PKG="telnet-server telnet"
TELNET_SVC="telnet.socket"
TELNET_CONF="/etc/securetty"
FW_TELNET_SVC="telnet"

# Function Definition
# . functions.sh

# Main Function
# (1) Package Installation
pkg_inst_and_verify "$TELNET_PKG"

# (2) Service Enable/Start
svc_enable_and_start "$TELNET_SVC"

# (3) Service Configuration
echo "[  **  ] Configuring telnet service"
grep -q 'pts/' $TELNET_CONF
if [ $? -eq 0 ] ; then
    for i in $(seq 0 11)
    do
        echo "pts/$i" >> $TELNET_CONF
    done
fi
echo "[  OK  ] Telnet service has been set up."

# (4) Firewall Configuration
add_svc_fw "$FW_TELNET_SVC"

# (5) SELinux Configuration


############################# FTP SERVICE ##############################
# Variable Definition
FTP_PKG="vsftpd ftp"
FTP_SVC="vsftpd.service"
FTP_CONF1="/etc/vsftpd/ftpusers"
FTP_CONF2="/etc/vsftpd/user_list"
FW_FTP_SVC="ftp"

# Function Definition
# . functions.sh

# Main Function
# (1) Package Installation
pkg_inst_and_verify "$FTP_PKG"

# (2) Service Enable/Start
svc_enable_and_start "$FTP_SVC"

# (3) Service Configuration
echo "[  **  ] Configuring FTP service"
sed -i 's/^root/#root/' $FTP_CONF1
sed -i 's/^root/#root/' $FTP_CONF2
echo "[  OK  ] FTP service has been set up."

# (4) Firewall Configuration
add_svc_fw "$FW_FTP_SVC"

# (5) SELinux Configuration
