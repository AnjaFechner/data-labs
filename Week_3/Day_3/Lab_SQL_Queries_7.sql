#Lab | SQL Queries 7

#1. In the actor table, which are the actors whose last names are not repeated? 
# For example if you would sort the data in the table actor by last_name, you would see that there is Christian Arkoyd, Kirsten Arkoyd, and Debbie Arkoyd. 
# These three actors have the same last name. So we do not want to include this last name in our output. 
# Last name "Astaire" is present only one time with actor "Angelina Astaire", hence we would want this in our output list.

SELECT a.first_name, a.last_name, count(a.last_name) AS num_familyname FROM sakila.actor a
GROUP BY a.last_name
HAVING count(a.last_name) = 1;

#2. Which last names appear more than once? We would use the same logic as in the previous question 
# but this time we want to include the last names of the actors where the last name was present more than once.
# One step is missing, at this time, the second and third actors with the same last_name will be not shown

select DISTINCT a.actor_id, a.first_name, a.last_name FROM sakila.actor a
GROUP BY a.first_name
HAVING (count(a.last_name) > 1);

select a.actor_id, a.first_name, a.last_name,
count(a.last_name) over (partition by a.last_name) as num_familyname
FROM sakila.actor a
HAVING count(a.last_name) <> "1";

#3. Using the rental table, find out how many rentals were processed by each employee.

SELECT r.staff_id, count(rental_date) FROM sakila.rental r
GROUP BY r.staff_id;

#4. Using the film table, find out how many films were released each year

SELECT f.release_year, count(f.film_id) FROM sakila.film f
GROUP BY f.release_year;

#5. Using the film table, find out for each rating how many films were there.

SELECT f.rating, count(f.film_id) as num_film FROM sakila.film f
GROUP BY f.rating;

#6. What is the average length of films for each rating? Round off the average lengths to two decimal places.

SELECT f.rating, count(f.film_id) as num_film, Round(AVG(f.length),2) as avg_length FROM sakila.film f
GROUP BY f.rating;

#7. Which kind of movies (based on rating) have an average duration of two hours or more?

SELECT f.rating, count(f.film_id) as num_film, floor(AVG(f.length)/60) as hours FROM sakila.film f
GROUP BY f.rating
HAVING hours >1;