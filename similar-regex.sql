-- SELECT - SIMILAR TO - REGEX(Regular Expressions) --
/*
SIMILAR TO : Daha karmaşık pattern(kalıp) ile sorgulama işlemi için SIMILAR TO kullanilabilir,
sadece PostgreSQL de kullanılır. Büuğk-küçük harf önemlidir.

REGEX : Herhangi bir kod,metin içerisinde istenen yazı veya kod parçasının aranıp bulunmamasını sağlayan
kendine ait bir söz dizimi olan bir yapıdır.MySQL de (REGEXP_LIKE) olarak kullanılır
PostgreSQL'de "~" karakteri ile kullanılır.
*/

CREATE TABLE kelimeler
(
id int,
kelime VARCHAR(50),
harf_sayisi int
);
INSERT INTO kelimeler VALUES (1001, 'hot', 3);
   INSERT INTO kelimeler VALUES (1002, 'hat', 3);
   INSERT INTO kelimeler VALUES (1003, 'hit', 3);
   INSERT INTO kelimeler VALUES (1004, 'hbt', 3);
   INSERT INTO kelimeler VALUES (1005, 'hct', 3);
   INSERT INTO kelimeler VALUES (1006, 'adem', 4);
   INSERT INTO kelimeler VALUES (1007, 'selim', 5);
   INSERT INTO kelimeler VALUES (1008, 'yusuf', 5);
   INSERT INTO kelimeler VALUES (1009, 'hip', 3);
   INSERT INTO kelimeler VALUES (1010, 'HOT', 3);
   INSERT INTO kelimeler VALUES (1011, 'hOt', 3);
   INSERT INTO kelimeler VALUES (1012, 'h9t', 3);
   INSERT INTO kelimeler VALUES (1013, 'hoot', 4);
   INSERT INTO kelimeler VALUES (1014, 'haaat', 5);
   INSERT INTO kelimeler VALUES (1015, 'hooooot', 5);
   INSERT INTO kelimeler VALUES (1016, 'booooot', 5);
   INSERT INTO kelimeler VALUES (1017, 'bolooot', 5);

select * from kelimeler
--  İçerisinde 'ot' veya 'at' bulunan kelimeleri listeleyiniz
-- veya işlemi için | karakteri kullanılır 

--SIMILAR TO ile kullanımı;
select * from kelimeler where kelime similar to '%(at|ot)';
--LIKE ile kullanımı;
select * from kelimeler where kelime ILIKE '%at%' or kelime ILIKE '%ot%'
select * from kelimeler where kelime ~~* '%at%' or kelime ~~* '%ot%'
--REGEX ile kullanımı
select * from kelimeler where kelime ~* 'ot' or kelime ~* 'at';

--'ho' veya 'hi' ile baslayan kelimeleri listeleyiniz
--SIMILAR TO ile

select * from kelimeler where kelime similar to 'ho%|hi%'

--LIKE ile yapımı
select * from kelimeler where kelime ~~* 'ho%' or kelime ~~* 'hi%'

--regex ile
select * from kelimeler where kelime ~*'h[oi](.*)' -- regex te . bir karakteri temsil eder
Sonu 't' veya 'm' ile bitenleri listeleyeniz
select * from kelimeler where kelime ilike '%t' or kelime ilike '%m'
--regex ile
select * from kelimeler where kelime ~*'(.*)[tm]$' --$ karakteri bitişi gösterir
-- h ile başlayıp t ile biten 3 harfli kelimeleri listeleyeniz
--SIMILAR TO ile
select * from kelimeler where kelime like 'h%t'
-- LIKE ile
select * from kelimeler where kelime ~~* 'h_t';
--REGEX ile 
select * from kelimeler where kelime ~* 'h[a-z,A-Z,0-9]t'

--ilk karakteri 'h', son karakteri 't' ve ikinci karakteri 'a'dan 'e'ye herhangi bir karakter olan
--"kelime" değerlerini çağırın.

--SIMILAR TO ile
select kelime from kelimeler where kelime similar to 'h[a-e](.*)t'
--REGEX ile 
select kelime from kelimeler where kelime ~* 'h[a-e](.*)t'

--Ilk karakteri 's', 'a' veya 'y' olan "kelime" değerlerini çağırın.
select * from kelimeler where kelime ~'^[say](.*)'  --^ başlangıç'ı temsil eder

--son karakteri 'm', 'a' veya 'f' olan "kelime" değerlerini çağırın
select * from kelimeler where kelime ~'(.*)[maf]$'

--ilk harfi h,son harfi t olup 2. harfi a veya i olan 3 harfli kelimelerin tüm bilgilerini sorgulayalım
--SIMILAR TO 
select * from kelimeler where kelime similar to 'h[a|i]t';
--REGEX ile
select * from kelimeler where kelime ~'^h[a|i]t$'

--ilk harfi 'b'dan 's'ye bir karakter olan ve ikinci harfi herhangi bir karakter olup
--üçüncü harfi 'l' olan "kelime" değerlerini çağırın
select kelime from kelimeler where kelime ~'^[b-s].l(.*)'

--içerisinde en az 2 adet o o barıdıran kelimelerin tüm bilgilerini listeleyiniz.
select * from kelimeler where kelime similar to '%[o][o]%'
select * from kelimeler where kelime similar to '%[o]{2}%'
-- Süslü parantez içinde belirttiğimiz rakam bir önceki
--köşeli parantez içinde kaçtane olduğunu belirtir

--İçerisinde en az 4 adet o olan kelimelerin listesini getirin
select * from kelimeler where kelime similar to '%[o]{4}%';

--'a', 's' yada 'y' ile başlayan VE 'm' yada 'f' ile biten "kelime" değerlerini çağırın.
select * from kelimeler where kelime ~'^[a|s|y](.*)[m|f]$'
