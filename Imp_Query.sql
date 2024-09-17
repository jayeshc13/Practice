SELECT CONCAT(contactFirstName, ' ', contactLastName) AS full_name 
FROM customers;

SELECT SUBSTRING('Hello World', 1, 5);

SELECT upper('github') as upper_case;
SELECT lower('GITHUB') as lower_case;

SELECT length('Thiruvananthpuram') as length_of_string;
SELECT trim('   Hello   ');
SELECT trim(LEADING '0' FROM '0001230');
select trim(trailing '0' from '01200');


SELECT replace('Hello World','World','Universe');

select instr('Hello World','World');

select reverse('Hello');

select LEFT('Hello World',5);
select  right('Hello World',5);

SELECT LOCATE('u', 'Git Hub');
select abs(-100000);

select round(3.14159,3);
select ceiling(3.1),floor(3.5);
select sqrt(16);
select power(2,3);
select pow(2,3);