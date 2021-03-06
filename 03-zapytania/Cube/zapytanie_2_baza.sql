SELECT DISTINCT id_wizyta,typ_zabiegu.nazwa, salon.nazwa, Count(*) AS ile
FROM wizyta, typ_zabiegu, salon
WHERE wizyta.termin = To_Date('2020-12-03', 'YYYY-MM-DD')
GROUP BY cube(id_wizyta,typ_zabiegu.nazwa, salon.nazwa);

