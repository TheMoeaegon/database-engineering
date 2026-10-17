-- no join

-- Retrieve all data from customers and orders as separate results
SELECT *
FROM customers c ;

SELECT *
FROM orders o ;

-- INNER JOIN

-- Get all customers along with their orders, but only for customers who have placed an order 
SELECT 
	c.id,
	c.first_name ,
	o.order_id ,
	o.sales 
FROM customers AS c 
INNER JOIN orders AS o 
	ON c.id = o.customer_id;


-- LEFT JOIN

-- Get all customers along with their orders, including those without orders.
SELECT *
FROM customers c 
LEFT JOIN orders o 
	ON c.id = o.customer_id ;

