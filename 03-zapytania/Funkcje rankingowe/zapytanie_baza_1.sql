SELECT DISTINCT id_klient, Count(*) AS ile, pracownik.imie, pracownik.nazwisko, zabieg.nazwa,
DENSE_RANK() OVER (ORDER BY Count(*) DESC) "ranking" FROM wizyta, pracownik, zabieg
WHERE
wizyta.id_pracownik = pracownik.id_pracownik AND wizyta.id_zabieg = zabieg.id_zabieg
GROUP BY (id_klient, pracownik.imie, pracownik.nazwisko, zabieg.nazwa);

