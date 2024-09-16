create database database01;
show databases;

drop database database01;
use database01;

create table stud(
S_ID int,
S_NAME char(30),
S_PERCENTAGE float
);
select * from stud;

insert into stud
values(1,'Ramesh',94);

insert into stud
values(2,'Suresh',90);

insert into stud
values(3,'Ram',96);

insert into stud
values(4,'Jay',98);


insert into stud
values(5,'ALex',86);

select * from stud;

select * from advertising;
show tables;

-- update
show tables;
update stud
set S_Name = 'Raj'
where S_ID = 3;
select * from stud;

-- alter(to add column) 
alter table stud
add city char(20);
select * from stud;

alter table stud
drop column city;
describe stud;

alter table stud
modify S_NAME char(100);
describe stud;

alter table stud
rename column S_Percentage to S_Per;
describe stud;

alter table stud
rename to Student;
describe Student;

truncate table student;
describe student;
select * from student;

alter table student
drop  student;

drop database student;

use classicmodels;
select * from customers;
select contactFirstName,contactLastName,creditLimit from customers;

-- distinct
select distinct country from customers;
select distinct contactFirstName from customers;

select * from customers where creditlimit > 50000;
select * from customers where creditlimit >= 80000;

select * from customers order by creditlimit;
select * from customers order by creditlimit desc;
select * from customers order by contactFirstName;

select * from customers where country ='Japan' order by creditlimit;

select * from customers limit 3,2;

select * from customers where state is NULL;
select * from customers where state is not null;

select * from customers
where country ='UK'OR country ='USA' OR country = 'Japan';

 select * from customers
 where creditLimit between 50000 and 150000;
 
--  fetch the record whose first name starts with S
select contactfirstname,contactlastname,creditlimit
from customers
where contactFirstName like 's%';

select contactfirstname,contactlastname,creditlimit
from customers
where contactFirstName like 'a___';

select count(contactFirstName)
from customers
where country ='usa';

-- total creditlimit
select sum(creditlimit) as TCL from customers where country='usa';

select avg(creditlimit) as TCL from customers where country='uk';

select min(creditlimit) as TCL from customers where country='usa';

select max(creditlimit) as TCL from customers where country='uk';

-- every country with customers
-- groupby will 

select country,count(contactfirstname) as cust_count
from customers
group by country;

select count(contactFirstName)
from customers
where country;


select country,count(contactfirstname) as cust_count
from customers
group by country
having cust_count > 10 
order by cust_count desc 
limit 1,1;

-- find out dept vise highest salary
select country ,max(creditlimit) as highest
from customers
group by country
order by highest desc;



-- top 5 countries 
select country ,max(creditlimit) as highest
from customers
group by country
order by highest desc
limit 5;

-- SUB QUERY
-- find out details whose creditlimit is greater than avg creditlimit
 
select * from customers
where creditlimit>(
select avg(creditlimit) from customers);

-- find out customers details whose order is cancelled
select * from orders
where status = 'cancelled';  

-- 12/09/24
-- who purchased classic cars
select * from products
where productLine = 'Classic Cars';

select * from products
where productLine = 'Motorcycles';

select * from employees
where lastName = 'Bow';

select * from employees 
where jobTitle = 'Sales Rep';

select * from customers
where customerNumber in(
select CustomerNumber from orders
where OrderNumber in(
select OrderNumber from orderdetails
where productCode in(
select productCode from products
where productLine = 'classic Cars')));

select * from customers
where customerNumber in(
select customerNumber from orders
where status = 'Cancelled');