load data
infile 'dane\dystrybutor.csv'
into table dystrybutor
replace
fields terminated by ','
(id_dystrybutor,nazwa)