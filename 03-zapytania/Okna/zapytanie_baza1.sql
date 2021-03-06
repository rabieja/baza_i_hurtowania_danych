SELECT DISTINCT  zabieg.nazwa, typ_zabiegu.nazwa, Count(id_zabieg) OVER (PARTITION BY typ_zabiegu.id_typ_zabiegu)
AS ile
FROM zabieg, typ_zabiegu
WHERE typ_zabiegu.id_typ_zabiegu = zabieg.id_typ_zabiegu