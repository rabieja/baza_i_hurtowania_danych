load data
infile 'dane\typ_zabiegu_wymiar.csv'
into table typ_zabiegu_wymiar
replace
fields terminated by ','
(id_typ_zabiegu,nazwa)