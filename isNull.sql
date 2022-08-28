-- IS NULL, IS NOT NULL, COALESCE --
/*
IS NULL ve IS NOT NULL, Boolean operatorleridir. Bİr ifadenin NULL olup olmadığını kontrol eder
COALESCE (Birleştirme) ise bir fonksiyondur ve içerisindeki parametrelerden NULL olmayan ilk ifadeyi döndürür
*/
CREATE TABLE insanlar 
(
    ssn CHAR(9), -- Social Security Number
    isim VARCHAR(50), 
    adres VARCHAR(50) 
);
INSERT INTO insanlar VALUES('123456789', 'Ali Can', 'Istanbul');
INSERT INTO insanlar VALUES('234567890', 'Veli Cem', 'Ankara');
INSERT INTO insanlar VALUES('345678901', 'Mine Bulut', 'Izmir');
INSERT INTO insanlar (ssn, adres) VALUES('456789012', 'Bursa');
INSERT INTO insanlar (ssn, adres) VALUES('567890123', 'Denizli');
INSERT INTO insanlar (adres) VALUES('Sakarya');
INSERT INTO insanlar (ssn) VALUES('999111222');

select * from insanlar 

--isim'i null olanları sorgula;
select * from insanlar where isim is null

--isim'i null olmayanları getirelim
select * from insanlar where isim is not null

-- isim 'i NULL olan kişilerin isim'ine NO NAME atayınız.
update insanlar
set isim = 'NO NAME'
where isim is null

-- Tabloyu bir önceki soruyu çözmeden önceki haline geri getirin
UPDATE insanlar 
SET isim = null
WHERE isim = 'NO NAME'

--NOT:Coklu degisim de her degisim icin SET ... WHERE isim IS NULL  gibi ifade yazmamak icin
--COALESCE(Birlestirme) kullanilir

/* 
isim 'i NULL olanlara 'Henuz isim girilmedi'
adres 'i NULL olanlara 'Henuz adres girilmedi'
ssn 'i NULL olanlara ' no ssn' atayalım.
*/

UPDATE insanlar
SET isim =coalesce (isim,'HENUZ GIRILMEDI'),
adres = coalesce (adres,'HENUZ GIRILMEDİ'),
ssn =coalesce (ssn,'NO SSN');

select * from insanlar