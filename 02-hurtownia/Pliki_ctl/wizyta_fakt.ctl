load data
infile 'dane\wizyta_fakt.csv'
into table wizyta_fakt
replace
fields terminated by ','
(id_wizyta,termin,id_klient,id_salon,id_pracownik,id_zabieg,id_typ_zabiegu,id_adres,id_miasto,id_stanowisko)