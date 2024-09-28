#!/bin/bash

ftp -n 127.0.0.1 21 << EOF
user testuser password
cd /tmp
lcd /root/scripts/test
bin
hash
prompt
mput testfile.txt
quit
EOF
