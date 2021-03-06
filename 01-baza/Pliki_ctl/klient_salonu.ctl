load data
infile 'dane\klient_salonu.csv'
into table klient_salonu
replace
fields terminated by ','
(id_klient_salonu,rabat,id_klient,id_salon)