-- 1. Selezionare tutte le nazioni il cui nome inizia con la P e la cui area è maggiore di 1000 kmq
select name, area
from countries c 
where name like 'P%' and area > 1000;
-- 2. Contare quante nazioni sono presenti nel database
SELECT COUNT(*) as total_countries
FROM countries c ;
-- 3. Selezionare il nome delle regioni del continente europeo, in ordine alfabetico
select r.name
from regions r 
join continents c  on r.continent_id =c.continent_id 
where c.name = 'Europe'
order by r.name asc ;
-- 4. Contare quante regioni sono presenti nel continente Africa
SELECT COUNT(*) as total_regions
FROM regions r
join continents c on r.continent_id = c.continent_id;
-- 5. Selezionare quali nazioni non hanno un national day
SELECT *
FROM countries c
WHERE national_day IS NULL;
-- 6. Per ogni nazione, in ordine alfabetico, selezionare il nome, la regione e il continente
select  c.name, r.name , c2.name
from countries c
join regions r  on  c.region_id = r.region_id  
join continents c2   on r.region_id  = c2.continent_id 
order by c.name asc;
-- 7. Selezionare le lingue ufficiali dell’Albania
select language
from languages l 
join country_languages cl on l.language_id = cl.language_id 
join countries c ON cl.country_id =c.country_id 
where  C.name  = 'Albania'and cl.official = 1;
-- 8. Selezionare il Gross domestic product (GDP) medio dello United Kingdom tra il 2000 e il 2010
SELECT AVG(cs.gdp) AS avg_gdp
FROM country_stats cs 
JOIN countries c ON cs.country_id = c.country_id 
WHERE c.name = 'United Kingdom' AND cs.year BETWEEN 2000 AND 2010;
-- 9. Selezionare tutte le nazioni in cui si parla hindi, ordinate dalla più estesa alla meno estesa
select c.name
from countries c 
join country_languages cl on c.country_id = cl.country_id 
join languages l on cl.language_id =l.language_id 
where l.`language` = 'hindi'  order by length(c.area);
-- 10. Modificare la nazione di nome Italy, inserendo come national day il 2 giugno 1946
update  countries
set  national_day = '1946-06-02'
where  name = 'Italy';