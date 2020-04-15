SELECT DISTINCT a.metabolism FROM annotation a INNER JOIN annotation m on a.metabolism = m.metabolism WHERE a.gene <> m.gene;
