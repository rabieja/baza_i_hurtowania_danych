load data
infile 'dane\dostawa.csv'
into table dostawa
replace
fields terminated by ','
(id_dostawa,termin_dostawy,id_dystrybutor,id_salon)