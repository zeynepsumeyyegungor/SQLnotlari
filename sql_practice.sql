create table personel
(
id serial primary key  ,
isim varchar(20),
yas int,
maas int,
email varchar(30)
);
--serial id'yi aouto increment gibi otomatik artirir
																							 
-- auto_increment kullandığımızda otomatik olarak id ler 1 den başlayacaktır.
insert into personel (isim, yas, maas, email) values ('Ali', 39, 12500, 'ali@gmail.com');
insert into personel (isim, yas, maas, email) values ('Derya', 28, 15000, 'derya@yahoo.com');
insert into personel (isim, yas, maas, email) values ('Sevim', 24, 25000, 'sevim@hotmail.com');
insert into personel (isim, yas, maas, email) values ('Yusuf', 32, 18000, 'yusuf@gmail.com');
insert into personel (isim, yas, maas, email) values ('Halil', 48, 22000, 'halil@gmail.com');
insert into personel (isim, yas, maas, email) values ('Ece', 54, 21000, 'ece@gmail.com');
insert into personel (isim, yas, maas, email) values ('Can', 38, 19000, 'can@gmail.com');
insert into personel (isim, yas, maas, email) values ('Elif', 27, 14000, 'elif@gmail.com');
insert into personel (isim, yas, maas, email) values ('Ezgi', 38, 21000, 'ezgi@gmail.com');
insert into personel (isim, yas, maas, email) values ('Sena', 25, 11000, NULL);

--tabloyu listeleyiniz;
select * from personel

--2) isim,yaş ve maaş bilgilerini listelyiniz
select isim,yas,maas from personel

--3) id'si 8 olan personel bilgilerini
select * from personel where id=8;

-- 4) id'si 5 olan personelin isim, yaş ve email bilgilerini listeleyiniz
select id,isim,yas,email from personel where id=5;

--5)30 yaşından büyük personel bilgilerini getir
select * from personel where yas>30;

-- 6) maası 21000 olmayan personel bilgilerini listeleyiniz.
select * from personel where maas!=21000;

-- 7) isimi a harfi ile baslayan personel bilgilerini getir
select * from personel where isim ~~* 'a%';
select * from personel where isim ilike 'A%';  -- % isareti ne ile devam ederse etsin
 
--8)  ismi n harfi ile biten personel bilgilerini listeleyiniz.
select * from personel where isim ilike '%n';

-- 9) email adresi gmail olan personel bilgilerini listeleyiniz. 
select * from personel where email ilike '%gmail%'

--10) email adresi gmail omayan personel bilgilerini getir
select * from personel where email not like '%@gmail.com';

-- 11) id'si 3,5,7 ve 9 olan personel bilgilerini listeleyiniz.
select * from personel  where id in(3,5,7,9);

-- 12) yaşı 39,48 ve 54 olmayan personel bilgilerini listeleyiniz.
select * from personel where yas not in (39,48,54);

-- 13) yaşı 30 ve 40 arasında olan personel bilgilerini listeleyiniz.
select * from personel where yas between 30 and 40;

-- 14) yaşı 30 ve 40 arasında olmyan personel bilgilerini listeleyiniz.
select * from personel where yas not between 30 and 40;

--15) email'i null olan personeli gönderin
select * from personel where email is null;

-- 16) personel bilgilerini yaşa göre sıralayınız.
select * from personel order by yas;

-- 17) personel bilgilerini maaşa göre sıralayınız.
select * from personel order by maas;

-- 18) personelin yaşlarını büyükten küçüğe doğru sıralayınız.
select * from personel order by yas desc;

-- 19) personelin maaşlarını büyükten küçüğe doğru sıralayınız.
select * from personel order by maas desc;

-- 20) En yüksek maaş olan ilk 3 personel bilgilerini sıralayınız
select * from personel order by maas desc limit 3;