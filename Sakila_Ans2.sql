select * from actor;
-- List the last names of actors, as well as how many actors have that last name.
select last_name ,count(last_name) as total
from actor  
group by last_name;

--  List last names of actors and the number of actors who have that last name, but only for names that are shared by at least two actors
select last_name,count(last_name)  as total
from actor
group by last_name
having count(last_name) >= 2;

-- Oh, no! The actor HARPO WILLIAMS was accidentally entered in the actor table as GROUCHO WILLIAMS, the name of Harpo’s second cousin’s husband’s yoga teacher. Write a query to fix the record.
select first_name,last_name
from actor
where first_name="GROUCHO" and last_name="WILLIAMS";
update actor
set first_name= "HARPO"
where first_name="GROUCHO"  and last_name='WILLIAMS';
select * from actor
where last_name="WILLIAMS";

-- Perhaps we were too hasty in changing GROUCHO to HARPO. It turns out that GROUCHO was the correct name after all! In a single query, if the first name of the actor is currently HARPO, change it to GROUCHO. Otherwise, change the first name to MUCHO GROUCHO, as that is exactly what the actor will be with the grievous error. BE CAREFUL NOT TO CHANGE THE FIRST NAME OF EVERY ACTOR TO MUCHO GROUCHO, HOWEVER!
select first_name,last_name
from actor
where first_name ="HARPO" and last_name = "WILLIAMS";
update actor
set first_name ="GROUCHO"
where first_name ="HARPO" and last_name = "WILLIAMS";
update actor
set first_name = case
when first_name = "HARPO" then "GROUCHO"
when first_name = "GROUCHO" then "MUCHO GROUCHO"
else first_name
END;
select * from actor
where last_name ="Williams";

-- You cannot locate the schema of the address table. Which query would you use to re-create it?
create table address_new (
address_id integer(11) NOT NULL,
address varchar(30) NOT NULL,
adress2 varchar(30) NOT NULL,
district varchar(30) NOT NULL,
city_id integer(11) NOT NULL,
postal_code integer(11) NOT NULL,
phone integer(10) NOT NULL,
location varchar(30) NOT NULL,
last_update datetime
); 
select * from address_new;


--  Use JOIN to display the first and last names, as well as the address, of each staff member. Use the tables staff and address 
select s.first_name,s.last_name,a.address as Address
from staff as s
join address as a
ON a.address_id = s.address_id;

-- Use JOIN to display the total amount rung up by each staff member in August of 2005. Use tables staff and payment
select  concat(s.first_name,' ',s.last_name) as "Staff Member",sum(p.amount) as "Total Spend"
from payment as p
	join staff as s
	on p.staff_id = s.staff_id
	where payment_date like '2005-08%'
	group by p.staff_id;
    
--  List each film and the number of actors who are listed for that film. Use tables film_actor and film. Use inner join.
 select f.title as "Film Name",count(fa.actor_id) as "Total Actors"
 from film_actor as fa
 JOIN film as f
 ON f.film_id = fa.film_id
 group by f.title;
 
 --  How many copies of the film Hunchback Impossible exist in the inventory system?
 select f.title as "Film Name", count(i.inventory_id) as "Total Copies"
 from inventory as i
 JOIN film as f
 ON f.film_id = i.film_id
 where f.title = "Hunchback Impossible"
 group by f.title ;
 
 -- Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name:
 select concat(c.first_name,' ',c.last_name) as "Customer Name" ,sum(p.amount) as "Total Paid"
 from payment as p
 JOIN customer as c
 ON p.customer_id = c.customer_id
 group by c.customer_id
order by c.last_name;

-- Use subqueries to display all actors who appear in the film Alone Trip.
select CONCAT(first_name,' ',last_name) as 'Actors in Alone Trip'
	from actor
	where actor_id in 
	(select actor_id from film_actor where film_id = 
	(select film_id from film where title = 'Alone Trip'));