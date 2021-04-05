# 1.Review the tables in the database.
use sakila;

#2 .Explore tables by selecting all columns from each table or using the in built review features for your client.
#select * from actor a
#select * from adress ad
#select * from category cs
#select * from city ci
#select * from country co
#select * from customer cu
#select * from film f
#select * from film_actor fa
#select * from film_category fc
#select * from inventory i
#select * from language l
#select * from payment p
#select * from rental r
#select * from staff st
#select * from store s

# 3.Select one column from a table. Get film titles.
#select f.title from film f

# 4. Select one column from a table and alias it. 
#select a.last_name as name from actor a

# Get unique list of film languages under the alias language. 
#select l.name as language from language l

# Note that we are not asking you to obtain the language per each film, but this is a good time to think about how you might get that information in the future.
#select Distinct f.language_id as language from film f

# 5. Using the select statements and reviewing how many records are returned. 
# can you find out how many stores and staff does the company have? Can you return a list of employee first names only?
#select distinct st.store_id, count(st.active) as num_employer from staff st
#select count(s.store_id) as num_stores from store s

# 6. Bonus: How many unique days did customers rent movies in this dataset?
select count(distinct date(r.rental_date)) as date from rental r