load data
infile 'dane\wyplata.csv'
into table wyplata
replace
fields terminated by ','
(id_wyplata,kwota)