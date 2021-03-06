load data
infile 'dane\wizyta.csv'
into table wizyta
replace
fields terminated by ','
(id_wizyta,termin,id_klient,id_salon,id_pracownik,id_zabieg)