SELECT DISTINCT id_salon, Count(*) AS ile, zabieg_wymiar.nazwa, typ_zabiegu_wymiar.nazwa,
DENSE_RANK() OVER (ORDER BY Count(*) DESC) "ranking" FROM wizyta_fakt, typ_zabiegu_wymiar, zabieg_wymiar
WHERE
wizyta_fakt.id_zabieg = zabieg_wymiar.id_zabieg AND zabieg_wymiar.id_typ_zabiegu = typ_zabiegu_wymiar.id_typ_zabiegu
GROUP BY (id_salon, zabieg_wymiar.nazwa, typ_zabiegu_wymiar.nazwa);