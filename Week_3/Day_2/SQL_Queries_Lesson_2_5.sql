#Lab | SQL Queries - Lesson 2.5
use sakila;
# 1. Select all the actors with the first name ‘Scarlett’.
SELECT * FROM actor a
WHERE a.first_name = "SCARLETT";

# 2. How many films (movies) are available for rent and how many films have been rented?
SELECT (COUNT(DISTINCT r.return_date)-COUNT(DISTINCT r.rental_date)) as available_for_rent, count(DISTINCT return_date) as film_rented FROM rental r;

# 3. What are the shortest and longest movie duration? Return the results as columns with the names  max_duration and min_duration.
SELECT max(f.length) as max_duration, min(f.length) as min_duration FROM film f;

# 4. What's the average movie duration expressed in format (hours, minutes) Return the result as columns with the names hours and minutes?
SELECT floor(AVG(f.length)/60) as hours, floor(AVG(f.length)%60) as minutes FROM film f;

# 5. How many distinct (different) actors' last names are there?
SELECT COUNT(DISTINCT a.last_name) as different_last_names FROM actor a;

# 6.Since how many days has the company been operating (check the DATEDIFF() function)? Hint: rental table
SELECT datediff(r.last_update, min(r.rental_date)) as operating_time FROM rental r;

# 7. Show all rental information with additional columns month and weekday. (hint: DATE_FORMAT() ). Get 20 results.
SELECT date_format(r.rental_date, "%M") AS month, date_format(r.rental_date, "%W") AS weekday FROM rental r;

# 8. Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
SELECT date_format(r.rental_date, "%M") AS month, date_format(r.rental_date, "%W") AS weekday,
CASE
WHEN  date_format(r.rental_date, "%W")  = "Saturday" then "Weekend"
WHEN  date_format(r.rental_date, "%W")  = "Sunday" then "Weekend"
ELSE "Weekday"
END AS 'say_type'
FROM rental r;

# 9.How many rentals were made in the last month of renting activity?
SELECT count(Distinct(max(date_format(left(r.rental_date, 10),"%M")))) as renting_activity FROM rental r;