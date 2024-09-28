#!/bin/bash

# Variable definition
ROOT=/root/scripts
FILENAME=$1

# Function definition
MakeNewFile() {
    cat << EOF > $ROOT/$FILENAME
#!/bin/bash

# Variable definition


# Function definition


# Main function


EOF

    chmod 700 $ROOT/$FILENAME
    echo "[ NEW ] $FILENAME이 생성되었습니다."
    exit
}

Exit() {
    echo "파일 생성을 중지합니다."
    exit
}

# Main function
if [ -f $FILENAME ] ; then
    while true
    do
        echo -n "[ WARN ] 파일이 존재합니다. 새로 생성하겠습니까? (y/n): "
        read ANSWER
        case $ANSWER in
            y|Y|yes|YES) MakeNewFile ;;
            n|N|no|NO)   Exit ;;
            *) continue ;;
        esac
    done
else
    MakeNewFile
fi
