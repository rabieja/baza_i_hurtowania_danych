load data
infile 'dane\cena_u_dystrybutora.csv'
into table cena_u_dystrybutora
replace
fields terminated by ','
(id_cena_u_dystrybutora,cena_za_sztuke,id_dystrybutor,id_produkt)