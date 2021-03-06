load data
infile 'dane\pracownik.csv'
into table pracownik
replace
fields terminated by ','
(id_pracownik,imie,nazwisko,id_stanowisko,id_salon,id_wyplata)