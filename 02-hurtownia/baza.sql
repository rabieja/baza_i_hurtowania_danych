DROP TABLE wizyta_fakt;
DROP TABLE klient_wymiar;
DROP TABLE pracownik_wymiar;
DROP TABLE zabieg_wymiar;
DROP TABLE typ_zabiegu_wymiar;
DROP TABLE salon_wymiar;
DROP TABLE adres_wymiar;
DROP TABLE miasto_wymiar;
DROP TABLE stanowisko_wymiar;

CREATE TABLE miasto_wymiar (
    id_miasto       NUMBER(5, 0) NOT NULL,
    nazwa   VARCHAR2(40),
    kod_pocztowy         VARCHAR2(40),
    PRIMARY KEY ( id_miasto)
);

CREATE TABLE adres_wymiar (
    id_adres        NUMBER(5, 0) NOT NULL,
    ulica   VARCHAR2(40),
    nr_lokalu    VARCHAR2(4),
    panstwo    VARCHAR2(40),
    id_miasto    NUMBER(5, 0),
    CONSTRAINT fk_miasto_aw   FOREIGN KEY (id_miasto) REFERENCES miasto_wymiar(id_miasto),
    PRIMARY KEY ( id_adres )
);

CREATE TABLE salon_wymiar (
    id_salon        NUMBER(5, 0) NOT NULL,
    nazwa              VARCHAR2(40) NOT NULL,
    id_adres         NUMBER(5, 0),
    CONSTRAINT fk_adres_sw   FOREIGN KEY (id_adres) REFERENCES adres_wymiar(id_adres),
    PRIMARY KEY ( id_salon )
);
CREATE TABLE stanowisko_wymiar (
    id_stanowisko        NUMBER(5, 0) NOT NULL,
    nazwa_stanowiska  VARCHAR2(40),
    PRIMARY KEY ( id_stanowisko )
);
CREATE TABLE pracownik_wymiar (
    id_pracownik        NUMBER(5, 0) NOT NULL,
    imie    VARCHAR2(40) NOT NULL,
    nazwisko   VARCHAR2(40) NOT NULL,
    id_stanowisko          NUMBER(5, 0),
    id_salon          NUMBER(5, 0),
    CONSTRAINT fk_stanowisko_p   FOREIGN KEY (id_stanowisko) REFERENCES stanowisko_wymiar(id_stanowisko),
    CONSTRAINT fk_salon_pw   FOREIGN KEY (id_salon) REFERENCES salon_wymiar(id_salon),
    PRIMARY KEY ( id_pracownik )
);
CREATE TABLE klient_wymiar (
    id_klient       NUMBER(5, 0) NOT NULL,
    imie  VARCHAR2(40),
    nazwisko  VARCHAR2(40), not
    nr_telefonu  VARCHAR2(40),
    PRIMARY KEY ( id_klient)
);

CREATE TABLE typ_zabiegu_wymiar (
    id_typ_zabiegu       NUMBER(5, 0) NOT NULL,
    nazwa VARCHAR2(120),
    PRIMARY KEY ( id_typ_zabiegu)
);

CREATE TABLE zabieg_wymiar (
    id_zabieg       NUMBER(5, 0) NOT NULL,
    nazwa   VARCHAR2(120),
    id_typ_zabiegu          NUMBER(5, 0),
    CONSTRAINT fk_typ_zabiegu_zw   FOREIGN KEY (id_typ_zabiegu) REFERENCES typ_zabiegu_wymiar(id_typ_zabiegu),
    PRIMARY KEY ( id_zabieg)
);

CREATE TABLE wizyta_fakt (
    id_wizyta       NUMBER(5, 0) NOT NULL,
    termin            DATE,
    id_klient          NUMBER(5, 0),
    id_salon          NUMBER(5, 0),
    id_pracownik          NUMBER(5, 0),
    id_zabieg          NUMBER(5, 0),
    id_typ_zabiegu     NUMBER(5, 0),
    id_adres        NUMBER(5, 0),
    id_miasto          NUMBER(5, 0),
    id_stanowisko    NUMBER(5, 0),
    CONSTRAINT fk_typ_zabiegu_fakt   FOREIGN KEY (id_typ_zabiegu) REFERENCES typ_zabiegu_wymiar(id_typ_zabiegu),
    CONSTRAINT fk_adres_fakt   FOREIGN KEY (id_adres) REFERENCES adres_wymiar(id_adres),
    CONSTRAINT fk_miasto_fakt   FOREIGN KEY (id_miasto) REFERENCES miasto_wymiar(id_miasto),
    CONSTRAINT fk_stanowisko_fakt   FOREIGN KEY (id_stanowisko) REFERENCES stanowisko_wymiar(id_stanowisko),
    CONSTRAINT fk_pracownik_fakt   FOREIGN KEY (id_pracownik) REFERENCES pracownik_wymiar(id_pracownik),
    CONSTRAINT fk_zabieg_fakt   FOREIGN KEY (id_zabieg) REFERENCES zabieg_wymiar(id_zabieg),
    CONSTRAINT fk_klient_fakt   FOREIGN KEY (id_klient) REFERENCES klient_wymiar(id_klient),
    CONSTRAINT fk_salon_fakt   FOREIGN KEY (id_salon) REFERENCES salon_wymiar(id_salon),
    PRIMARY KEY ( id_wizyta)
);
