SELECT DISTINCT  klient_wymiar.imie, klient_wymiar.nazwisko,zabieg_wymiar.nazwa, typ_zabiegu_wymiar.nazwa, salon_wymiar.nazwa, Count(id_zabieg) OVER (PARTITION BY typ_zabiegu_wymiar.id_typ_zabiegu, salon_wymiar.nazwa, zabieg_wymiar.nazwa)
AS ile
FROM zabieg_wymiar,typ_zabiegu_wymiar, salon_wymiar, klient_wymiar
WHERE typ_zabiegu_wymiar.id_typ_zabiegu = zabieg_wymiar.id_typ_zabiegu