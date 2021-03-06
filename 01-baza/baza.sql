DROP TABLE klient_salonu;
DROP TABLE produkt_w_dostawie;
DROP TABLE dostawa;
DROP TABLE cena_u_dystrybutora;
DROP TABLE dystrybutor;
DROP TABLE wizyta;
DROP TABLE klient;
DROP TABLE pracownik;
DROP TABLE wyplata;
DROP TABLE cena_zabiegu;
DROP TABLE zabieg;
DROP TABLE typ_zabiegu;
DROP TABLE salon;
DROP TABLE adres;
DROP TABLE miasto;
DROP TABLE produkt;
DROP TABLE stanowisko;

CREATE TABLE miasto (
    id_miasto       NUMBER(5, 0) NOT NULL,
    nazwa   VARCHAR2(40),
    kod_pocztowy         VARCHAR2(40),
    PRIMARY KEY ( id_miasto)
);

CREATE TABLE adres (
    id_adres        NUMBER(5, 0) NOT NULL,
    ulica   VARCHAR2(40),
    nr_lokalu    VARCHAR2(4),
    panstwo    VARCHAR2(40),
    id_miasto    NUMBER(5, 0),
    CONSTRAINT fk_miasto_adres   FOREIGN KEY (id_miasto) REFERENCES miasto(id_miasto),
    PRIMARY KEY ( id_adres )
);

CREATE TABLE salon (
    id_salon        NUMBER(5, 0) NOT NULL,
    nazwa              VARCHAR2(40) NOT NULL,
    id_adres         NUMBER(5, 0),
    CONSTRAINT fk_adres_salon   FOREIGN KEY (id_adres) REFERENCES adres(id_adres),
    PRIMARY KEY ( id_salon )
);
CREATE TABLE stanowisko (
    id_stanowisko        NUMBER(5, 0) NOT NULL,
    nazwa_stanowiska  VARCHAR2(40),
    PRIMARY KEY ( id_stanowisko )
);
CREATE TABLE wyplata (
    id_wyplata       NUMBER(5, 0) NOT NULL,
    kwota     number(6,0),
    PRIMARY KEY ( id_wyplata )
);

CREATE TABLE pracownik (
    id_pracownik        NUMBER(5, 0) NOT NULL,
    imie    VARCHAR2(40) NOT NULL,
    nazwisko   VARCHAR2(40) NOT NULL,
    id_stanowisko          NUMBER(5, 0),
    id_salon          NUMBER(5, 0),
    id_wyplata          NUMBER(5, 0),
    CONSTRAINT fk_stanowisko_pracownik   FOREIGN KEY (id_stanowisko) REFERENCES stanowisko(id_stanowisko),
    CONSTRAINT fk_salon_pracownik   FOREIGN KEY (id_salon) REFERENCES salon(id_salon),
    CONSTRAINT fk_wyplata_pracownik   FOREIGN KEY (id_wyplata) REFERENCES wyplata(id_wyplata),
    PRIMARY KEY ( id_pracownik )
);
CREATE TABLE klient (
    id_klient       NUMBER(5, 0) NOT NULL,
    imie  VARCHAR2(40),
    nazwisko  VARCHAR2(40),
    nr_telefonu  VARCHAR2(40),
    PRIMARY KEY ( id_klient)
);

CREATE TABLE klient_salonu (
    id_klient_salonu       NUMBER(5, 0) NOT NULL,
    rabat    NUMBER(3, 0),
    id_klient          NUMBER(5, 0),
    id_salon          NUMBER(5, 0),
    CONSTRAINT fk_klient_klient_salonu   FOREIGN KEY (id_klient) REFERENCES klient(id_klient),
    CONSTRAINT fk_salon_klient_salonu   FOREIGN KEY (id_salon) REFERENCES salon(id_salon),
    PRIMARY KEY ( id_klient_salonu)
);
CREATE TABLE typ_zabiegu (
    id_typ_zabiegu       NUMBER(5, 0) NOT NULL,
    nazwa VARCHAR2(120),
    PRIMARY KEY ( id_typ_zabiegu)
);

