-- fetch customers details whose state is null
select * from customers
where state is null;
select * from customers
where state is not null;

-- fetch record of customers whose country is france uk usa japan canada
select * from customers
where country = 'UK' OR country ='France' OR country ='Japan' OR country ='canada' OR country ='USA';

select * from customers 
where country in ('uk','japan');

-- credit limit in range of 150000,200000
select * from customers 
where creditlimit between 15000 and 200000;

select contactfirstname,contactlastname,addressline1
from customers
where contactFirstName like 'h%'; 
select contactFirstName,contactLastName
 from customers
where contactFirstName like '%no%';

select contactFirstName,contactLastName
 from customers
where contactFirstName like 'a___';

select count(contactfirstname)
from customers
where country ='Canada';
select count(contactFirstName)
from customers
where country = 'Japan';

select sum(creditlimit) as TCL 
from customers
where country ='Japan';

select sum(creditlimit) as TCL 
from customers
where country ='Japan';

select avg(creditlimit) as ACL 
from customers
where country ='Japan';

select min(creditlimit) as TCL 
from customers
where country ='Japan';

select max(creditlimit) as TCL 
from customers
where country ='Japan';

select count(contactFirstName) as TCL 
from customers
where country ='Japan';

-- every country with total customers
select country, count(contactfirstname) as total
from customers
group by country; 

select country, count(contactfirstname) as total
from customers
group by country
having total > 10;

select country, sum(creditlimit) as total
from customers
group by country
having total < 600000;

select country ,count(contactfirstname) as total
from customers
group by country
having total > 10
order by total 
limit 1,2;

-- country wise highest creditlimit
select country, max(creditlimit) as highest
from customers
group by country
order by highest desc; 

select country, max(creditlimit) as highest
from customers
group by country
order by highest desc
limit 5;

select * from customers
where creditlimit>(
select avg(creditLimit) from customers); 


select * from orders
where status='cancelled';