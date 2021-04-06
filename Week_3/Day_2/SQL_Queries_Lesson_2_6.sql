# 1. Get the unique release years.
SELECT DISTINCT f.release_year FROM film f;

# 2. Get all films with ARMAGEDDON in the title.
SELECT * FROM film f
WHERE f.title IN  ("ARMAGEDDON");

# 3. Get all films which title ends with APOLLO.
SELECT * FROM film f
WHERE f.title LIKE  ("%APOLLO");

# 4. Get 10 the longest films.
SELECT * FROM film f
ORDER BY f.length DESC
LIMIT 10;

# 5. How many films include Behind the Scenes content?
SELECT count(f.special_features ) FROM film f
WHERE f.special_features IN ("Behind the Scenes");

# 6. Drop column picture from staff.
ALTER TABLE staff 
DROP COLUMN picture;
SELECT * FROM staff;

# 7. A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. Update the database accordingly.
UPDATE staff
SET first_name = "Tammy", last_name ="Sanders", address_id = "79", email = "TAMMY.SANDERS@sakilacustomer.org", username = "Tammy" 
WHERE staff_id = 3;

#SELECT * FROM customer
#WHERE Last_name = "SANDERS"

# 8. Add a rental for movie "Academy Dinosaur" by the customer "Charlotte Hunter" from employee Mike Hillyer at Store 1. You can use current date for the rental_date column in the rental table. 
#    Hint: Check the columns in the table rental and see what information you would need to add there. You can query those pieces of information in other tables. 
#    For eg., you would notice that you need customer_id information as well. To get that you can use the following query:
#    select customer_id from sakila.customer
#    where first_name = 'CHARLOTTE' and last_name = 'HUNTER';
#    Use similar method to get inventory_id, film_id, and staff_id.

# I think: iventory_id from rental = film_id from film
# I think: return_date ? rental_date + 7 days

UPDATE rental r
SET r.rental_date = "2021-04-06 16:47:00", r.inventory_id = 1, r.customer_id = 130, r.return_date = "2021-04-13 23:59:59", r.staff_id = 1, r.last_update = "2021-04-06 16:47:00" 
WHERE r.rental_id = 1001;
