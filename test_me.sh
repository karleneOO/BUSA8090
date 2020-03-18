#!/bin/bash
#Save as test_me.sh
#Tests if an argument has been included when invoking the script

if [ "$*" ]
then
  echo "This is a TEST"
else
  echo "This is NOT a test"
fi


