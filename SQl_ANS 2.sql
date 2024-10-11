-- Prepare a list of offices sorted by country, state, city. 
select country,state,city from offices
order by country asc,
state asc,
city asc;

-- How many employees are there in the company?
select count(employeeNumber) from employees;

--  What is the total of payments received?
select sum(amount)
from payments;

--  List the product lines that contain 'Cars'
select *  from productlines
where productLine like "%cars";

--  Report total payments for October 28, 2004.
select sum(amount) from payments
where paymentDate like "2004-10-28";

-- Report those payments greater than $100,000. 
select amount from payments
where amount > 100000;

-- List the products in each product line.
select productLine from products;

--  How many products in each product line?
select count(productLine) from productlines;
SELECT 
    productLine, 
    COUNT(*) AS product_count
FROM 
    products
GROUP BY 
    productLine;


-- What is the minimum payment received?
select min(amount) from payments;

--  List all payments greater than twice the average payment.
select *  from payments
where amount > 2 *(select avg(amount) from payments);

-- What is the average percentage markup of the MSRP on buyPrice?
select * from products;
SELECT 
    AVG(((MSRP - buyPrice) / buyPrice) * 100) AS avg_percentage_markup
FROM 
    products;
    
 