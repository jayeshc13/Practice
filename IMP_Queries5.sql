select employeeNumber,
firstName,
lastName,
officeCode, 
NTILE(6) Over(order by officeCode desc) as quartile
from 
employees;

select employeeNumber,firstName,lastName,officeCode,
LAG (officeCode,1,0) over(order by employeeNumber) as previous
from 
employees;

select employeeNumber,firstName,lastName,officeCode,
LEAD(officeCode,1,0) over (order by  employeeNumber) as next_n
from employees;

select 
customerNumber,customerName,contactLastName,creditLimit,
first_value(creditLimit) over (PArtition by customerNumber order by creditLimit desc) as highest_salary
from customers;

select 
customerNumber,customerName,contactLastName,creditLimit,
last_value(creditLimit) over (PArtition by customerNumber order by creditLimit desc ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) as highest_salary
from customers;

select customerNumber,contactFirstName,contactLastName,creditLimit,
sum(creditlimit) over (PArtition by customerNumber order by contactFirstName) as cmf
from
customers;



