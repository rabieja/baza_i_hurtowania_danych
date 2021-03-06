load data
infile 'dane\typ_zabiegu.csv'
into table typ_zabiegu
replace
fields terminated by ','
(id_typ_zabiegu,nazwa)