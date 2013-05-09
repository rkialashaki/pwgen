#!/bin/bash
#pw generator
#
echo "Please specify the length of the passwords you wish to generate: "
read count
echo " "
echo "Passwords about to be generated."
echo "Press ctrl+c to stop password generation."
sleep 5

echo "Passwords and encrypted hashes:"
echo " "

while [ 1 ] 
do
  clear_pw=$(cat /dev/urandom | \
	strings -n 1 | \
	grep -x [a-zA-Z0-9] | \
	dd ibs=2 count=${count} 2>/dev/null | \
	tr -d \\n)

  salt="\$1\$$RANDOM"
  enc_pw=$(perl -e "print crypt(q/$clear_pw/, q/$salt/)")

  echo "1.) clear text password:  ${clear_pw}"
  echo "2.) encrypted password:  ${enc_pw}"

done



