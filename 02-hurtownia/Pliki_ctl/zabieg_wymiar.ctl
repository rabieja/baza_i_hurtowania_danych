load data
infile 'dane\zabieg_wymiar.csv'
into table zabieg_wymiar
replace
fields terminated by ','
(id_zabieg,nazwa,id_typ_zabiegu)