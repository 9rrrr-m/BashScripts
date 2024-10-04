#!/bin/bash

# Function Definition
# Install and verify packages
pkg_inst_and_verify() {
    PKG=$1
    echo "[  **  ] Installing packages - $PKG"
    yum -q -y install $PKG > /dev/null 2>&1
    rpm -qa $PKG > /dev/null 2>&1
    if [ $? -eq 0 ] ; then
        echo "[  OK  ] The package($PKG) has been installed."
    else
        echo "[ FAIL ] The package($PKG) not installed."
        exit 1
    fi
}

# Enable and start the service
svc_enable_and_start() {
    SVC=$1
    echo "[  **  ] Enable service - $SVC"
    systemctl enable $SVC > /dev/null 2>&1
    ENABLE_STATUS=$(systemctl is-enabled $SVC)
    systemctl restart $SVC > /dev/null 2>&1
    START_STATUS=$(systemctl is-active $SVC)

    if [ $ENABLE_STATUS = enabled -a $START_STATUS = active ] ; then
        echo "[  OK  ] The service($SVC) was started normally."
    else
        echo "[ FAIL ] The service($SVC) has not started."
        exit 2
    fi
}

# Register the service in the firewall
add_svc_fw() {
    FW_SVC=$1
    echo "[  **  ] Configuring firewall"
    FW_STATUS=$(systemctl is-active firewalld)
    if [ $FW_STATUS = active ] ; then
        firewall-cmd --permanent --add-service=$FW_SVC > /dev/null 2>&1
        firewall-cmd --reload > /dev/null 2>&1
        echo "[  OK  ] The service($FW_SVC) is registered on the firewall."
    else
        echo "[ FAIL ] The firewall is disabled."
    fi
}
