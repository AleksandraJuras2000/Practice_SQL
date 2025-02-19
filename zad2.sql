USE firma;

--2. nowy schemat
CREATE SCHEMA ksiegowosc;

--3a. Tworzenie tabeli
CREATE TABLE ksiegowosc.pracownicy
(id_pracownika  NUMERIC(5)  CONSTRAINT pk_pr PRIMARY KEY IDENTITY(1,1),
 imie			VARCHAR(30)		NOT NULL,
 nazwisko		VARCHAR(30)		NOT NULL,
 adres			VARCHAR(30)		NOT NULL,
 telefon		VARCHAR(12)		CHECK(LEN(telefon)>=9),
);

CREATE TABLE ksiegowosc.godziny
(id_godziny		NUMERIC(5)	CONSTRAINT pk_g PRIMARY KEY	IDENTITY(1,1),
 data			DATE		NOT NULL,
 liczba_godzin  NUMERIC(3)	NOT NULL,
 id_pracownika	NUMERIC(5)	NOT NULL,
);

CREATE TABLE ksiegowosc.pensje
(id_pensji		NUMERIC(5)	CONSTRAINT pk_pe PRIMARY KEY	IDENTITY(1,1),
 stanowisko		VARCHAR(30)	NOT NULL,
 kwota			FLOAT(8)	NOT NULL,
);

CREATE TABLE ksiegowosc.premie
(id_premii		NUMERIC(5)	CONSTRAINT pk_pre PRIMARY KEY	IDENTITY(1,1),
 rodzaj			VARCHAR(20)	NOT NULL,
 kwota			FLOAT(7) NOT NULL,
);

CREATE TABLE ksiegowosc.wynagrodzenia
(id_wynagrodzenia NUMERIC(5) CONSTRAINT pk_w PRIMARY KEY	IDENTITY(1,1),
 data			  DATE		 NOT NULL,
 id_pracownika	  NUMERIC(5) NOT NULL,
 id_godziny       NUMERIC(5) NOT NULL,
 id_pensji		  NUMERIC(5) NOT NULL,
 id_premii		  NUMERIC(5),
);

--3b. dodanie klucza obcego za pomocą alter table
ALTER TABLE ksiegowosc.godziny ADD FOREIGN KEY(id_pracownika) REFERENCES ksiegowosc.pracownicy(id_pracownika)
ALTER TABLE ksiegowosc.wynagrodzenia ADD FOREIGN KEY(id_pracownika) REFERENCES ksiegowosc.pracownicy(id_pracownika);
ALTER TABLE ksiegowosc.wynagrodzenia ADD FOREIGN KEY(id_godziny) REFERENCES ksiegowosc.godziny(id_godziny);
ALTER TABLE ksiegowosc.wynagrodzenia ADD FOREIGN KEY(id_pensji) REFERENCES ksiegowosc.pensje(id_pensji);
ALTER TABLE ksiegowosc.wynagrodzenia ADD FOREIGN KEY(id_premii) REFERENCES ksiegowosc.premie(id_premii);

