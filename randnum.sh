#!/bin/bash
# random number generator
#
count=$1

if [ -d $1 ]; then
  echo "Usage: $0 <integer>"
else 
  randnum=$(cat /dev/urandom | \
	strings -n 1 | \
	grep -x [0-9] | \
	dd ibs=2 count=${count} 2>/dev/null | \
	tr -d \\n)
  echo "Your Random Number:  ${randnum}"
fi
