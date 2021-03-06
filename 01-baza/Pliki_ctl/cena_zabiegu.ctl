load data
infile 'dane\cena_zabiegu.csv'
into table cena_zabiegu
replace
fields terminated by ','
(id_cena_zabiegu,cena,id_zabieg,id_salon)