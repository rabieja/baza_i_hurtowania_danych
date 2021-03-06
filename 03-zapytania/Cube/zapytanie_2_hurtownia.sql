
SELECT DISTINCT id_wizyta,typ_zabiegu_wymiar.nazwa, salon_wymiar.nazwa, Count(*) AS ile
FROM wizyta_fakt, typ_zabiegu_wymiar, salon_wymiar
WHERE wizyta_fakt.termin = To_Date('2020-12-03', 'YYYY-MM-DD')
GROUP BY cube(id_wizyta,typ_zabiegu_wymiar.nazwa, salon_wymiar.nazwa);
