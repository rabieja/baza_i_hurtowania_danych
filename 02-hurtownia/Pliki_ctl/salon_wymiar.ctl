load data
infile 'dane\salon_wymiar.csv'
into table salon_wymiar
replace
fields terminated by ','
(id_salon,nazwa,id_adres)