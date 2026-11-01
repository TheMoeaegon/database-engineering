## SQL functions

← Previous: [Set Operators](../set-operators/set-operators.md) | [Index](../README.md) | Next → [Practice (sql/)](../sql)

We have data inside table and we can perform different operation on data like we can change the value of the data like doing data manipulation, data analysis to generate report or find insights, data cleaning or data transformation in order to solve some sql task. and in sql to solve this task we have functions.

**What is functions?
\- A Built in SQL code:
- accept an input value
- process it
- returns an output value

![what-is-a-function](images/what-is-a-function.png)

**Nested Functions**

\- Function use inside another function.
![nested-functions](images/nested-functions.png)

### Types of SQL Functions

![types-of-sql-functions](images/types-of-sql-functions.png)

#### Single-Row Function (Row-Level-Calculation)

##### String Functions

![string-functions](images/string-functions.png)

**Manipulation**

###### **CONCAT**

\- Combine multiple string into one.

**Example**

```sql
-- Concatenate first name and country into one column
SELECT
    c.first_name,
    c.country,
    CONCAT(c.first_name , '-' ,c.country ) AS name_country
FROM customers c;
```

###### **LOWER & UPPER**

**Example**

```sql
-- convert the customer first name to lowercase
SELECT
    c.first_name,
    LOWER(c.first_name) AS low_name
FROM customers c ;

-- conver the customer first name to uppercase
SELECT
    c.first_name,
    UPPER(c.first_name )
FROM customers c ;
```

###### **TRIM**

\- Remove Leading and Trailing spaces.

**Example**

```sql
-- find customers whose first name contains leading or trailing spaces
SELECT
    c.first_name,
    LEN(c.first_name) AS len_name,
    LEN(TRIM(c.first_name)) AS len_trim_name,
    LEN(c.first_name) - LEN(TRIM(c.first_name )) AS flag
FROM customers c
--WHERE LEN(c.first_name) <> LEN(TRIM(c.first_name ))
WHERE c.first_name <> TRIM(c.first_name);
```

###### **REPLACE**

\- Replace specific character with a new character
\- It not only replace but can be used to remove the value.
![replace-function](images/replace-function.png)

**Example**

```sql
-- Remove dashes (-) from a phone number
SELECT
    '123-246-464' AS phone_number,
    REPLACE('123-246-464', '-', '/') AS clean_phone

-- Replace File Extension from txt to csv
SELECT
    'reports.txt' AS old_filename,
     REPLACE('reports.txt', '.txt', '.csv')
```

**Calculation**

###### **LEN**

\- Count how many characters
\- Can be used with number, character and date
![len-function](images/len-function.png)

**Example**

```sql
-- Calcualte the length of each customers first name
SELECT
    c.first_name,
    LEN(c.first_name) AS len_name
FROM customers c
```

**String Extraction**

###### **LEFT**

\- Extract specific number of characters from the start
\- Syntax: LEFT(value,  length)

###### **RIGHT**

\- Extract specific number of characters from the end
\- Syntax: RIGHT(value,  length)

**Example**

```sql
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
```

###### **SUBSTRING**

\- Extract a part of a string at a specified position
\- Syntax: SUBSTRING(value, start, length)

**Example**

```sql
-- Retrieve a list of customer's first name removing the first character
SELECT
    c.first_name,
    SUBSTRING(TRIM(c.first_name), 2, LEN(c.first_name)) AS sub_name
FROM customers c
```

##### Number Functions

###### **ROUND**

![round-function](images/round-function.png)

**Example**

```sql
SELECT
    3.516,
    ROUND(3.516, 2) AS round_2,
    ROUND(3.516, 1) AS round_1,
    ROUND(3.516, 0) AS round_0
```

###### **ABS**

\- Convert negative number to positive

**Example**

```sql
SELECT
    -10,
    ABS(-10),
    ABS(10)
```

##### Date & Time Functions

**GETDATE**

\- We can use GETDATE function to get date value. it is one of 3 ways to get date value in sql. first way is to get from column value with date type, second is static value and last way is to use GETDATE function.
\- return the current date and time at the moment when the query is executed.

**Manipulation Date**

