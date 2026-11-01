-- Sql functions

-- String functions

-- CONCAT

-- Concatenate first name and country into one column
SELECT
    c.first_name,
    c.country,
    CONCAT(c.first_name , '-' ,c.country ) AS name_country
FROM customers c;

-- UPPER AND LOWER

-- convert the customer first name to lowercase
SELECT
    c.first_name,
    LOWER(c.first_name) AS low_name
FROM customers c ;

-- convert the customer first name to uppercase
SELECT
    c.first_name,
    UPPER(c.first_name )
FROM customers c ;

-- TRIM

-- find customers whose first name contains leading or trailing spaces
SELECT
    c.first_name,
    LEN(c.first_name) AS len_name,
    LEN(TRIM(c.first_name)) AS len_trim_name,
    LEN(c.first_name) - LEN(TRIM(c.first_name )) AS flag
FROM customers c
WHERE LEN(c.first_name) <> LEN(TRIM(c.first_name ))
--WHERE c.first_name <> TRIM(c.first_name);

-- REPLACE

-- Remove dashes (-) from a phone number
SELECT
    '123-246-464' AS phone_number,
    REPLACE('123-246-464', '-', '/') AS clean_phone

-- Replace File Extension from txt to csv
SELECT
    'reports.txt' AS old_filename,
     REPLACE('reports.txt', '.txt', '.csv')

-- LEN

-- Calcualte the length of each customers first name
SELECT
    c.first_name,
    LEN(c.first_name) AS len_name
FROM customers c

-- LEFT

-- Retrieve the first two characters of each first name
SELECT
    c.first_name,
    LEFT(TRIM(c.first_name), 2) AS first_two_char
FROM customers c

-- Retrieve the last two characters of each first name
SELECT
    c.first_name,
    RIGHT(c.first_name , 2) AS last_two_char
FROM customers c

-- SUBSTRING

-- Retrieve a list of customer's first name removing the first character
SELECT
    c.first_name,
    SUBSTRING(TRIM(c.first_name), 2, LEN(c.first_name)) AS sub_name
FROM customers c

-- Number functions

-- ROUND
SELECT
    3.516,
    ROUND(3.516, 2) AS round_2,
    ROUND(3.516, 1) AS round_1,
    ROUND(3.516, 0) AS round_0

-- ABS
SELECT
    -10,
    ABS(-10),
    ABS(10)

-- DATE FUNCTIONS

-- YEAR, MONTH, DAY
SELECT
    o.OrderID ,
    o.CreationTime,
    YEAR(o.CreationTime ) as Year,
    MONTH(o.CreationTime ) as Month,
    DAY(o.CreationTime ) as  Day
FROM Sales.Orders o

-- DATEPART
SELECT
    o.OrderID ,
    o.CreationTime,
    DATEPART(year, o.CreationTime ) as Year_dp,
    DATEPART(month, o.CreationTime ) as Month_dp,
    DATEPART(day, o.CreationTime ) as Day_dp,
    DATEPART(hour, o.CreationTime ) as Hour,
    DATEPART(quarter, o.CreationTime ) as Quater_dp,
    DATEPART(week, o.CreationTime ) as Week_dp
FROM Sales.Orders o

-- DATENAME
SELECT
    o.OrderID ,
    o.CreationTime ,
    DATENAME(month, o.CreationTime ) as mon_day,
    DATENAME(weekday, o.creationTime) as week_day,
    DATENAME(day, o.creationTime) as day_name,
    DATENAME(year, o.creationTime) as year_dn,
    DATEPART(month, o.CreationTime ) as mon_dp,
    DATEPART(week, o.CreationTime ) as week_dp
FROM Sales.Orders o

-- DATETRUNC
SELECT
    o.OrderID ,
    o.CreationTime,
    DATETRUNC(minute, o.CreationTime ) as minute_dt,
    DATETRUNC(day, o.CreationTime ) as day_dt,
    DATETRUNC(year, o.CreationTime ) as year_dt
FROM Sales.Orders o

-- USE CASE
SELECT
    DATETRUNC(month, o.CreationTime) as month_dt,
    COUNT(*) as total_order
FROM Sales.Orders o
GROUP BY DATETRUNC(month, o.CreationTime)

