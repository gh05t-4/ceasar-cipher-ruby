#!/bin/bash

help() {
    echo "USAGE: `basename $0` <ciphertext>"
    echo
    exit 0
}

if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    help
fi

FILE=./ceasar.rb

if test -f "$FILE"; then
    echo "[+] Bruteforce Started"
    if [ "$#" -eq 1 ]; then
	for i in {1..26}; do ./ceasar.rb $1 $i; done
    else
	echo "[-] no argument"
	help
    fi
    echo "[+] Bruteforce Complete"
else
    echo "[-] FILE not found"
    echo "[-] FILE 'ceasar.rb' should be present in current directory."
    echo
fi
