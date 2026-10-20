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
SELECT 
	c.id ,
	c.first_name ,
	o.order_id ,
	o.sales 
FROM customers c 
LEFT JOIN orders o 
	ON c.id = o.customer_id ;

-- Get all customers along with their orders, including orders without matching customers.
SELECT 
	c.id ,
	c.first_name ,
	o.order_id,
	o.sales 
FROM customers c 
RIGHT JOIN orders o 
	ON c.id = o.customer_id;

SELECT 
	c.id,
	c.first_name ,
	o.order_id ,
	o.sales 
FROM orders o 
LEFT JOIN customers c 
	ON o.customer_id = c.id;

-- FULL JOIN

-- Get all customers and all orders, even if there's no match
SELECT 
	c.id ,
	c.first_name ,
	o.order_id ,
	o.sales 
FROM customers c 
FULL JOIN orders o 
	ON c.id = o.customer_id ;

-- LEFT ANTI JOIN

-- Get all customers who haven't placed any order.
SELECT 
	c.id ,
	c.first_name ,
	o.order_id ,
	o.sales 
FROM customers c 
LEFT JOIN orders o 
	ON c.id = o.customer_id
WHERE o.customer_id is NULL;

-- RIGHT ANTI JOIN
-- Get all orders without matching customers
SELECT 
	c.id ,
	c.first_name ,
	o.order_id ,
	o.sales 
FROM customers c 
RIGHT JOIN orders o 
	ON c.id = o.customer_id
WHERE c.id IS NULL;

-- using left join
SELECT 
	c.id ,
	c.first_name ,
	o.order_id ,
	o.sales 
FROM orders o 
LEFT JOIN customers c 
	ON o.customer_id = c.id 
WHERE c.id IS NULL;

-- FULL ANTI JOIN

-- find customers without orders and orders without customers
SELECT 
	c.id,
	c.first_name ,
	o.order_id ,
	o.sales 
FROM customers c 
FULL JOIN orders o 
	ON c.id = o.customer_id
WHERE o.customer_id IS NULL OR c.id IS NULL;

-- CROSS JOIN

-- Generate all possible combinations of customers and orders
SELECT 
	*
FROM customers c 
CROSS JOIN orders o;