![date-manipulation](images/date-manipulation.png)
We can use different operation to manipulate date. we can manipulate the date value by extracting some part of date, or change the format of the date, or we can use to calculate the difference between two date and lastly we can validate the given date which result in 0 (false) if date is invalid and 1 if the date is in valid format.

**Different Date and Time Functions**

![date-time-functions](images/date-time-functions.png)

**Part Extraction**

###### **DAY**

\- Return the day from Date
\- Syntax: DAY(date)

###### **MONTH**

\- Return the month from Date
\- Syntax: MONTH(date)

###### **YEAR**

\- Return the year from Date
\- Syntax: YEAR(date)

```sql
-- YEAR, MONTH, DAY
SELECT
    o.OrderID ,
    o.CreationTime,
    YEAR(o.CreationTime ) as Year,
    MONTH(o.CreationTime ) as Month,
    DAY(o.CreationTime ) as  Day
FROM Sales.Orders o
```

###### **DATEPART**

\- Return specific part of a date as a number like week, or quater.
\- Syntax: DATEPART(part, date)
\- Example for month: DATEPART(month, OrderDate)
\- we can also use abbreviation of part like mm. DATEPART(mm, '2026-09-20')
\- the return value of this function is always of int type

```sql
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
```

| OrderID | CreationTime            | Year_dp | Month_dp | Day_dp | Hour | Quater_dp | Week_dp |
| ------- | ----------------------- | ------- | -------- | ------ | ---- | --------- | ------- |
| 1       | 2025-01-01 12:34:56.000 | 2025    | 1        | 1      | 12   | 1         | 1       |
| 2       | 2025-01-05 23:22:04.000 | 2025    | 1        | 5      | 23   | 1         | 2       |
| 3       | 2025-01-10 18:24:08.000 | 2025    | 1        | 10     | 18   | 1         | 2       |
| 4       | 2025-01-20 05:50:33.000 | 2025    | 1        | 20     | 5    | 1         | 4       |
| 5       | 2025-02-01 14:02:41.000 | 2025    | 2        | 1      | 14   | 1         | 5       |
| 6       | 2025-02-06 15:34:57.000 | 2025    | 2        | 6      | 15   | 1         | 6       |
| 7       | 2025-02-16 06:22:01.000 | 2025    | 2        | 16     | 6    | 1         | 8       |
| 8       | 2025-02-18 10:45:22.000 | 2025    | 2        | 18     | 10   | 1         | 8       |
| 9       | 2025-03-10 12:59:04.000 | 2025    | 3        | 10     | 12   | 1         | 11      |
| 10      | 2025-03-16 23:25:15.000 | 2025    | 3        | 16     | 23   | 1         | 12      |

###### **DATENAME**

\- Returns the name of a specific part of a date
\- The return value of this function is string.
\- Syntax: DATENAME(part, date) -> return string

![datename-function](images/datename-function.png)

**Example**

```sql
-- DATENAME
SELECT
    o.OrderID,
    o.CreationTime,
    DATENAME(month, o.CreationTime) AS mon_day,
    DATENAME(weekday, o.CreationTime) AS week_day,
    DATENAME(day, o.CreationTime) AS day_name,
    DATENAME(year, o.CreationTime) AS year_dn,
    DATEPART(month, o.CreationTime) AS mon_dp,
    DATEPART(week, o.CreationTime) AS week_dp
FROM Sales.Orders o
```

| OrderID | CreationTime            | mon_day  | week_day  | day_name | year_dn | mon_dp | week_dp |
| ------- | ----------------------- | -------- | --------- | -------- | ------- | ------ | ------- |
| 1       | 2025-01-01 12:34:56.000 | January  | Wednesday | 1        | 2025    | 1      | 1       |
| 2       | 2025-01-05 23:22:04.000 | January  | Sunday    | 5        | 2025    | 1      | 2       |
| 3       | 2025-01-10 18:24:08.000 | January  | Friday    | 10       | 2025    | 1      | 2       |
| 4       | 2025-01-20 05:50:33.000 | January  | Monday    | 20       | 2025    | 1      | 4       |
| 5       | 2025-02-01 14:02:41.000 | February | Saturday  | 1        | 2025    | 2      | 5       |
| 6       | 2025-02-06 15:34:57.000 | February | Thursday  | 6        | 2025    | 2      | 6       |
| 7       | 2025-02-16 06:22:01.000 | February | Sunday    | 16       | 2025    | 2      | 8       |
| 8       | 2025-02-18 10:45:22.000 | February | Tuesday   | 18       | 2025    | 2      | 8       |
| 9       | 2025-03-10 12:59:04.000 | March    | Monday    | 10       | 2025    | 3      | 11      |
| 10      | 2025-03-16 23:25:15.000 | March    | Sunday    | 16       | 2025    | 3      | 12      |

