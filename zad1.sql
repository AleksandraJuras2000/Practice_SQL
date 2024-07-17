-- ctrl + shift + p  --> otwiera noey terminal

--0. Sprawdzanie dotępnych baz
SELECT * FROM sys.databases;

-- 1. Tworzenie nowej bazy
CREATE DATABASE firma;
Drop DATABASE firma

-- 2. Tworzenie nowego schematu
-- schamt zwwany jest też kolekcją, to podsawowy obiekt, w którym umieszczane sa tabele, widoki, indeksyi pakiety
CREATE SCHEMA rozliczenia;

-- 3a. Tworzenie tabeli
CREATE TABLE rozliczenia. pracownicy
(id_pracownika  NUMERIC(5)   CONSTRAINT pk_pr PRIMARY KEY IDENTITY(1,1),
imie            VARCHAR(30)     NOT NULL,
nazwisko        VARCHAR(30)     NOT NULL,
adres		    VARCHAR(30)		NOT NULL,
telefon		    VARCHAR(12)		CHECK(LEN(telefon)>=9),
);


CREATE TABLE rozliczenia.godziny
(id_godziny		NUMERIC(5)	CONSTRAINT pk_g PRIMARY KEY	IDENTITY(1,1),
 data			DATE,
 liczba_godzin  NUMERIC(8)	NOT NULL,
 id_pracownika	NUMERIC(5)	NOT NULL,
);


CREATE TABLE rozliczenia.pensje
(id_pensje		NUMERIC(5)	CONSTRAINT pk_pe PRIMARY KEY	IDENTITY(1,1),
 stanowisko		VARCHAR(30)	NOT NULL,
 kwota			FLOAT(8)	NOT NULL,
 id_premii		NUMERIC(5),
);


CREATE TABLE rozliczenia.premie
(id_premii		NUMERIC(5)	CONSTRAINT pk_pre PRIMARY KEY	IDENTITY(1,1),
 rodzoj			VARCHAR(20)	NOT NULL,
 kwota			FLOAT(7),
);

--3b. DODAJE KLUCZE OBCE ZA POMOCA ALTER TABLE I ZMIENIAM TEZ NAZWE TABELI
-- klucz obcy jest to kolumna lub grupa kolumn w jednej tabeli stanowiąca klucz główny w innej tabeli, zapewnia integralośc danych
EXEC sp_rename 'rozliczenia.premie.rodzoj', 'rodzaj', 'COLUMN';

ALTER TABLE rozliczenia.godziny ADD FOREIGN KEY(id_pracownika) REFERENCES rozliczenia.pracownicy(id_pracownika);
ALTER TABLE rozliczenia.pensje ADD FOREIGN KEY(id_premii) REFERENCES rozliczenia.premie(id_premii);


--4. Wypełnianie rekordami
--a. pracownicy
INSERT INTO rozliczenia.pracownicy(imie, nazwisko, adres, telefon) VALUES ('Andrzej', 'Bargiel', 'ul.Sikorki 45', '886767999')
INSERT INTO rozliczenia.pracownicy(imie, nazwisko, adres, telefon) VALUES ('Tomasz', 'Fuziak', 'ul.Nowa 34', '885678940')
INSERT INTO rozliczenia.pracownicy(imie, nazwisko, adres, telefon) VALUES ('Aleksandra', 'Kolińska', 'ul.Wolna 77', '678456789')
INSERT INTO rozliczenia.pracownicy(imie, nazwisko, adres, telefon) VALUES ('Anna', 'Białka', 'os.Lotników 37/56', '777890555')
INSERT INTO rozliczenia.pracownicy(imie, nazwisko, adres, telefon) VALUES ('Bogusław', 'Monte', 'os.Bogaczy 44/77', '512789455')
INSERT INTO rozliczenia.pracownicy(imie, nazwisko, adres, telefon) VALUES ('Dominik', 'Stanicki', 'os.Inwalidów 66/85 ', '567777908')
INSERT INTO rozliczenia.pracownicy(imie, nazwisko, adres, telefon) VALUES ('Paweł', 'Pilicki', 'ul.Moreny 32', '889678451')
INSERT INTO rozliczenia.pracownicy(imie, nazwisko, adres, telefon) VALUES ('Patrycja', 'Porwała', 'ul.Kubicy 6', '666995000')
INSERT INTO rozliczenia.pracownicy(imie, nazwisko, adres, telefon) VALUES ('Magdalena', 'Jorusza', 'os.Złotego Wieku 35/99', '454989009')
INSERT INTO rozliczenia.pracownicy(imie, nazwisko, adres, telefon) VALUES ('Genowefa', 'Kudłacz', 'ul.Orłów 10', '881211774')
SELECT * FROM rozliczenia.pracownicy

