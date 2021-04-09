# 0.Inspect the database structure and find the best-fitting table to analyse for the next task.

# 1. Using multiple JOIN() clauses display the store ID, city, and country of each store.

-- SELECT * FROM sakila.country c
-- SELECT * FROM sakila.city ci 
-- SELECT * FROM sakila.address
-- SELECT * FROM sakila.store s


#1.Version
SELECT s.store_id, ci.city, c.country from sakila.country c
JOIN sakila.city ci  
ON c.country_id = ci.country_id

JOIN sakila.address a
ON ci.city_id = a.city_id

JOIN sakila.store s
ON a.address_id = s.address_id;

#2.Version
SELECT s.store_id, ci.city, c.country from sakila.store s
JOIN sakila.address a
ON s.address_id = a.address_id

JOIN sakila.city ci  
ON a.city_id = ci.city_id

JOIN sakila.country c 
ON ci.country_id = c.country_id


# 2. Display the total payment amount for each store.

-- SELECT * FROM sakila.store s
-- SELECT * FROM sakila.customer c
-- SELECT * FROM sakila.payment p
-- SELECT * FROM sakila.staff st

SELECT sum(p.amount) as total_amount, s.store_id from sakila.store s
JOIN sakila.staff st
ON s.store_id = st.store_id
JOIN sakila.payment p
ON st.staff_id = p.staff_id
GROUP BY s.store_id

# 3. What is the average film length per each category? Which category of films are the longest?

-- SELECT * FROM sakila.film f
-- SELECT * FROM sakila.film_category fc
-- SELECT * FROM sakila.category c

SELECT Round(AVG(f.length),2) as avg_length , c.name from sakila.category c
JOIN sakila.film_category fc
ON c.category_id = fc.category_id
JOIN sakila.film f
ON fc.film_id = f.film_id
GROUP BY c.name
ORDER BY Round(AVG(f.length),2) DESC

# 4. Display the 2 most frequently rented movies in descending order.

SELECT f.title, count(r.rental_date) as frequent from sakila.rental r
JOIN sakila.inventory i
ON r.inventory_id = i.inventory_id 
JOIN sakila.film f
ON i.film_id = f.film_id
GROUP By f.title
ORDER BY frequent DESC

# 5. Display the top 5 categories with highest revenue (payment amount) in descending order.

-- SELECT * FROM sakila.film f
-- SELECT * FROM sakila.film_category fc
-- SELECT * FROM sakila.category c

SELECT sum(p.amount) as revenue, c.name from sakila.category c
JOIN sakila.film_category fc
ON c.category_id = fc.category_id
JOIN sakila.film f
ON fc.film_id = f.film_id
JOIN sakila.inventory i
ON f.film_id = i.film_id
JOIN sakila.rental r
ON i.inventory_id = r.inventory_id
JOIN sakila.payment p
ON r.rental_id = p.rental_id
GROUP BY c.name
ORDER BY revenue DESC
LIMIT 5


#Solution from the TA's
SELECT
	name            AS categoty,
	SUM(amount)     AS `gross revenue`
FROM sakila.payment
	JOIN (sakila.rental
		JOIN (sakila.inventory
			JOIN (sakila.film_category
				JOIN sakila.category USING (category_id))
			USING (film_id))
		USING (inventory_id))
	USING (rental_id)
GROUP BY category_id
ORDER BY `gross revenue` DESC
LIMIT 5;




# 6.Is the Academy Dinosaur movie available for rent from Store 1? If yes, display the title, store_id and inventory_id of the available copies of that movie.

-- SELECT * FROM sakila.film f

SELECT f.title, s.store_id, i.inventory_id  from sakila.film f
JOIN sakila.inventory i
ON f.film_id = i.film_id
JOIN sakila.store s
ON i.store_id = s.store_id
WHERE f.title = "ACADEMY DINOSAUR" AND s.store_id = 1