Here DATENAME(day, date) and DATENAME(year, date) return number of string type which is different from DATEPART() function which return number of int type.
So, most important part of DATENAME() function is to provide more human readable information to users.

###### **DATETRUNC**

\- Truncates the date to the specific part
\- Syntax: DATETRUNC(part, date) -> return date or datetime
\- It is not extracting the part but reseting the part

**Concept — it resets the parts instead of extracting them**

![datetrunc-concept](images/datetrunc-concept.png)

**Examples**

| `DATETRUNC(minute, date)`                        | `DATETRUNC(hour, date)`                      |
| ------------------------------------------------ | -------------------------------------------- |
| ![datetrunc-minute](images/datetrunc-minute.png) | ![datetrunc-hour](images/datetrunc-hour.png) |

**Result**

```sql
-- DATETRUNC
SELECT
    o.OrderID,
    o.CreationTime,
    DATETRUNC(minute, o.CreationTime) AS minute_dt,
    DATETRUNC(day, o.CreationTime) AS day_dt,
    DATETRUNC(year, o.CreationTime) AS year_dt
FROM Sales.Orders o
```

| OrderID | CreationTime            | minute_dt               | day_dt                  | year_dt                 |
| ------- | ----------------------- | ----------------------- | ----------------------- | ----------------------- |
| 1       | 2025-01-01 12:34:56.000 | 2025-01-01 12:34:00.000 | 2025-01-01 00:00:00.000 | 2025-01-01 00:00:00.000 |
| 2       | 2025-01-05 23:22:04.000 | 2025-01-05 23:22:00.000 | 2025-01-05 00:00:00.000 | 2025-01-01 00:00:00.000 |
| 3       | 2025-01-10 18:24:08.000 | 2025-01-10 18:24:00.000 | 2025-01-10 00:00:00.000 | 2025-01-01 00:00:00.000 |
| 4       | 2025-01-20 05:50:33.000 | 2025-01-20 05:50:00.000 | 2025-01-20 00:00:00.000 | 2025-01-01 00:00:00.000 |
| 5       | 2025-02-01 14:02:41.000 | 2025-02-01 14:02:00.000 | 2025-02-01 00:00:00.000 | 2025-01-01 00:00:00.000 |
| 6       | 2025-02-06 15:34:57.000 | 2025-02-06 15:34:00.000 | 2025-02-06 00:00:00.000 | 2025-01-01 00:00:00.000 |
| 7       | 2025-02-16 06:22:01.000 | 2025-02-16 06:22:00.000 | 2025-02-16 00:00:00.000 | 2025-01-01 00:00:00.000 |
| 8       | 2025-02-18 10:45:22.000 | 2025-02-18 10:45:00.000 | 2025-02-18 00:00:00.000 | 2025-01-01 00:00:00.000 |
| 9       | 2025-03-10 12:59:04.000 | 2025-03-10 12:59:00.000 | 2025-03-10 00:00:00.000 | 2025-01-01 00:00:00.000 |
| 10      | 2025-03-16 23:25:15.000 | 2025-03-16 23:25:00.000 | 2025-03-16 00:00:00.000 | 2025-01-01 00:00:00.000 |

**Use Case of DATETRUNC**

```sql
-- USE CASE
SELECT
    DATETRUNC(month, o.CreationTime) AS month_dt,
    COUNT(*) AS total_order
FROM Sales.Orders o
GROUP BY DATETRUNC(month, o.CreationTime)
```

| month_dt                | total_order |
| ----------------------- | ----------- |
| 2025-01-01 00:00:00.000 | 4           |
| 2025-02-01 00:00:00.000 | 4           |
| 2025-03-01 00:00:00.000 | 2           |

###### **EOMONTH**