--b. godziny
INSERT INTO rozliczenia.godziny(data, liczba_godzin, id_pracownika) VALUES ('2021/12/12', '67', '1')
INSERT INTO rozliczenia.godziny(data, liczba_godzin, id_pracownika) VALUES ('2021/11/23', '90', '2')
INSERT INTO rozliczenia.godziny(data, liczba_godzin, id_pracownika) VALUES ('2020/09/12', '101', '5')
INSERT INTO rozliczenia.godziny(data, liczba_godzin, id_pracownika) VALUES ('2020/12/24', '24', '9')
INSERT INTO rozliczenia.godziny(data, liczba_godzin, id_pracownika) VALUES ('2020/08/10', '57', '10')
INSERT INTO rozliczenia.godziny(data, liczba_godzin, id_pracownika) VALUES ('2020/03/15', '18', '3')
INSERT INTO rozliczenia.godziny(data, liczba_godzin, id_pracownika) VALUES ('2020/07/28', '37', '6')
INSERT INTO rozliczenia.godziny(data, liczba_godzin, id_pracownika) VALUES ('2020/12/30', '32', '4')
INSERT INTO rozliczenia.godziny(data, liczba_godzin, id_pracownika) VALUES ('2020/11/03', '20', '7')
INSERT INTO rozliczenia.godziny(data, liczba_godzin, id_pracownika) VALUES ('2020/11/16', '13', '8')
SELECT * FROM rozliczenia.godziny

--c. premie
INSERT INTO rozliczenia.premie(rodzaj, kwota) VALUES ('regulaminowa', 321.89)
INSERT INTO rozliczenia.premie(rodzaj, kwota) VALUES ('regulaminowa', 334.34)
INSERT INTO rozliczenia.premie(rodzaj, kwota) VALUES ('regulaminowa', 298.90)
INSERT INTO rozliczenia.premie(rodzaj, kwota) VALUES ('uznaniowa', 456.99)
INSERT INTO rozliczenia.premie(rodzaj, kwota) VALUES ('regulaminowa', 301.46)
INSERT INTO rozliczenia.premie(rodzaj, kwota) VALUES ('uznaniowa', 437.90)
INSERT INTO rozliczenia.premie(rodzaj, kwota) VALUES ('uznaniowa', 678.91)
INSERT INTO rozliczenia.premie(rodzaj, kwota) VALUES ('regulaminowa', 789.21)
INSERT INTO rozliczenia.premie(rodzaj, kwota) VALUES ('regulaminowa', 197.66)
INSERT INTO rozliczenia.premie(rodzaj, kwota) VALUES ('uznaniowa', 543.11)
SELECT * FROM rozliczenia.premie

--d. pensje
INSERT INTO rozliczenia.pensje(stanowisko, kwota, id_premii) VALUES ('Project meneger', '5200', 1)
INSERT INTO rozliczenia.pensje(stanowisko, kwota, id_premii) VALUES ('Analityk biznesowy', '6200', 3)
INSERT INTO rozliczenia.pensje(stanowisko, kwota, id_premii) VALUES ('Architekt systemu', '5300', 5)
INSERT INTO rozliczenia.pensje(stanowisko, kwota, id_premii) VALUES ('Tester oprogramownaia', '4900', 7)
INSERT INTO rozliczenia.pensje(stanowisko, kwota, id_premii) VALUES ('Administrator sici LAN', '5300', 9)
INSERT INTO rozliczenia.pensje(stanowisko, kwota, id_premii) VALUES ('Administrator sici WAN', '5300', 2)
INSERT INTO rozliczenia.pensje(stanowisko, kwota, id_premii) VALUES ('Administrator serwerów', '6100', 4)
INSERT INTO rozliczenia.pensje(stanowisko, kwota, id_premii) VALUES ('Informatyk', '4800', 6)
INSERT INTO rozliczenia.pensje(stanowisko, kwota, id_premii) VALUES ('Grafik komputerowy', '6600', 8)
INSERT INTO rozliczenia.pensje(stanowisko, kwota, id_premii) VALUES ('Inżynier oprogramowania', '5000', 10)
SELECT * FROM rozliczenia.pensje



--e. drobna zmiana aby sprawdzić jak dziala git
UPDATE rozliczenia.pracownicy SET telefon = '123456789' WHERE rozliczenia.pracownicy.nazwisko = 'Monte'
SELECT * from rozliczenia.pracownicy



--5. wyświetl pracowników i ich adresy
SELECT nazwisko, adres FROM rozliczenia.pracownicy

--6. konwersja
SELECT id_godziny, liczba_godzin, id_pracownika, DATEPART(wk,[data]) as [tyg], DATEPART(mm,[data]) as [mies] From rozliczenia.godziny

-- 7. Kowta netto i kwota brutto
EXEC sp_rename 'rozliczenia.pensje.kwota', 'kwota_brutto', 'COLUMN';
ALTER TABLE rozliczenia.pensje ADD kwota_netto FLOAT(8) NULL;
UPDATE rozliczenia.pensje SET kwota_netto = kwota_brutto*0.81

SELECT * FROM rozliczenia.pensje

-- aby znaleźć się w repo na bashu trzeba napierw nawigować do niego cd ... nastepnie możemy sprawdzić status git status
-- git --version --> pokazuje jaka mamy wersje gita
-- pwd  --> pokazuje na jakiej ścieżce jesteśmy
-- ls -l  --> pokazuje wiecej info o plikach lub katalogach
-- rm   --> usuwa pliki
-- git log  --> pokazuje historie komitów
-- git show [numer commit'a]  --> pokazuje wszytko o tym kommicie
-- git config --global --list  --> pokazuje informacje o nas
-- git config --global user.name "Crypto Frau"  --> zmienia 
-- touch [nawa.rozszerzenie]  --> toworzy plik
 