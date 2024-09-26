create database NewPractice;
show databases;
drop database newpractice;
use newpractice;
create table employee(
E_Id int,
E_FirstName char(55),
E_LastName char(50),
E_City char(50));
select * from employee;
drop table employee;
insert into employee
values(101,"Allen","Solly","New York"),
(102,"Peter","England","USA"),
(103,"John","Williams","Paris"),
(104,"Alex","Hales","Sydney");
select * from employee;
-- update
update employee
set E_FirstName="Ballen" 
where E_ID=101;
select * from employee;

-- delete
delete from employee 
where E_FirstName="Alex";
select * from employee;

describe employee;
alter table employee
rename column E_city to City;

-- alter
alter table employee
add Work_Hrs float(20);

alter table employee
drop column Work_Hrs;

truncate table employee;
select  * from employee;


use sakila;
select first_name,last_name from actor;
select distinct country from country;
select * from payment where amount > 5.99;
select * from payment where amount = 10.99;
select * from payment where amount <= 3.99; 
select * from customer;

-- order by
select * from payment order by amount;
select * from payment order by amount desc;

select * from payment where customer_id = 15 order by amount desc limit 4,1;
select * from address
where city_id is NULL;

select * from payment
where amount between 3.99 and 7.99;

 select customer_id,first_name,last_name,email
 from customer
 where first_name like "s%";
 
 select customer_id,first_name,last_name,email
 from customer
 where last_name like "B%";
 
 use classicmodels;
 select country,count(contactFirstName) as Total
 from customers
 group by country 
 order by Total desc;
 
 select country,max(creditlimit) as Highest
 from customers
 group by country
 order by Highest desc;
 
  select country,min(creditlimit) as Lowest
 from customers
 group by country
 order by Lowest desc;
 
 select * from customers
 where customerNumber in(
 select customerNumber from orders
 where status = "Cancelled");
 
 select * from customers
 where customerNumber in(
 select customerNumber from orders
 where orderNumber in(
 select orderNumber from orderdetails
 where productCode in(
 select productCode from products
 where productline='Classic Cars')));
 
 
 