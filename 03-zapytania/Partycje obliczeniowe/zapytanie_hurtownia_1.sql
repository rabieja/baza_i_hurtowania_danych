
SELECT DISTINCT wizyta_fakt.id_klient,zabieg_wymiar.nazwa AS nazwa_zabiegu,typ_zabiegu_wymiar.nazwa AS typ_zabiegu,
ROUND((100*COUNT(typ_zabiegu_wymiar.id_typ_zabiegu) OVER (PARTITION BY wizyta_fakt.id_klient,zabieg_wymiar.nazwa,typ_zabiegu_wymiar.nazwa)/Count(typ_zabiegu_wymiar.id_typ_zabiegu)
OVER (PARTITION BY wizyta_fakt.id_klient,zabieg_wymiar.nazwa)),2) "procent" FROM wizyta_fakt,zabieg_wymiar,typ_zabiegu_wymiar WHERE wizyta_fakt.id_zabieg = zabieg_wymiar.id_zabieg AND zabieg_wymiar.id_typ_zabiegu = typ_zabiegu_wymiar.id_typ_zabiegu