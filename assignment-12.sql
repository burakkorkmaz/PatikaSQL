/* 
    Patika.dev SQL Assignment 12 - SUBQUERIES
	
	Aşağıdaki sorgu senaryolarını dvdrental örnek veri tabanı üzerinden gerçekleştiriniz.
	
*/

-- Q1) film tablosunda film uzunluğu length sütununda gösterilmektedir. Uzunluğu ortalama 
--     film uzunluğundan fazla kaç tane film vardır?
SELECT COUNT (*) FROM film
WHERE length > (SELECT AVG(length) FROM film);


-- Q2) film tablosunda en yüksek rental_rate değerine sahip kaç tane film vardır?
SELECT COUNT (*) FROM film
WHERE rental_rate = (SELECT MAX(rental_rate) FROM film);


-- Q3) film tablosunda en düşük rental_rate ve en düşün replacement_cost değerlerine
--     sahip filmleri sıralayınız.
SELECT title FROM film
WHERE rental_rate = (SELECT MAX(rental_rate) FROM film) 
AND replacement_cost = (SELECT MIN(replacement_cost) FROM film);

 
-- Q4) payment tablosunda en fazla sayıda alışveriş yapan müşterileri(customer) sıralayınız.
SELECT CONCAT(first_name, ' ', last_name) as full_name, p.customer_id, COUNT (*) 
FROM payment AS p
INNER JOIN customer AS c ON p.customer_id = c.customer_id
GROUP BY full_name, p.customer_id
ORDER BY COUNT(*) DESC
