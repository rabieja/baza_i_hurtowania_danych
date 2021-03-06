SELECT DISTINCT id_klient, Count(*) AS ile, pracownik_wymiar.imie, pracownik_wymiar.nazwisko, zabieg_wymiar.nazwa,
DENSE_RANK() OVER (ORDER BY Count(*) DESC) "ranking" FROM wizyta_fakt, pracownik_wymiar, zabieg_wymiar
WHERE
wizyta_fakt.id_pracownik = pracownik_wymiar.id_pracownik AND wizyta_fakt.id_zabieg = zabieg_wymiar.id_zabieg
GROUP BY (id_klient, pracownik_wymiar.imie, pracownik_wymiar.nazwisko, zabieg_wymiar.nazwa);

