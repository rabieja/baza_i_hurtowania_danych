load data
infile 'dane\stanowisko_wymiar.csv'
into table stanowisko_wymiar
replace
fields terminated by ','
(id_stanowisko,nazwa_stanowiska)