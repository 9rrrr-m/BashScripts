#!/bin/bash

# 전제 조건 (1) 양쪽 서버가 온라인 상태
#         (2) SSH 공개키 인증이 되어있을 것

# IP 변수
IP=$1

# 임시파일 초기화
rm -rf /tmp/tmp{1..3}

# 서비스 기동 정보가 담긴 임시파일
TMP1=/tmp/tmp1
TMP2=/tmp/tmp2
TMP3=/tmp/tmp3

# 서비스 기동 정보 임시 파일에 저장
systemctl -t service \
    | awk '{print $1, $3}' \
    | sed -n '2,/LOAD/p' \
    | sed '$d' > $TMP1

echo "SSH 연결을 시도합니다... ($IP)"
ssh $IP systemctl -t service \
    | awk '{print $1, $3}' \
    | sed -n '2,/LOAD/p' \
    | sed '$d' > $TMP2

# 임시파일 비교 후 차이점 TMP3 파일로 저장
diff $TMP1 $TMP2 > $TMP3

# 자신의 서버에서는 기동 중이지만 원격 서버에서는 기동 중이지 않은 서비스 비교 출력
echo "========== linux200 ============"
cat $TMP3 | fgrep '<' | cut -c2-
echo
echo "($IP)"
echo "========= SSH server ==========="
cat $TMP3 | fgrep '>' | cut -c2-
echo
