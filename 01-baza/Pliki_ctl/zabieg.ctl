load data
infile 'dane\zabieg.csv'
into table zabieg
replace
fields terminated by ','
(id_zabieg,nazwa,id_typ_zabiegu)