--4. WYPEŁNIAM TABELE REKORDAMI
--a. pracownicy
INSERT INTO ksiegowosc.pracownicy(imie, nazwisko, adres, telefon) VALUES ('Andrzej', 'Bargiel', 'ul.Sikorki 45', '886767999')
INSERT INTO ksiegowosc.pracownicy(imie, nazwisko, adres, telefon) VALUES ('Tomasz', 'Fuziak', 'ul.Nowa 34', '885678940')
INSERT INTO ksiegowosc.pracownicy(imie, nazwisko, adres, telefon) VALUES ('Aleksandra', 'Kolińska', 'ul.Wolna 77', '678456789')
INSERT INTO ksiegowosc.pracownicy(imie, nazwisko, adres, telefon) VALUES ('Anna', 'Białka', 'os.Lotników 37/56', '777890555')
INSERT INTO ksiegowosc.pracownicy(imie, nazwisko, adres, telefon) VALUES ('Bogusław', 'Monte', 'os.Bogaczy 44/77', '512789455')
INSERT INTO ksiegowosc.pracownicy(imie, nazwisko, adres, telefon) VALUES ('Dominik', 'Stanicki', 'os.Inwalidów 66/85 ', '567777908')
INSERT INTO ksiegowosc.pracownicy(imie, nazwisko, adres, telefon) VALUES ('Paweł', 'Pilicki', 'ul.Moreny 32', '889678451')
INSERT INTO ksiegowosc.pracownicy(imie, nazwisko, adres, telefon) VALUES ('Patrycja', 'Porwała', 'ul.Kubicy 6', '666995000')
INSERT INTO ksiegowosc.pracownicy(imie, nazwisko, adres, telefon) VALUES ('Magdalena', 'Jorusza', 'os.Złotego Wieku 35/99', '454989009')
INSERT INTO ksiegowosc.pracownicy(imie, nazwisko, adres, telefon) VALUES ('Genowefa', 'Kudłacz', 'ul.Orłów 10', '881211774')
SELECT * FROM ksiegowosc.pracownicy
--b. godziny
INSERT INTO ksiegowosc.godziny(data, liczba_godzin, id_pracownika) VALUES ('2021/12/12', '178', '1')
INSERT INTO ksiegowosc.godziny(data, liczba_godzin, id_pracownika) VALUES ('2021/11/23', '160', '2')
INSERT INTO ksiegowosc.godziny(data, liczba_godzin, id_pracownika) VALUES ('2020/09/12', '150', '5')
INSERT INTO ksiegowosc.godziny(data, liczba_godzin, id_pracownika) VALUES ('2020/12/24', '146', '9')
INSERT INTO ksiegowosc.godziny(data, liczba_godzin, id_pracownika) VALUES ('2020/08/10', '120', '10')
INSERT INTO ksiegowosc.godziny(data, liczba_godzin, id_pracownika) VALUES ('2020/03/15', '134', '3')
INSERT INTO ksiegowosc.godziny(data, liczba_godzin, id_pracownika) VALUES ('2020/07/28', '123', '6')
INSERT INTO ksiegowosc.godziny(data, liczba_godzin, id_pracownika) VALUES ('2020/12/30', '145', '4')
INSERT INTO ksiegowosc.godziny(data, liczba_godzin, id_pracownika) VALUES ('2020/11/03', '122', '7')
INSERT INTO ksiegowosc.godziny(data, liczba_godzin, id_pracownika) VALUES ('2020/11/16', '162', '8')
SELECT * FROM ksiegowosc.godziny
--c. premie
INSERT INTO ksiegowosc.premie(rodzaj, kwota) VALUES ('regulaminowa', 321.89)
INSERT INTO ksiegowosc.premie(rodzaj, kwota) VALUES ('regulaminowa', 334.34)
INSERT INTO ksiegowosc.premie(rodzaj, kwota) VALUES ('regulaminowa', 298.90)
INSERT INTO ksiegowosc.premie(rodzaj, kwota) VALUES ('uznaniowa', 456.99)
INSERT INTO ksiegowosc.premie(rodzaj, kwota) VALUES ('regulaminowa', 301.46)
INSERT INTO ksiegowosc.premie(rodzaj, kwota) VALUES ('uznaniowa', 437.90)
INSERT INTO ksiegowosc.premie(rodzaj, kwota) VALUES ('uznaniowa', 678.91)
INSERT INTO ksiegowosc.premie(rodzaj, kwota) VALUES ('regulaminowa', 789.21)
INSERT INTO ksiegowosc.premie(rodzaj, kwota) VALUES ('regulaminowa', 197.66)
INSERT INTO ksiegowosc.premie(rodzaj, kwota) VALUES ('uznaniowa', 543.11)
SELECT * FROM ksiegowosc.premie
--d. pensje
INSERT INTO ksiegowosc.pensje(stanowisko, kwota) VALUES ('Project meneger', '5200')
INSERT INTO ksiegowosc.pensje(stanowisko, kwota) VALUES ('Analityk biznesowy', '6200')
INSERT INTO ksiegowosc.pensje(stanowisko, kwota) VALUES ('Architekt systemu', '5300')
INSERT INTO ksiegowosc.pensje(stanowisko, kwota) VALUES ('Tester oprogramownaia', '4900')
INSERT INTO ksiegowosc.pensje(stanowisko, kwota) VALUES ('Administrator sici LAN', '5300')
INSERT INTO ksiegowosc.pensje(stanowisko, kwota) VALUES ('Administrator sici WAN', '5300')
INSERT INTO ksiegowosc.pensje(stanowisko, kwota) VALUES ('Administrator serwerów', '6100')
INSERT INTO ksiegowosc.pensje(stanowisko, kwota) VALUES ('Informatyk', '4800')
INSERT INTO ksiegowosc.pensje(stanowisko, kwota) VALUES ('Grafik komputerowy', '6600')
INSERT INTO ksiegowosc.pensje(stanowisko, kwota) VALUES ('Inżynier oprogramowania', '5000')
SELECT * FROM ksiegowosc.pensje
--e. wynagrodzenia
INSERT INTO ksiegowosc.wynagrodzenia(data, id_pracownika, id_godziny, id_pensji, id_premii) VALUES ('12/03/2021', '2', '2', '1', '2')
INSERT INTO ksiegowosc.wynagrodzenia(data, id_pracownika, id_godziny, id_pensji, id_premii) VALUES ('12/03/2021', '3', '3', '3', '3')
INSERT INTO ksiegowosc.wynagrodzenia(data, id_pracownika, id_godziny, id_pensji, id_premii) VALUES ('12/03/2021', '1', '1', '2', '2')
INSERT INTO ksiegowosc.wynagrodzenia(data, id_pracownika, id_godziny, id_pensji, id_premii) VALUES ('12/04/2021', '4', '5', '5', '6')
INSERT INTO ksiegowosc.wynagrodzenia(data, id_pracownika, id_godziny, id_pensji, id_premii) VALUES ('12/03/2021', '5', '4', '4', '7')
INSERT INTO ksiegowosc.wynagrodzenia(data, id_pracownika, id_godziny, id_pensji, id_premii) VALUES ('12/03/2021', '6', '8', '6', '9')
INSERT INTO ksiegowosc.wynagrodzenia(data, id_pracownika, id_godziny, id_pensji, id_premii) VALUES ('12/02/2021', '7', '6', '8', '10')
INSERT INTO ksiegowosc.wynagrodzenia(data, id_pracownika, id_godziny, id_pensji, id_premii) VALUES ('12/03/2021', '8', '7', '7', null)
INSERT INTO ksiegowosc.wynagrodzenia(data, id_pracownika, id_godziny, id_pensji, id_premii) VALUES ('12/03/2021', '10', '9', '10', null)
INSERT INTO ksiegowosc.wynagrodzenia(data, id_pracownika, id_godziny, id_pensji, id_premii) VALUES ('12/03/2021', '9', '10', '9', '8')
SELECT * FROM ksiegowosc.wynagrodzenia



