#!/bin/bash

cmd() {
    sleep 4 ; echo 'testuser'
    sleep 1 ; echo 'password'
    sleep 1 ; echo 'hostname'
    sleep 1 ; echo 'ls -l'
    sleep 1 ; echo 'exit'
}

cmd | telnet localhost
