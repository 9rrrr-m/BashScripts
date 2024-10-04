#!/bin/bash

# Variable Definition
GCC_PKG='gcc'
TREE_PKG='tree'

# Function Definition
. functions.sh

# Main Function
pkg_inst_and_verify "$GCC_PKG $TREE_PKG"
