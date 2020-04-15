#!/bin/bash
mysql -u awkologist -p compbiol -e 'select a.gene, a.function, e.expr_value from annotation a inner join expression e on a.gene = e.gene;' 
