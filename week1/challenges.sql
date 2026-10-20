-- Get all customer along with their orders, but only for customers who have place an order.
SELECT *
FROM customers c 
LEFT JOIN orders o 
	ON c.id = o.customer_id 
WHERE o.customer_id IS NOT NULL;