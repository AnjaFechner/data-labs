#Lab | SQL Queries 8
#0. Inspect the database structure and find the best-fitting table to analyse for the next task.

#1. Use the RANK() and the table of your choice rank films by length (filter out the rows that have nulls or 0s in length column). 
#   In your output, only select the columns title, length, and the rank.

select f.title, f.length, 
rank() over (ORDER BY f.length DESC) as ‘Rank’
from sakila.film f
WHERE f.length != " " OR f.length IS NOT NULL;

#2. Build on top of the previous query and rank films by length within the rating category (filter out the rows that have nulls or 0s in length column). 
#   In your output, only select the columns title, length, rating and the rank.

select f.rating, f.title, f.length, 
rank() over (Partition BY f.rating ORDER BY f.length DESC) as ‘Rank’
from sakila.film f
WHERE f.length != " " OR f.length IS NOT NULL;

#3. How many films are there for each of the categories? Inspect the database structure and use appropriate join to write this query.
 -- SELECT * FROM sakila.film_category fc;
 -- SELECT * FROM sakila.category c;

SELECT c.name, count(fc.film_id) as num_films
FROM sakila.category as c 
JOIN sakila.film_category as fc 
ON c.category_id = fc.category_id
GROUP BY c.name;

#4. Which actor has appeared in the most films?
 -- SELECT * FROM sakila.film_actor fa;
 -- SELECT * FROM sakila.actor a;

SELECT a.actor_id, a.first_name, a.last_name, count(fa.film_id) as num_films
FROM sakila.actor as a 
JOIN sakila.film_actor as fa 
ON a.actor_id = fa.actor_id
GROUP BY a.actor_id
ORDER BY num_films DESC
LIMIT 1;

#5. Most active customer (the customer that has rented the most number of films)
 -- SELECT * FROM sakila.customer c;
 -- SELECT * FROM sakila.rental r;

SELECT c.last_name, c.first_name, c.customer_id, count(r.rental_id) as num_rental
FROM sakila.customer as c
JOIN sakila.rental as r
ON c. customer_id = r.customer_ID
GROUP BY c.customer_id
ORDER BY num_rental DESC

# Bonus. Which is the most rented film? The answer is Bucket Brotherhood This query might require using more than one join statement. 
# Give it a try. We will talk about queries with multiple join statements later in the lessons.

SELECT * FROM sakila.rental r
SELECT * FROM sakila.film f
SELECT * FROM sakila.inventory i


