# Function Definition
print_good () {
    echo -e "\x1B[01;32m[+]\x1B[0m $1"
}

print_error () {
    echo -e "\x1B[01;31m[-]\x1B[0m $1"
}

print_info () {
    echo -e "\x1B[01;34m[*]\x1B[0m $1"
}
