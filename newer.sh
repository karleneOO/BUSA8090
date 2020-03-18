#!/bin/bash
# save as newer.sh
# gives the newest file when given a list of file names

ls -t $@ | head -n 1
