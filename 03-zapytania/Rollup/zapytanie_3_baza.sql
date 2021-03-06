SELECT DISTINCT id_pracownik, stanowisko.nazwa_stanowiska, zabieg.nazwa, Count(*) ile
FROM wizyta, stanowisko, zabieg
WHERE wizyta.termin >= To_Date('2020-01-01', 'YYYY-MM-DD') AND
 wizyta.termin < To_Date('2021-01-01', 'YYYY-MM-DD')
GROUP BY rollup(id_pracownik, stanowisko.nazwa_stanowiska, zabieg.nazwa);