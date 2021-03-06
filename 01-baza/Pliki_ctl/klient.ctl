load data
infile 'dane\klient.csv'
into table klient
replace
fields terminated by ','
(id_klient,imie,nazwisko,nr_telefonu)