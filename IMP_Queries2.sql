select now();
select curdate();
select curtime();
select date_add('2024-09-19',INTERVAL 1 MONTH);
select datediff('2024-09-19','2024-08-19');
select date_format(now(),'%y-%m-%d');
select date_format(now(),'%d-%m-%y');
select date_format(now(),'%m-%y-%d') as Date;
select dayofweek('2002-11-22');
select dayofweek(now());
select dayofyear(now());
select dayofmonth(now());
select dayname(now());
select dayname('2002-11-22');
select 
    employeeNumber,
    firstName,
    OfficeCode,
    row_number () over
    (Partition by officeCode ORDER BY employeeNumber desc)
    As Row_Num
    from 
    employees;
    
    Select
    employeeNumber,
    firstName,
    lastName,
    OfficeCode,
    row_number() over
    (partition by officeCode Order by employeeNumber desc)
    as row_num
    from  employees;
    
    select
    customerNumber,
    contactFirstName,
    contactlastName,
    creditLimit,
    Rank() over
    (order by creditlimit desc)
    as rnk
    from customers;
    
    SELECT 
    customerNumber,
    contactFirstName,
    contactLastName,
    creditLimit,
    country,
    DENSE_RANK() Over (ORDER BY country) AS dnsrk,
    RANK () Over (ORDER BY country) as rnk
FROM 
    customers;
    
        SELECT 
    customerNumber,
    contactFirstName,
    contactLastName,
    creditLimit,
    country,
    DENSE_RANK() Over (Partition by country ORDER BY creditLimit ) AS dnsrk,
    RANK () Over (Partition by country ORDER BY creditLimit ) as rnk
FROM 
    customers;
    
    