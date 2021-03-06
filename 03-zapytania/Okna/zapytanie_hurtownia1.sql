SELECT DISTINCT  zabieg_wymiar.nazwa, typ_zabiegu_wymiar.nazwa, Count(id_zabieg) OVER (PARTITION BY typ_zabiegu_wymiar.id_typ_zabiegu)
AS ile
FROM zabieg_wymiar, typ_zabiegu_wymiar
WHERE typ_zabiegu_wymiar.id_typ_zabiegu = zabieg_wymiar.id_typ_zabiegu