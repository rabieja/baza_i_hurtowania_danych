load data
infile 'dane\stanowisko.csv'
into table stanowisko
replace
fields terminated by ','
(id_stanowisko,nazwa_stanowiska)