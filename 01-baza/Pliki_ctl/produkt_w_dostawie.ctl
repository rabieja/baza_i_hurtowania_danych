load data
infile 'dane\produkt_w_dostawie.csv'
into table produkt_w_dostawie
replace
fields terminated by ','
(id_produkt_w_dostawie,ilosc,id_dostawa)