-- 4. Komentarze do tabel
EXEC sp_addextendedproperty   
@name = N'Description_pracownicy',   
@value = 'Ta tablica przedstawia dane pracowników',  
@level0type = N'Schema', @level0name = 'ksiegowosc',  
@level1type = N'Table',  @level1name = 'pracownicy';   
GO 

EXEC sp_addextendedproperty   
@name = N'Description_godziny',   
@value = 'Ta tablica przedstawia ilosc przepracowanych godzin',  
@level0type = N'Schema', @level0name = 'ksiegowosc',  
@level1type = N'Table',  @level1name = 'godziny';   
GO 

EXEC sp_addextendedproperty   
@name = N'Description_pensje',   
@value = 'Ta tablica przedstawia wielkosc pensji dla danego stanowiska',  
@level0type = N'Schema', @level0name = 'ksiegowosc',  
@level1type = N'Table',  @level1name = 'pensje';   
GO 

EXEC sp_addextendedproperty   
@name = N'Description_premie',   
@value = 'Ta tabela przedstawia premie',  
@level0type = N'Schema', @level0name = 'ksiegowosc',  
@level1type = N'Table',  @level1name = 'premie';   
GO 

EXEC sp_addextendedproperty   
@name = N'Description_wynagrodzenie',   
@value = 'Ta tabela łšczy wszytkie pozostałe ',  
@level0type = N'Schema', @level0name = 'ksiegowosc',  
@level1type = N'Table',  @level1name = 'wynagrodzenia';   
GO 

