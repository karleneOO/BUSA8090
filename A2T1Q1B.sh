#!/bin/bash
awk 'BEGIN{FS=OFS="\t"} NR==1 {print} $2~/ase/ {print}' annotation.tab
