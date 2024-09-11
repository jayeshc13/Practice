create database database01;
show databases;
8
drop database database01;
use database1;
create table stud(
sid int,
sname char(10),
sper float
);
DROP TABLE stud;
create table stud(
sid int,
sname char(10),
sper float
);
insert into stud
values(1,'sej',80.34);

insert into stud
values(2,'erica',88.34),
(3,'jayesh',90.78),
(4,'sam',95.22);
select * from stud;

select * from advertising;
show tables;

-- update
show tables;
update stud
set sname='Rakesh'
where sid=3;

select * from stud;

-- delete
delete from stud
where sid=4;
select * from stud; 


-- to add the column we use alter
alter table stud
add city char(10);

-- describe is used to know the structure
describe stud;



-- drop: drop is used to drop the column also if we want to delete the row then we use delete command
alter table stud
drop column city;
describe stud;

-- modify: if we want to modify the type
alter table stud
modify sname char (100);
 
describe stud;

-- rename
alter table stud
rename column sper to percent;
describe stud;
 
alter table stud
rename to student;
describe student;
select * from student;

truncate table student;
select * from student;


-- difference betwwen drop delete and truncate
-- drop remove the tabel stur as well as record
-- delete remove the record/structure where the cond satisfied 
-- trancate remove the record but keep the structure/tabel as it is



-- to do analysis we use the following commands
-- select:select is used to fetch the data from table............here *is used to fetch all the columns.......if we want the specific columns then we have to write the name

use classicmodels; 
select * from customers;
select contactLastName,contactFirstName,creditlimit from customers;
-- not the case sensitive

-- distinct : gives the unique values
select distinct country from customers;
select distinct productline from products;

-- where clause : is used to filter the record based on condition
-- <table name>where<cond> 
-- find out the cust details whos credit limit is greater than 1lakh20th
select * from customers where creditlimit<30000 ;
select * from customers where creditlimit>120000;
select * from customers where creditlimit!=120000;
select * from customers where city='nantes';
select * from customers where city='NYC'and creditlimit<=150000;
select * from customers where country='UK'OR creditlimit<=30000;
select * from customers 
where NOT country='USA'and creditlimit<=150000;

-- Order by: used to sort
select * from customers order by creditlimit ; 
select * from customers order by creditlimit desc; -- (numeric)
select * from customers order by contactfirstname; -- (char)
select * from customers where country='USA' order by creditlimit<150000;

-- select * from gives all the record and limit gives the first 5 records
select * from customers
limit 3,2; -- here 3 records are skip and 2 rows are shown
-- impppppppppp.....find the customers details whoes creditlimit is 4th 
select * from customers order by creditlimit desc limit 3,1;
-- nth highest (n-1),1


-- fetch customers details whose state is null
select * from customers
where state is null;
select * from customers
where state is not null;

-- fetch records of customers whose country is USA,UK,Australia
select * from customers
where country = 'USA' OR country = 'UK' OR country ='Australia';

-- by using in we can find  multiple values in single column
select * from customers
where country in ('USA','UK','Australia');

-- we use between for range (only works on numeric or date)
-- customers details whose creditlimit is from 50000 to 150000  
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

