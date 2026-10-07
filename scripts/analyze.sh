#!/usr/bin/env bash

# Task 07: complete this script.
# Usage: ./scripts/analyze.sh FILE

# TODO: validate arguments
# TODO: validate file existence
# TODO: print:
# Total ERROR: <number>
# Top Code: <code>

if [[ $# -ne 1 ]]; then
echo "Usage: $0 FILE"
exit 1
fi

if [[ ! -f "$1" ]]; then
echo "Error: File $1 does not exist"
exit 1
fi

TOTAL_ERROR=$(grep -c 'ERROR' "$1")

TOP_CODE=$(grep 'ERROR' "$1"|cut -d ' ' -f5|cut -d'=' -f2|sort|uniq -c|sort -nr|head -n1|tr -s ' '|cut -d' ' -f3)

if [[ $TOTAL_ERROR -eq 0 ]]; then
    TOP_CODE="NONE"
fi


echo "Total ERROR: ${TOTAL_ERROR}"
echo "Top Code: ${TOP_CODE}"

