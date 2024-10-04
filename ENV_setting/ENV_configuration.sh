#!/bin/bash

# Variable Definition
BASHRC=$HOME/.bashrc

# Main Function
echo "[+] Configuring Environment Files"
grep -q 'This contents was added automatically' $BASHRC
if [ $? -ne 0 ] ; then
    cat << EOF >> $BASHRC
# =========== START: This contents was added automatically =========== #
#
# Sfecific Configuration
#

#
# (1) Alias
#
# alias ccc="clear"
# alias ls='/bin/ls --color=tty -h'
# alias grep='/bin/grep --color -i'
# alias vi='/usr/bin/vim'
# alias df='/bin/df -h -T'
# alias pps='/bin/ps -ef | head -1 ; /bin/ps -ef | grep $1'
# alias pstree='/usr/bin/pstree -alup'
# alias tree='/usr/bin/tree -C'

#
# (2) Variable Definition
#
# export PS1='[\u@\h \w]\$ '
# export PS1='\[\033[01;31m\][\h:\w]\[\033[00m\]\\$ '
# export PS1='\[\033[01;31m\][\w]\[\033[00m\]\$ '
# export HISTTIMEFORMAT='%C %T       '
# alias tree='env LANG=C tree'

#
# (3) bash Shell Function 
#
# set -o vi

#
# (4) Shell Script
#
# alias aa='chmod 755 /root/bin/*.sh'

# ========= END: This contents was added automatically ======== #
EOF
fi

echo "[+] Environment setup is complete."
