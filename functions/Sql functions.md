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
**DAY**
\- Return the day from Date
\- Syntax: DAY(date)

**MONTH**
\- Return the month from Date
\- Syntax: MONTH(date)

**YEAR**
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

| `DATETRUNC(minute, date)` | `DATETRUNC(hour, date)` |
| --- | --- |
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