\- Returns last day of a month
\- Syntax: EOMONTH(date)

```sql
-- EOMONTH
SELECT
    o.OrderID ,
    o.CreationTime,
    EOMONTH(o.CreationTime ) as end_of_month,
    CAST(DATETRUNC(month, o.CreationTime ) as DATE )as start_of_month ROM Sales.Orders o

```

| OrderID | CreationTime            | end_of_month | start_of_month |
| ------- | ----------------------- | ------------ | -------------- |
| 1       | 2025-01-01 12:34:56.000 | 2025-01-31   | 2025-01-01     |
| 2       | 2025-01-05 23:22:04.000 | 2025-01-31   | 2025-01-01     |
| 3       | 2025-01-10 18:24:08.000 | 2025-01-31   | 2025-01-01     |
| 4       | 2025-01-20 05:50:33.000 | 2025-01-31   | 2025-01-01     |
| 5       | 2025-02-01 14:02:41.000 | 2025-02-28   | 2025-02-01     |
| 6       | 2025-02-06 15:34:57.000 | 2025-02-28   | 2025-02-01     |
| 7       | 2025-02-16 06:22:01.000 | 2025-02-28   | 2025-02-01     |
| 8       | 2025-02-18 10:45:22.000 | 2025-02-28   | 2025-02-01     |
| 9       | 2025-03-10 12:59:04.000 | 2025-03-31   | 2025-03-01     |
| 10      | 2025-03-16 23:25:15.000 | 2025-03-31   | 2025-03-01     |

> we use CAST function to change the data type to date. datetrunc return datetime type

###### Part Extraction Use Case

\- **Data Aggregation and Reporting**

```sql
-- How many orders were placed each year?
SELECT
    YEAR(o.OrderDate) as order_date,
    COUNT(*) as no_of_order
FROM Sales.Orders o
GROUP BY YEAR(o.OrderDate );
```

```sql
-- How many orders were placed each month?
SELECT
    DATENAME(month, o.OrderDate) as order_date,
    COUNT(*) as no_of_orders
FROM Sales.Orders o
GROUP BY DATENAME(month, o.OrderDate )
```

| order_date | no_of_orders |
| ---------- | ------------ |
| February   | 4            |
| January    | 4            |
| March      | 2            |

\- **Data Filtering**

```sql
-- Show all order that were placed during the month of february
SELECT
    *
FROM Sales.Orders o
WHERE MONTH(o.OrderDate ) = 2
```

| OrderID | ProductID | CustomerID | SalesPersonID | OrderDate  | ShipDate   | OrderStatus | ShipAddress      | BillAddress  | Quantity | Sales | CreationTime            |
| ------- | --------- | ---------- | ------------- | ---------- | ---------- | ----------- | ---------------- | ------------ | -------- | ----- | ----------------------- |
| 5       | 104       | 2          | 5             | 2025-02-01 | 2025-02-05 | Delivered   |                  |              | 1        | 25    | 2025-02-01 14:02:41.000 |
| 6       | 104       | 3          | 5             | 2025-02-05 | 2025-02-10 | Delivered   | 1792 Belmont Rd. |              | 2        | 50    | 2025-02-06 15:34:57.000 |
| 7       | 102       | 1          | 1             | 2025-02-15 | 2025-02-27 | Delivered   | 136 Balboa Court |              | 2        | 30    | 2025-02-16 06:22:01.000 |
| 8       | 101       | 4          | 3             | 2025-02-18 | 2025-02-27 | Shipped     | 2947 Vine Lane   | 4311 Clay Rd | 3        | 90    | 2025-02-18 10:45:22.000 |

 > Best Practice: Filtering Data using an Integer is faster than using a String. Avoid using DATENAME for filtering data, instead used DATEPART

###### **Function Comparision**

![function-comparison](images/function-comparison.png)

**How to choose which function to use?**

![choose-date-function](images/choose-date-function.png)

###### All Parts

![date-parts-all](images/date-parts-all.png)

**Format & Casting**

###### What is Date Format?

\- format specifier (how date is stored)
![date-format-parts](images/date-format-parts.png)
This whole is data format representation of this value. In world, there are different ways to represent a date.

![date-format-standards](images/date-format-standards.png)

###### **Formatting**