CREATE TABLE zabieg (
    id_zabieg       NUMBER(5, 0) NOT NULL,
    nazwa   VARCHAR2(120),
    id_typ_zabiegu          NUMBER(5, 0),
    CONSTRAINT fk_typ_zabiegu_zabieg   FOREIGN KEY (id_typ_zabiegu) REFERENCES typ_zabiegu(id_typ_zabiegu),
    PRIMARY KEY ( id_zabieg)
);

CREATE TABLE wizyta (
    id_wizyta       NUMBER(5, 0) NOT NULL,
    termin            DATE,
    id_klient          NUMBER(5, 0),
    id_salon          NUMBER(5, 0),
    id_pracownik          NUMBER(5, 0),
    id_zabieg          NUMBER(5, 0),
    CONSTRAINT fk_pracownik_wizyta   FOREIGN KEY (id_pracownik) REFERENCES pracownik(id_pracownik),
    CONSTRAINT fk_zabieg_wizyta   FOREIGN KEY (id_zabieg) REFERENCES zabieg(id_zabieg),
    CONSTRAINT fk_klient_wizyta   FOREIGN KEY (id_klient) REFERENCES klient(id_klient),
    CONSTRAINT fk_salon_wizyta   FOREIGN KEY (id_salon) REFERENCES salon(id_salon),
    PRIMARY KEY ( id_wizyta)
);
CREATE TABLE cena_zabiegu (
    id_cena_zabiegu    NUMBER(5, 0) NOT NULL,
    cena    NUMBER(5, 0),
    id_zabieg          NUMBER(5, 0),
    id_salon          NUMBER(5, 0),
    CONSTRAINT fk_zabieg_cena_zabiegu   FOREIGN KEY (id_zabieg) REFERENCES zabieg(id_zabieg),
    CONSTRAINT fk_salon_cena_zabiegu   FOREIGN KEY (id_salon) REFERENCES salon(id_salon),
    PRIMARY KEY ( id_cena_zabiegu)
);
CREATE TABLE dystrybutor (
    id_dystrybutor    NUMBER(5, 0) NOT NULL,
    nazwa     VARCHAR2(120),
    PRIMARY KEY ( id_dystrybutor )
);

CREATE TABLE dostawa (
    id_dostawa   NUMBER(5, 0) NOT NULL,
    termin_dostawy            DATE,
    id_dystrybutor          NUMBER(5, 0),
    id_salon          NUMBER(5, 0),
    CONSTRAINT fk_dystrybutor_dostawa   FOREIGN KEY (id_dystrybutor) REFERENCES dystrybutor(id_dystrybutor),
    CONSTRAINT fk_salon_dostawa   FOREIGN KEY (id_salon) REFERENCES salon(id_salon),
    PRIMARY KEY ( id_dostawa)
);
CREATE TABLE produkt (
    id_produkt   NUMBER(5, 0) NOT NULL,
    nazwa   VARCHAR2(120) ,
    PRIMARY KEY ( id_produkt)
);

CREATE TABLE produkt_w_dostawie (
    id_produkt_w_dostawie   NUMBER(5, 0) NOT NULL,
    ilosc            NUMBER(10, 0) ,
    id_dostawa          NUMBER(5, 0),
    CONSTRAINT fk_dostawa_pwd   FOREIGN KEY (id_dostawa) REFERENCES dostawa(id_dostawa),
    PRIMARY KEY ( id_produkt_w_dostawie)
);
CREATE TABLE cena_u_dystrybutora (
    id_cena_u_dystrybutora   NUMBER(5, 0) NOT NULL,
    cena_za_sztuke            NUMBER(10, 0) ,
    id_dystrybutor          NUMBER(5, 0),
    id_produkt          NUMBER(5, 0),
    CONSTRAINT fk_dystrybutor_cud   FOREIGN KEY (id_dystrybutor) REFERENCES dystrybutor(id_dystrybutor),
    CONSTRAINT fk_produkt_cud  FOREIGN KEY (id_produkt) REFERENCES produkt(id_produkt),
    PRIMARY KEY ( id_cena_u_dystrybutora)
);
