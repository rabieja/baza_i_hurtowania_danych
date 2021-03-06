load data
infile 'dane\klient_wymiar.csv'
into table klient_wymiar
replace
fields terminated by ','
(id_klient,imie,nazwisko,nr_telefonu)