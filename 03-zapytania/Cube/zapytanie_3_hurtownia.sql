SELECT DISTINCT id_pracownik, stanowisko_wymiar.nazwa_stanowiska, zabieg_wymiar.nazwa, Count(*) ile
FROM wizyta_fakt, stanowisko_wymiar, zabieg_wymiar
WHERE wizyta_fakt.termin >= To_Date('2020-01-01', 'YYYY-MM-DD') AND
 wizyta_fakt.termin < To_Date('2021-01-01', 'YYYY-MM-DD')
GROUP BY cube(id_pracownik, stanowisko_wymiar.nazwa_stanowiska, zabieg_wymiar.nazwa);
