load data
infile 'dane\miasto_wymiar.csv'
into table miasto_wymiar
replace
fields terminated by ','
(id_miasto,nazwa,kod_pocztowy)