-- EOMONTH
SELECT
    o.OrderID ,
    o.CreationTime,
    EOMONTH(o.CreationTime ) as end_of_month,
    CAST(DATETRUNC(month, o.CreationTime ) as DATE )as start_of_month -- changing the data type to date. datetrunc retur datetime
FROM Sales.Orders o

-- TASK

-- How many orders were placed each year?
SELECT
    YEAR(o.OrderDate  ) as order_date,
    COUNT(*) as no_of_order
FROM Sales.Orders o
GROUP BY YEAR(o.OrderDate );

-- How many orders were placed each month?
SELECT
    DATENAME(month, o.OrderDate ) as order_date,
    COUNT(*) as no_of_orders
FROM Sales.Orders o
GROUP BY DATENAME(month, o.OrderDate )

-- Show all order that were placed during the month of february
SELECT
    *
FROM Sales.Orders o
WHERE MONTH(o.OrderDate ) = 2

-- FORMAT
SELECT
    o.OrderID,
    o.CreationTime ,
    FORMAT(o.creationTime, 'MM-dd-yyyy') as usa_format,
    FORMAT(o.creationTime, 'dd-MM-yyyy') as euro_format,
    FORMAT(o.CreationTime , 'MMMM') as MMMM,
    FORMAT(o.CreationTime , 'MMM') as MMM,
    FORMAT(o.CreationTime , 'MM') as MM,
    FORMAT(o.CreationTime , 'dddd') as ddd,
    FORMAT(o.CreationTime , 'ddd') as ddd,
    FORMAT(o.CreationTime , 'dd') as dd
FROM Sales.Orders o

-- Show Creation time using the following format
-- Day Wed Jan Q1 2025 12:34:56 PM
SELECT
    o.CreationTime,
    'Day ' + FORMAT(o.CreationTime , 'ddd MMM') + ' Q' + DATENAME(quarter, o.CreationTime ) + ' ' + FORMAT(o.CreationTime , 'yyyy hh:mm:ss tt') AS 'format_creation_time'
FROM Sales.Orders o

-- Formating Use Case
SELECT
    FORMAT(o.OrderDate , 'MMM yy') as Order_Date,
    COUNT(*) as no_of_order
FROM sales.Orders o
GROUP BY FORMAT(o.OrderDate , 'MMM yy')

 -- CONVERT
SELECT
    o.CreationTime ,
    CONVERT(Date, o.CreationTime ) AS [Datetime To Date CONVERT],
    CONVERT(VARCHAR, o.CreationTime, 32) AS [USA Std. Style:32], -- casting and Formart
    CONVERT(VARCHAR, o.CreationTime , 34) AS [EUROPE STD. Style:34]
FROM Sales.Orders o

-- CAST
SELECT
    o.CreationTime,
    CAST(123 AS VARCHAR) AS [Int to String],
    CAST(o.CreationTime AS DATE) AS [DateTime to Date],
    CAST('2025-08-20' AS DATE) AS [String to Date]
FROM Sales.Orders o

-- Date Calculation

-- DATEADD
SELECT
    o.OrderID ,
    o.OrderDate ,
    DATEADD(year, 2, o.OrderDate ) AS TwoYearsLater,
    DATEADD(month, 3, o.OrderDate ) AS ThreeMonthLater,
    DATEADD(day, -10, o.OrderDate ) AS BeforeTenDay
FROM Sales.Orders o

-- Calculate the age of employee
SELECT
    e.EmployeeID ,
    e.BirthDate ,
    DATEDIFF(year, e.BirthDate , GETDATE()) AS employee_age
FROM Sales.Employees e;

-- Find the average shipping duration in days for each month
SELECT
    MONTH(o.OrderDate) as order_date,
    AVG(DATEDIFF(day, o.OrderDate , o.ShipDate )) AS avg_ship
FROM Sales.Orders o
GROUP BY MONTH(o.OrderDate )

-- Time Gap Analysis
-- Find the number of days between order and previous order
SELECT
    o.OrderID ,
    o.OrderDate AS current_order_date,
    LAG(o.OrderDate ) OVER (ORDER BY o.OrderDate ) AS Previous_order_date,
    DATEDIFF(day, LAG(o.OrderDate ) OVER (ORDER BY o.OrderDate ), o.OrderDate ) As no_of_days
FROM Sales.Orders o