SELECT * FROM sys.extended_properties;

--5.
-- a. wyświetl id i nazwisko pracownika
SELECT id_pracownika, nazwisko FROM ksiegowosc.pracownicy

--b. wyświetl id pracownikow, ktorych placa jest wieksza niz 5200
SELECT id_pracownika FROM ksiegowosc.wynagrodzenia WHERE id_pensji IN (SELECT id_pensji FROM ksiegowosc.pensje WHERE kwota > '5200')

--c) Wyswietl id pracowników nieposiadajacych premii,których płaca jest większa niż 2000.
SELECT id_pracownika FROM ksiegowosc.wynagrodzenia WHERE id_premii IS NULL AND id_pensji IN (SELECT id_pensji FROM ksiegowosc.pensje WHERE kwota > '2000')

--d) Wyswietl pracowników, których pierwsza litera imienia zaczyna się na literę P
SELECT * FROM ksiegowosc.pracownicy WHERE pracownicy.imie LIKE 'P%'

--e) Wyswietl pracowników, których nazwisko zawiera literę r oraz imię kończy się na literę a
SELECT * FROM ksiegowosc.pracownicy WHERE pracownicy.nazwisko LIKE '%r%' AND pracownicy.imie LIKE '%a'

--f) Wyswietl imię i nazwisko pracowników oraz liczbę ich nadgodzin, przyjmujšc, iż standardowy czas pracy to 160 h miesięcznie
SELECT imie, nazwisko, (liczba_godzin - 160) AS nadgodziny FROM ksiegowosc.pracownicy
INNER JOIN ksiegowosc.godziny ON godziny.id_pracownika = pracownicy.id_pracownika WHERE liczba_godzin > 160

--g) Wyswietl imię i nazwisko i wynagrodzenie pracowników, których pensja zawiera się w przedziale 4800 a 5300PLN
SELECT imie, nazwisko, kwota FROM ksiegowosc.pracownicy
INNER JOIN ksiegowosc.wynagrodzenia ON pracownicy.id_pracownika = wynagrodzenia.id_pracownika 
INNER JOIN ksiegowosc.pensje ON wynagrodzenia.id_pensji = pensje.id_pensji WHERE kwota > 4800 AND kwota < 5300

--h) Wyswietl imię i nazwisko pracowników oraz liczbe nadgodzin oraz id_premii, którzy pracowali w nadgodzinachi nie otrzymali premii
SELECT imie, nazwisko, liczba_godzin, id_premii FROM ksiegowosc.wynagrodzenia 
INNER JOIN ksiegowosc.pracownicy ON wynagrodzenia.id_pracownika = pracownicy.id_pracownika 
INNER JOIN ksiegowosc.godziny ON wynagrodzenia.id_godziny = godziny.id_godziny  WHERE liczba_godzin>160 AND id_premii is null

