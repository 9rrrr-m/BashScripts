#!/bin/bash

# Variable definition
ROOT=/root/scripts
FILENAME=$1

# Function definition
make_new_file() {
    cat << EOF > $ROOT/$FILENAME
#!/bin/bash

# Variable Definition


# Function Definition


# Main Function


EOF

    chmod 700 $ROOT/$FILENAME
    echo "[ NEW ] $FILENAME이 생성되었습니다."
    exit
}

_exit() {
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
            y|Y|yes|YES) make_new_file ;;
            n|N|no|NO)   _exit ;;
            *) continue ;;
        esac
    done
else
    make_new_file
fi
