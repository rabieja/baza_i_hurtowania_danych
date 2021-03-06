SELECT DISTINCT id_klient, Count(*) AS ile, zabieg.nazwa, salon.nazwa AS salon
FROM wizyta, zabieg, salon
WHERE wizyta.id_zabieg = zabieg.id_zabieg AND salon.id_salon = wizyta.id_salon
GROUP BY Rollup(id_klient, zabieg.nazwa, salon.nazwa);
