-- customer details who purchased classic Cars

select * from customers
where customerNumber in(
select customerNumber from orders
where orderNumber in(
select orderNumber from orderdetails
where productCode in( 
select productCode from products
where productLine = 'classic cars')));

-- find customerdetails who cancelled order
select * from customers
where customerNumber in(
select customerNumber from orders
where status = 'cancelled'); 

 -- find customer details who purchased Trucks and Buses
 select * from customers
where customerNumber in (
select customerNumber from orders
where OrderNumber in(
select OrderNumber from orderdetails
where productCode in (
 select productCode from products
 where productLine = 'Trucks and Buses')));
 
 -- employees whose office is in Sydney 
 select * from employees
 where officeCode in (
 select officeCode from offices
 where city = 'Sydney');

-- customers whose orders are above 50k
select * from customers
where customerNumber in(
select customerNumber from payments
where amount > 50000);


--  select customer whose productVendor is Motor City Art Classics
select * from customers
where customerNumber in (
select customerNumber from orders
where orderNumber in(
select OrderNumber from orderdetails
where productCode in (
select productCode from products
where productVendor = 'Motor City Art Classics')));

select * from customers
where customerNumber in(
select customerNumber from orders
where orderNumber in(
select orderNumber from orderdetails
where productCode in( 
select productCode from products

where productVendor = 'Motor City Art Classics')));