load data
infile 'dane\salon.csv'
into table salon
replace
fields terminated by ','
(id_salon,nazwa,id_adres)