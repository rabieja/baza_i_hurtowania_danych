load data
infile 'dane\miasto.csv'
into table miasto
replace
fields terminated by ','
(id_miasto,nazwa,kod_pocztowy)