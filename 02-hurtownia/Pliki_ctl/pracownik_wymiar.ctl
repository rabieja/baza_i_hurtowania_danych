load data
infile 'dane\pracownik_wymiar.csv'
into table pracownik_wymiar
replace
fields terminated by ','
(id_pracownik,imie,nazwisko,id_stanowisko,id_salon)