Changing the format of a value from one to another. We are just changing how the value looks like.
![formatting-examples](images/formatting-examples.png)

###### **Casting**

Changing the data type from one to another

###### **FORMAT**

\- Format a date or time value
\- Format(value, format [, culture]), culture is optional
\- culture means format representation based on specific country or region

```sql
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
```

| OrderID | CreationTime            | usa_format | euro_format | MMMM     | MMM | MM  | ddd       | ddd | dd  |
| ------- | ----------------------- | ---------- | ----------- | -------- | --- | --- | --------- | --- | --- |
| 1       | 2025-01-01 12:34:56.000 | 01-01-2025 | 01-01-2025  | January  | Jan | 01  | Wednesday | Wed | 01  |
| 2       | 2025-01-05 23:22:04.000 | 01-05-2025 | 05-01-2025  | January  | Jan | 01  | Sunday    | Sun | 05  |
| 3       | 2025-01-10 18:24:08.000 | 01-10-2025 | 10-01-2025  | January  | Jan | 01  | Friday    | Fri | 10  |
| 4       | 2025-01-20 05:50:33.000 | 01-20-2025 | 20-01-2025  | January  | Jan | 01  | Monday    | Mon | 20  |
| 5       | 2025-02-01 14:02:41.000 | 02-01-2025 | 01-02-2025  | February | Feb | 02  | Saturday  | Sat | 01  |
| 6       | 2025-02-06 15:34:57.000 | 02-06-2025 | 06-02-2025  | February | Feb | 02  | Thursday  | Thu | 06  |
| 7       | 2025-02-16 06:22:01.000 | 02-16-2025 | 16-02-2025  | February | Feb | 02  | Sunday    | Sun | 16  |
| 8       | 2025-02-18 10:45:22.000 | 02-18-2025 | 18-02-2025  | February | Feb | 02  | Tuesday   | Tue | 18  |
| 9       | 2025-03-10 12:59:04.000 | 03-10-2025 | 10-03-2025  | March    | Mar | 03  | Monday    | Mon | 10  |
| 10      | 2025-03-16 23:25:15.000 | 03-16-2025 | 16-03-2025  | March    | Mar | 03  | Sunday    | Sun | 16  |

**Task**

```sql
-- Show Creation time using the following format
-- Day Wed Jan Q1 2025 12:34:56 PM
SELECT
    o.CreationTime,
    'Day ' + FORMAT(o.CreationTime , 'ddd MMM') + ' Q' + DATENAME(quarter,           o.CreationTime ) + ' ' + FORMAT(o.CreationTime , 'yyyy hh:mm:ss tt') AS          'format_creation_time'
FROM Sales.Orders o
```

| CreationTime            | format_creation_time            |
| ----------------------- | ------------------------------- |
| 2025-01-01 12:34:56.000 | Day Wed Jan Q1 2025 12:34:56 PM |
| 2025-01-05 23:22:04.000 | Day Sun Jan Q1 2025 11:22:04 PM |
| 2025-01-10 18:24:08.000 | Day Fri Jan Q1 2025 06:24:08 PM |
| 2025-01-20 05:50:33.000 | Day Mon Jan Q1 2025 05:50:33 AM |
| 2025-02-01 14:02:41.000 | Day Sat Feb Q1 2025 02:02:41 PM |
| 2025-02-06 15:34:57.000 | Day Thu Feb Q1 2025 03:34:57 PM |
| 2025-02-16 06:22:01.000 | Day Sun Feb Q1 2025 06:22:01 AM |
| 2025-02-18 10:45:22.000 | Day Tue Feb Q1 2025 10:45:22 AM |
| 2025-03-10 12:59:04.000 | Day Mon Mar Q1 2025 12:59:04 PM |
| 2025-03-16 23:25:15.000 | Day Sun Mar Q1 2025 11:25:15 PM |

###### **Formatting Use Case**

**Data Aggregation**

```sql
SELECT
    FORMAT(o.OrderDate , 'MMM yy') as Order_Date,
    COUNT(*)
FROM sales.Orders o
GROUP BY FORMAT(o.OrderDate , 'MMM yy')
```

| Order_Date | no_of_order |
| ---------- | ----------- |
| Feb 25     | 4           |
| Jan 25     | 4           |
| Mar 25     | 2           |

