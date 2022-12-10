load data
infile 'regions-france.csv'
into table reg
fields terminated by ','
(code_region, nom_region)