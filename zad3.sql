USE firma;

--1. zmodyfikuj numer telefonu dodając +48
UPDATE ksiegowosc.pracownicy
SET telefon = '+48'+ telefon  
WHERE telefon NOT LIKE '+%'
SELECT telefon FROM ksiegowosc.pracownicy

--b. a tu usunięcie 
UPDATE ksiegowosc.pracownicy
SET telefon = Replace(telefon, '+48','')
WHERE telefon LIKE '+48%'

UPDATE ksiegowosc.pracownicy
SET telefon = SUBSTRING(telefon, 1, 3) + '-' + SUBSTRING(telefon, 4, 3) + '-' + SUBSTRING(telefon, 7, 3)

UPDATE ksiegowosc.pracownicy
SET telefon = REPLACE(telefon, '+48', '605')

--c. Wyswietl dane pracownika, ktorego nazwisko jest najdluzsze, uzywajac duzych liter
SELECT upper(nazwisko) 
FROM ksiegowosc.pracownicy 
WHERE len(nazwisko) = (SELECT max(len(nazwisko)) FROM ksiegowosc.pracownicy)

--d. Wyswietl pracownikow i ich pensje zakodowane przy pomocy algorytmu md5
SELECT imie, nazwisko, HashBytes('MD5', CAST(kwota AS VARCHAR(6))) AS pensje_hash FROM ksiegowosc.wynagrodzenia 
INNER JOIN ksiegowosc.pracownicy ON wynagrodzenia.id_pracownika = pracownicy.id_pracownika
INNER JOIN ksiegowosc.pensje ON wynagrodzenia.id_pensji = pensje.id_pensji

--e. Wyswietl pracownikow, ich pensje oraz premie, wykorzystaj zlaczenie lewostronne
SELECT imie, nazwisko, pensje.kwota AS pensja, premie.kwota AS premia FROM ksiegowosc.pracownicy 
INNER JOIN ksiegowosc.wynagrodzenia ON wynagrodzenia.id_pracownika = pracownicy.id_pracownika
LEFT JOIN ksiegowosc.pensje ON wynagrodzenia.id_pensji = pensje.id_pensji
LEFT JOIN ksiegowosc.premie ON wynagrodzenia.id_premii = premie.id_premii



SELECT * FROM ksiegowosc.pracownicy
SELECT * FROM ksiegowosc.godziny
SELECT * FROM ksiegowosc.premie
SELECT * FROM ksiegowosc.wynagrodzenia