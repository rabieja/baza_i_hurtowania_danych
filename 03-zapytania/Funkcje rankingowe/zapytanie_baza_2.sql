SELECT DISTINCT id_klient, Count(*) AS ile, zabieg.nazwa, typ_zabiegu.nazwa,
DENSE_RANK() OVER (ORDER BY Count(*) DESC) "ranking" FROM wizyta, typ_zabiegu, zabieg
WHERE
wizyta.id_zabieg = zabieg.id_zabieg AND zabieg.id_typ_zabiegu = typ_zabiegu.id_typ_zabiegu
GROUP BY (id_klient, zabieg.nazwa, typ_zabiegu.nazwa);
