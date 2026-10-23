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



