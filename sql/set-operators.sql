
-- UNION
-- Combine the data from employess and customer into one table

SELECT 
	c.FirstName ,
	c.LastName 
FROM Sales.Customers c
UNION 
SELECT 
	e.FirstName ,
	e.LastName 
FROM Sales.Employees e 

-- UNION ALL
-- Combine the data from employess and customer into one table, including duplicates.

SELECT 
	e.FirstName ,
	e.LastName 
FROM Sales.Employees e 
UNION ALL
SELECT 
	c.FirstName ,
	c.LastName 
FROM Sales.Customers c 

-- EXCEPT

-- find employess who are not customer at the same time
SELECT 
	e.FirstName ,
	e.LastName 
FROM Sales.Employees e 
EXCEPT 
SELECT 
	c.FirstName ,
	c.LastName 
FROM Sales.Customers c 

-- INTERSECT

-- find employees who are also customers
SELECT 
	e.FirstName,
	e.LastName 
FROM Sales.Employees e 
INTERSECT 
SELECT 
	c.FirstName,
	c.LastName 
FROM Sales.Customers c 

-- Task 1
-- Orders are stored in separate table (Orders and Order Archive). Combine all orders into one report without duplicates.
SELECT
	'Orders' AS SourceTable,
	OrderID,
	ProductID, 
	CustomerID, 
	SalesPersonID,
	OrderDate, 
	ShipDate, 
	OrderStatus, 
	ShipAddress,
	BillAddress, 
	Quantity, 
	Sales, 
	CreationTime
FROM Sales.Orders
UNION 
SELECT 
	'OrderArchive' AS SourceTable,
	OrderID,
	ProductID, 
	CustomerID, 
	SalesPersonID,
	OrderDate, 
	ShipDate, 
	OrderStatus, 
	ShipAddress,
	BillAddress, 
	Quantity, 
	Sales, 
	CreationTime
FROM Sales.OrdersArchive oa
ORDER BY OrderID;


