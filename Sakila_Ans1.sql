--  
select * from actor
where first_name ='Scarlett';
--
select * from actor 
where last_name ='Johansson';

--
select count(distinct last_name) as total
from actor;
--
select last_name from actor group by last_name having count(*) =1;    

--
select last_name from actor group by last_name having count(*) > 1;

--
select actor.actor_id, actor.first_name, actor.last_name,
       count(actor_id) as film_count
from actor join film_actor using (actor_id)
group by actor_id
order by film_count desc
limit 1;

select actor.actor_id, actor.first_name,actor.last_name,
   count(actor_id) as total_films
from actor join film_actor using (actor_id)
group by actor_id
order by total_films desc
limit 1; 

-- Is ‘Academy Dinosaur’ available for rent from Store 1?
select * from film
where film_id = 1 in(
select film_id from inventory
where store_id in(
select store_id from store
 where store_id = 1));
 
 select film.film_id, film.title, store.store_id, inventory.inventory_id
from inventory join store using (store_id) join film using (film_id)
where film.title = 'Academy Dinosaur' and store.store_id = 1;


-- Insert a record to represent Mary Smith renting ‘Academy Dinosaur’ from Mike Hillyer at Store 1 today .
 select * from rental;
 insert into rental (rental_date, inventory_id, customer_id, staff_id)
values (NOW(), 2, 1, 1);
select * from store;
select * from film;

-- 1a. Display the first and last names of all actors from the table actor
select first_name,last_name from actor; 

-- Display the first and last name of each actor in a single column in upper case letters. Name the column Actor Name 
select upper(concat(first_name ,' ', last_name)) as Actor_Name
from actor;

-- You need to find the ID number, first name, and last name of an actor, of whom you know only the first name, “Joe.” .
 select actor_id,first_name,last_name,last_update
 from actor
 where first_name like 'Joe';
 
 -- Find all actors whose last name contain the letters GEN
 select first_name,last_name
 from actor
 where last_name like "%Gen%";
 
 
 -- Find all actors whose last names contain the letters LI. This time, order the rows by last name and first name, in that order:
 select first_name,last_name
 from actor
 where last_name like "%LI%"
 order by last_name,first_name;
 
 -- Using IN, display the country_id and country columns of the following countries: Afghanistan, Bangladesh, and China
 select country_id,country
 from country 
 where country in ('Afghanistan', 'Bangladesh', 'China');
 
 -- Add a middle_name column to the table actor. Position it between first_name and last_name
 alter table actor
 add column middle_name varchar(30) after first_name;
 select * from actor;
 
 -- You realize that some of these actors have tremendously long last names. Change the data type of the middle_name column to blobs
 alter table actor
 modify column middle_name blob;
 select * from actor;
 
 --  delete table middle name
 alter table actor
 drop column middle_name;
 
 select * from actor;
 