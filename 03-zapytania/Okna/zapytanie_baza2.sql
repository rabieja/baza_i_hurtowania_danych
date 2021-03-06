SELECT DISTINCT  zabieg.nazwa, typ_zabiegu.nazwa, salon.nazwa, Count(id_zabieg) OVER (PARTITION BY typ_zabiegu.id_typ_zabiegu, salon.nazwa)
AS ile
FROM zabieg, typ_zabiegu, salon
WHERE typ_zabiegu.id_typ_zabiegu = zabieg.id_typ_zabiegu