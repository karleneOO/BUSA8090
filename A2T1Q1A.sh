#!/bin/bash
awk 'BEGIN{FS=OFS="\t"}NR == 1 {print}{if ($2<1000) print}' expression.tab
