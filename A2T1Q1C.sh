#!/bin/bash
awk 'BEGIN{FS=OFS="\t"}{IGNORECASE=1} NR==1 {print} $3~/(purine|Pyrimidine) biosynthesis/ {print}' annotation.tab
