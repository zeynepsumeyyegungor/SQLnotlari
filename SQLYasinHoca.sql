CREATE TABLE workers
(
  id CHAR(9),
  name VARCHAR(50),
  state VARCHAR(50),
  salary SMALLINT,
  company VARCHAR(20)
);
INSERT INTO workers VALUES(123456789, 'John Walker', 'Florida', 2500, 'IBM');
INSERT INTO workers VALUES(234567890, 'Brad Pitt', 'Florida', 1500, 'APPLE');
INSERT INTO workers VALUES(345678901, 'Eddie Murphy', 'Texas', 3000, 'IBM');
INSERT INTO workers VALUES(456789012, 'Eddie Murphy', 'Virginia', 1000, 'GOOGLE');
INSERT INTO workers VALUES(567890123, 'Eddie Murphy', 'Texas', 7000, 'MICROSOFT');
INSERT INTO workers VALUES(456789012, 'Brad Pitt', 'Texas', 1500, 'GOOGLE');
INSERT INTO workers VALUES(123456710, 'Mark Stone', 'Pennsylvania', 2500, 'IBM');

SELECT * FROM workers;

--Toplam salary değeri 2500 üzeri olan bir çalışan için salary toplamını bulun

SELECT name, SUM(salary) AS "Total Salary"
FROM workers
GROUP BY name
HAVING SUM(salary)>2500; --Group By olunca "WHERE" kullanılmaz,"HAVING" kullanılır.

--Birden fazla çalışanı olan, her bir state için çalışan toplamlarını bulun.

SELECT state,COUNT (state) AS number_of_employees
FROM workers
GROUP BY state
HAVING COUNT (state) >1;  --HAVING,Group By filtreleme için kullanılır.

SELECT * FROM workers;

--Her bir state için değeri 3000'den az olan maximum salary değerlerini bulun.
select state, max(salary) as "max salary" from workers where salary<3000 GROUP by state having max(salary) <3000;

--Her bir company için değeri 2000'den fazla olan minimum salary değerlerini bulun.
select company, min(salary) as "min salary"
from workers
where salary>2000
GROUP by company
having min(salary)>2000;

--Tekrarsız isimleri çağırın.
select DISTINCT name from workers;

--Name değerlerini company kelime uzunluklarına göre sıralayın.
select name, company from workers order by length(company) desc;

--Tüm name ve state değerlerini aynı sütunda çağırarak her bir sütun değerinin uzunluğuna göre sıralayın.
--1.Yol;
select name|| '    '|| state as "uzunluk" from workers order by length (name|| ' '|| state) DESC;
--2.Yol;
select concat(name,' ', state) as name_and_state from workers order by length(name) + length(state);

/*
UNION Operator:
1) iki sorgu (query) sonucunu birleştirmek için kullanılır,
2) Tekrarsız(unique) recordları verir,
3) Tek bir sütuna çok sütun koyabiliriz,
4) Tek bir sütuna çok sütun koyarken mevcut data durumuna dikkat etmek gerekir.
*/

--salary değeri 3000'den yüksek olan state değerlerini ve 2000'den küçük olan name değerlerini tekrarsız olarak bulun.
SELECT state AS "Name and State",salary
FROM workers
WHERE salary>3000

UNION ALL --> UNION ile aynı işi yapar ancak,tekrarlı değerleri de verir

SELECT name,salary
FROM workers
WHERE salary<2000;

--salary değeri 1000'den yüksek, 2000'den az olan "ortak" name değerlerini bulun.
SELECT NAME
FROM workers
Where salary >1000

INTERSECT  -- ÜSTTEKİ SELECT'TEN VE ALTTAKİ SELECT TABLOSUNDAN ORTAK OLANLARI BULUYOR
--INTERSECT Operator: İki sorgu (query) sonucunun ortak(common) değerlerini verir. Unique(tekrarsız) recordları verir.
SELECT NAME
FROM workers
Where salary <2000;

--salary değeri 2000'den az olan ve company değeri  IBM, APPLE yada MICROSOFT olan ortak "name" değerlerini bulun.
SELECT name
From workers
Where salary <2000

INTERSECT

Select name
From workers
Where company In('IBM','APPLE','MICROSOFT');

--EXCEPT Operator : Bir sorgu sonucundan başka bir sorgu sonucunu çıkarmak için kullanılır. Unique(tekrarsız) recordları verir.
--salary değeri 3000'den az ve GOOGLE'da çalışmayan  name değerlerini bulun.

SELECT name
FROM workers
WHERE SALARY <3000

EXCEPT

SELECT name
FROM workers
WHERE company ='GOOGLE';
