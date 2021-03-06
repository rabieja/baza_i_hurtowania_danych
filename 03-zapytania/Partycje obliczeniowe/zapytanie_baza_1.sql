SELECT DISTINCT wizyta.id_klient,zabieg.nazwa AS nazwa_zabiegu,typ_zabiegu.nazwa AS typ_zabiegu,
ROUND((100*COUNT(typ_zabiegu.id_typ_zabiegu) OVER (PARTITION BY wizyta.id_klient,zabieg.nazwa,typ_zabiegu.nazwa)/Count(typ_zabiegu.id_typ_zabiegu)
OVER (PARTITION BY wizyta.id_klient,zabieg.nazwa)),2) "procent" FROM wizyta,zabieg,typ_zabiegu WHERE wizyta.id_zabieg = zabieg.id_zabieg AND zabieg.id_typ_zabiegu = typ_zabiegu.id_typ_zabiegu
