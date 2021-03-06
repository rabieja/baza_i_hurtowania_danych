load data
infile 'dane\produkt.csv'
into table produkt
replace
fields terminated by ','
(id_produkt,nazwa)