**Data Standardization**

![data-standardization](images/data-standardization.png)

###### All Format

**Date Format**

![all-format-date](images/all-format-date.png)

**Number Format**

![all-format-number](images/all-format-number.png)

###### **CONVERT**

\- Convert a date or time value to a different data type(CASTING) & Fomrat the value(FORMATTING)
\- Syntax: CONVERT(data_type, value, [, style ]) where third parameter is optional
\- Example: CONVERT(INT, '124') or CONVERT(VARCHAR, Orderdate, '34')

```sql
SELECT
    o.CreationTime ,
    CONVERT(Date, o.CreationTime ) AS [Datetime To Date CONVERT],
    CONVERT(VARCHAR, o.CreationTime, 32) AS [USA Std. Style:32], -- casting and Formart
    CONVERT(VARCHAR, o.CreationTime , 34) AS [EUROPE STD. Style:34]
FROM Sales.Orders o

```

| CreationTime            | Datetime To Date CONVERT | USA Std. Style:32 | EUROPE STD. Style:34 |
| ----------------------- | ------------------------ | ----------------- | -------------------- |
| 2025-01-01 12:34:56.000 | 2025-01-01               | 01-01-2025        | 01-01-2025           |
| 2025-01-05 23:22:04.000 | 2025-01-05               | 01-05-2025        | 05-01-2025           |
| 2025-01-10 18:24:08.000 | 2025-01-10               | 01-10-2025        | 10-01-2025           |
| 2025-01-20 05:50:33.000 | 2025-01-20               | 01-20-2025        | 20-01-2025           |
| 2025-02-01 14:02:41.000 | 2025-02-01               | 02-01-2025        | 01-02-2025           |
| 2025-02-06 15:34:57.000 | 2025-02-06               | 02-06-2025        | 06-02-2025           |
| 2025-02-16 06:22:01.000 | 2025-02-16               | 02-16-2025        | 16-02-2025           |
| 2025-02-18 10:45:22.000 | 2025-02-18               | 02-18-2025        | 18-02-2025           |
| 2025-03-10 12:59:04.000 | 2025-03-10               | 03-10-2025        | 10-03-2025           |
| 2025-03-16 23:25:15.000 | 2025-03-16               | 03-16-2025        | 16-03-2025           |

![convert-style-table](images/convert-style-table.png)

###### **CAST**

\- Convert a value to specific data type.
\- Syntax: CAST(value as DATA_TYPE)
\- Example: CAST('123' AS INT) or CAST('2026-05-08' AS DATE)
\- We can use CAST function to only change data type we cannot change format.

```sql
SELECT
    o.CreationTime,
    CAST(123 AS VARCHAR) AS [Int to String],
    CAST(o.CreationTime AS DATE) AS [DateTime to Date],
    CAST('2025-08-20' AS DATE) AS [String to Date]
FROM Sales.Orders o
```

| CreationTime            | Int to String | DateTime to Date | String to Date |
| ----------------------- | ------------- | ---------------- | -------------- |
| 2025-01-01 12:34:56.000 | 123           | 2025-01-01       | 2025-08-20     |
| 2025-01-05 23:22:04.000 | 123           | 2025-01-05       | 2025-08-20     |
| 2025-01-10 18:24:08.000 | 123           | 2025-01-10       | 2025-08-20     |
| 2025-01-20 05:50:33.000 | 123           | 2025-01-20       | 2025-08-20     |
| 2025-02-01 14:02:41.000 | 123           | 2025-02-01       | 2025-08-20     |
| 2025-02-06 15:34:57.000 | 123           | 2025-02-06       | 2025-08-20     |
| 2025-02-16 06:22:01.000 | 123           | 2025-02-16       | 2025-08-20     |
| 2025-02-18 10:45:22.000 | 123           | 2025-02-18       | 2025-08-20     |
| 2025-03-10 12:59:04.000 | 123           | 2025-03-10       | 2025-08-20     |
| 2025-03-16 23:25:15.000 | 123           | 2025-03-16       | 2025-08-20     |

###### **FORMAT VS CONVERT VS CAST**

![format-vs-convert-vs-cast](images/format-vs-convert-vs-cast.png)
