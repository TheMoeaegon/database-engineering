select * from dbo. customers c ;

SELECT * FROM  dbo.orders o ;

SELECT 
	c.first_name ,
	c.country ,
	c.score 
FROM dbo.customers c ;

SELECT *
FROM dbo.customers c 
WHERE c.score <> 0;

SELECT 
	c.first_name,
	c.country 
FROM dbo.customers c 
WHERE c.country = 'Germany';

SELECT *
FROM  dbo.customers c 
ORDER BY c.score DESC ;

SELECT * 
FROM dbo.customers c 
ORDER BY c.score ASC ;


SELECT *
FROM dbo.customers c 
ORDER BY 
	c.country ASC,
	c.score DESC;

SELECT 
FROM dbo.customers c;

SELECT 
	c.country,
	SUM(score) as total_score
FROM dbo.customers c 
GROUP BY c.country ;


SELECT 
	c.country, 
	SUM(score) as total_score,
	COUNT(*) as number_of_customers
FROM dbo.customers c 
GROUP BY c.country ;


SELECT  
	c.country ,
	AVG(score) as avg_score
FROM dbo.customers c 
WHERE c.score != 0
GROUP BY c.country 
HAVING AVG(score) > 430;


SELECT DISTINCT 
	c.country 
FROM dbo.customers c;


SELECT TOP 3
	*
FROM dbo.customers c ;

SELECT TOP 3 *
FROM dbo.customers c 
ORDER BY score DESC;


SELECT TOP 2 *
FROM dbo.customers c
ORDER BY score ASC;

SELECT TOP 2 
	*
FROM dbo.orders o 
ORDER BY o.order_date DESC;


-- Data Definiton Lanauge

/*
--Create
CREATE TABLE persons (
	id INT NOT NULL,
	person_name varchar(200) NOT NULL ,
	birth_date DATE ,
	phone varchar(15) NOT NULL,
	CONSTRAINT pk_persons PRIMARY KEY (id)
);

--Alter

-- Add column
ALTER TABLE dbo.persons 
ADD email VARCHAR(100) NOT NULL ;

-- Drop column
ALTER TABLE dbo.persons
DROP COLUMN phone;

-- Drop
DROP TABLE persons; 


SELECT * 
FROM dbo.persons p ;
*/

-- Data Manipulation Language (Modify (manipulate) your data

-- INSERT
INSERT INTO customers (id, first_name, country, score)
VALUES (6, 'Anna', 'USA', NULL),
		(7, 'Sam', 'NULL', 100),
		(8, 'USA', 'Max', NULL),
		(9, 'Andreas', 'Germany', NULL),
		(10, 'Sahara', NULL, NULL);

--Insert with select
INSERT INTO persons (id, person_name, birth_date, phone)
SELECT 
	c.id ,
	c.first_name ,
	NULL,
	'Unknown'
FROM customers c ;


-- Update
UPDATE customers
SET score = 0
WHERE id = 6;

--change the score of customer with id 10 to 0 and update the country to 'UK'
SELECT * FROM customers c 
WHERE id = 10;

UPDATE customers 
SET country = 'UK',
	score = 0
WHERE id = 10; -- Can update multiple column

-- update all customers with a NULL score by setting their score to 0
UPDATE customers 
SET score = 0
WHERE score IS  NULL;

SELECT * FROM customers c 
WHERE c.score IS NULL ;

-- DELETE

-- delete all customer with an ID greater than 5
DELETE FROM customers 
WHERE id > 5;

SELECT * 
FROM customers c 
WHERE id > 5;

-- delete all data from persons table
DELETE FROM persons ;
TRUNCATE TABLE persons;

-- Comparision operators

-- operators
-- Retrieve all customers from Germany
SELECT * 
FROM customers c 
WHERE c.country = 'Germany';

-- Retrieve all customers who are not from Germany
SELECT *
FROM customers c 
WHERE c.country <> 'Germany'; -- !=

-- Retrieve all customers with a score greater than 500
SELECT *
FROM customers c 
WHERE c.score  > 500;

-- Retrieve all customers with a score of 500 or more
SELECT * 
FROM customers c 
WHERE c.score >= 500;

-- Retrieve all customers with a score less than 500
SELECT *
FROM customers c 
WHERE c.score < 500;

-- Retrieve all customers with a score of 500 or less
SELECT * 
FROM customers c 
WHERE c.score <= 500;

-- LOGICAL Operators

--Retrieve all customers who are from the USA AND have a score greater than 500
SELECT *
FROM customers c 
WHERE c.country = 'USA' AND c.score > 500;

-- Retrieve all customers who are either from the USA OR have a score greater than 500
SELECT *
FROM customers c 
where c.country = 'USA' OR c.score > 500;

 -- Retrieve all customers with a score NOT less than 500
SELECT *
FROM customers c 
WHERE NOT score < 500;

-- RANGE OPERATORS
-- Retrieve all customers whose score falls in the range between 100 and 500
SELECT * 
FROM customers c 
WHERE c.score BETWEEN 100 AND 500;

SELECT *
FROM customers c 
WHERE c.score <= 500 AND c.score >= 100; -- using comparision operator instead of between

-- MEMBERSHIP Operator (IN, NOT IN)

-- Retrieve all customers from either Germany OR USA
SELECT *
FROM customers c 
WHERE c.country IN ('Germany', 'USA');

-- we can slove using logical and comparision operator
SELECT *
FROM customers c 
WHERE c.country = 'Germany' OR c.country = 'USA';

SELECT * 
FROM customers c 
WHERE c.country NOT IN ('Germany', 'USA');

-- SEARCH Operators (LIKE)
SELECT *
FROM customers c 
WHERE c.first_name LIKE 'M%';

SELECT *
FROM customers c 
WHERE c.first_name LIKE '%n';

-- find all customers whose first name contains 'r'
SELECT *
FROM customers c 
WHERE c.first_name LIKE  '%r%';

-- find all customers whose first name has 'r' in the third position
SELECT *
FROM customers c 
WHERE c.first_name LIKE '__r%';









