
SELECT DISTINCT id_klient, Count(*) AS ile, zabieg_wymiar.nazwa, salon_wymiar.nazwa AS salon
FROM wizyta_fakt, zabieg_wymiar, salon_wymiar
WHERE wizyta_fakt.id_zabieg = zabieg_wymiar.id_zabieg AND salon_wymiar.id_salon = wizyta_fakt.id_salon
GROUP BY Rollup(id_klient, zabieg_wymiar.nazwa, salon_wymiar.nazwa);
