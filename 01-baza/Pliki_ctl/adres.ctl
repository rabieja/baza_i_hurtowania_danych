load data
infile 'dane\adres.csv'
into table adres
replace
fields terminated by ','
(id_adres,ulica,nr_lokalu,panstwo,id_miasto)