--i) Uszereguj pracowników według pensji
SELECT imie, nazwisko, pensje.kwota FROM ksiegowosc.wynagrodzenia
INNER JOIN ksiegowosc.pracownicy ON pracownicy.id_pracownika = wynagrodzenia.id_pracownika
INNER JOIN ksiegowosc.pensje ON pensje.id_pensji = wynagrodzenia.id_pensji ORDER BY kwota

-- j) Uszereguj pracowników według premii malejaco
SELECT imie, nazwisko, pensje.kwota, premie.kwota AS premia FROM ksiegowosc.wynagrodzenia
INNER JOIN ksiegowosc.pracownicy ON wynagrodzenia.id_pracownika = pracownicy.id_pracownika
INNER JOIN ksiegowosc.pensje ON wynagrodzenia.id_pensji = pensje.id_pensji
INNER JOIN ksiegowosc.premie ON wynagrodzenia.id_premii = premie.id_premii
ORDER BY premie.kwota DESC

--k) Zlicz i pogrupuj pracowników według pola stanowisko
SELECT stanowisko, COUNT(pensje.stanowisko) AS suma FROM ksiegowosc.wynagrodzenia 
INNER JOIN ksiegowosc.pracownicy ON wynagrodzenia.id_pracownika = pracownicy.id_pracownika
INNER JOIN ksiegowosc.pensje ON wynagrodzenia.id_pensji = pensje.id_pensji
GROUP BY pensje.stanowisko

-- dodanie nowych pracownikow aby zobaczyć jak działa count
INSERT INTO ksiegowosc.pracownicy(imie, nazwisko, adres, telefon) VALUES ('Ola', 'Juras', 'ul.Sienna 2', '886767777')
INSERT INTO ksiegowosc.godziny(data, liczba_godzin, id_pracownika) VALUES ('2021/04/12', '178', '11')
INSERT INTO ksiegowosc.wynagrodzenia(data, id_pracownika, id_godziny, id_pensji, id_premii) VALUES ('12/06/2021', '11', '2', '1', '2')

INSERT INTO ksiegowosc.pracownicy(imie, nazwisko, adres, telefon) VALUES ('Ola', 'Buka', 'ul.Witka 66', '666676777')
INSERT INTO ksiegowosc.godziny(data, liczba_godzin, id_pracownika) VALUES ('2020/04/12', '176', '12')
INSERT INTO ksiegowosc.wynagrodzenia(data, id_pracownika, id_godziny, id_pensji, id_premii) VALUES ('12/06/2021', '12', '2', '1', '2')


--l)Policz srednia, minimalna i maksymaln płacę dla stanowiska Proj. meneger
SELECT MIN(kwota) AS min_kwota, MAX(kwota) AS max_kwota, AVG(kwota) AS mean_kwota
FROM ksiegowosc.pensje 
WHERE pensje.stanowisko = 'Project meneger'

--m) Policz sumę wszystkich wynagrodzen
SELECT SUM(kwota) as suma
FROM ksiegowosc.pensje

--n) Policz sumę wynagrodzeń w ramach danego stanowiska
SELECT stanowisko, SUM(kwota) AS suma_wynagrodzen FROM ksiegowosc.pensje
INNER JOIN ksiegowosc.wynagrodzenia ON wynagrodzenia.id_pensji = pensje.id_pensji 
GROUP BY stanowisko

 --o) Usuń rekord   widać tu że ta baza nie jest dość dobrze przemyślana bo aby usunąć rekord z pracowników musiałam jeszcze usunąć rekord z wynagrodzen oraz godzin
 DELETE FROM ksiegowosc.godziny WHERE id_pracownika = 11
 DELETE FROM ksiegowosc.wynagrodzenia WHERE id_pracownika = 11
 DELETE FROM ksiegowosc.pracownicy  WHERE nazwisko = 'Juras'




SELECT * FROM ksiegowosc.pracownicy
SELECT * FROM ksiegowosc.godziny
SELECT * FROM ksiegowosc.premie
SELECT * FROM ksiegowosc.wynagrodzenia
SELECT * FROM ksiegowosc.pensje
