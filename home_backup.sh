#!/bin/bash

# 매월 2번째 주 일요일에 백업이 진행됩니다.
# 백업 시간 설정은 crontab을 이용하세요.
# 설정된 디렉토리의 풀백업이 진행됩니다.

# Variable Definition
SOURCE_DIR=/home/testuser
BACKUP_DIR=/root/scripts/backup
LOG=/var/log/backup.log
DAY=$(date +%d)

# Function Definition
backup() {
    echo
    echo "Backup started: $(date)"
    cd $SOURCE_DIR
    tar czf $BACKUP_DIR/home_$(date +%m%d).tar.gz . > /dev/null 2>&1
    if [ $? -eq 0 ] ; then
        echo "[  OK  ] Backup success."
    else
        echo "[ FAIL ] Backup failed."
    fi
    echo "Backup finished: $(date)  ($SOURCE_DIR)"
    echo
}

# Main Function
[ $DAY -ge 2 -a $DAY -le 8 ] && backup >> $LOG 2>&1
