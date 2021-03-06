load data
infile 'dane\adres_wymiar.csv'
into table adres_wymiar
replace
fields terminated by ','
(id_adres,ulica,nr_lokalu,panstwo,id_miasto)