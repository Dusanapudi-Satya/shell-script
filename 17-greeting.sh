#!/bin/bash

# Default values
NAME=""
WISHES="Good Morning"

# Help function
usage() {
  echo "Usage:: $(basename $0) -n <name> -w <wishes>"
  echo "  -n  NAME is mandatory "
  echo "  -w  WISHES are optional"
  echo "  -h  Show this help and exit"
  exit 1
}

# Parse options:
# A colon (:) AFTER a letter means that flag requires an argument (-n <name>, -w <wishes>).
# A colon (:) AT THE START silences default bash error messages so we can handle them cleanly.
while getopts ":n:w:h" opt; do
  case $opt in
    n)
      NAME="$OPTARG"
      ;;
    w)
      WISHES="$OPTARG"
      ;;
    h|*)
      usage
      ;;
    \?)
      echo "Error: Invalid option -$OPTARG" >&2
      usage
      ;;
    :)
      echo "Error: Option -$OPTARG requires an argument." >&2
      usage
      ;;
  esac
done

# Validate that required flags were provided
if [ -z "$NAME" ]; then
  echo "Error: -n <NAME> is required." >&2
  usage
fi
#echo "Hello $NAME. $WISHES. I have been practicing shellscript" 
echo "Hello $NAME $WISHES I have been practicing shellscript" 
