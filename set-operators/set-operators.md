# Set Operators

← Previous: [Joins](../joins/joins.md) | [Index](../README.md) | Next → [Practice (sql/)](../sql)

## Syntax of Set Operator
![set-operator-syntax](images/set-operator-syntax.png)

## Rules of Set Operator
1) SQL Clauses 
    - SET Operators can be used almost in all clauses WHERE | JOIN | GROUP BY | HAVING
    - ORDER BY is allowed only once at the end of the query
	![set-operator-clauses](images/set-operator-clauses.png)
	
2) Number of columns
	- The number of columns in each query must be the same.
3)  Data Types
	- Data types of columns in each query must be compatible
4) Order of Columns 
	- The order of the columns in each query must be the same
5) Column Aliases 
	- The column names in the result set are determined by the column name specified in the first query.
6) Correct Columns
	- Even if all rules are met and SQL shows no errors, the result may be incorrect.
	- Incorrect columns selections leads to inaccurate results.

![set-operator-rules](images/set-operator-rules.png)


## Union Types
### UNION
\- Returns all distinct rows from both queries.
\- Removes duplicate rows from the result
![union-distinct](images/union-distinct.png)

Since we have mary and kevin in both set so union will return only one in the result.
![union-result](images/union-result.png)

**Example**
```sql
-- Combine the data from employess and customer into one table
SELECT 
	e.FirstName,
	e.LastName 
FROM Sales.Employees e 
UNION 
SELECT 
	c.FirstName,
	c.LastName 
FROM Sales.Customers c
```
The order of queries in a UNION operation does not affect the result.  

**How SQL execute the UNION**
![union-execution](images/union-execution.png)

### UNION ALL
\- Return all rows from both queries, including duplicates
\- Only set operator that doesn't remove duplicate and return result as it is.

**UNION ALL VS UNION**
- UNION ALL is generally faster than UNION because it doesn't have to extra step of removing duplicate. So, If you're confident there's no duplicate, use UNION ALL to get better performance.
- Use UNION ALL to find duplicates and quality issues.

![union-all-result](images/union-all-result.png)

Union all is gonna return all from customers and all from employees. and kevin and mary is twice in the output.

**Example**
```sql
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
```

**How SQL execute the UNION ALL**
![union-all-execution](images/union-all-execution.png)
### EXCEPT
\- Return all distinct rows from the first query that are not found in the second query
\- It is only one where the order of the queries affect the final result.

![except-result](images/except-result.png)

![except-order-matters](images/except-order-matters.png)

We get Jossef, mark and anna in the result set because they are not in employee set. and kevin and mary are not included in the result set because they are not unique and also member of second set employee. So, we get only three customer as a result.

**Example**
```sql
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
```

**How SQL execute the EXCEPT**
![except-execution](images/except-execution.png)
It doesn't put any data from second query or set which is customer here. it only use for lookup.

![except-order-result](images/except-order-result.png)
The order of query is important because we get different result if order is different.
### INTERSECT
\- Returns only the rows that are common in both queries.
![intersect-result](images/intersect-result.png)

**Example**
```sql
-- find employees who are also customers
SELECT 
	e.FirstName ,
	e.LastName 
FROM Sales.Employees e 
INTERSECT 
SELECT 
	c.FirstName,
	c.LastName 
FROM Sales.Customers c 
```

**How SQL execute the INTERSECT**
![intersect-execution](images/intersect-execution.png)
## Union Use Cases
### **Combine Information**
\- Combine similar information before analyzing the data

**Example**
![union-use-case-before](images/union-use-case-before.png)
If we want to combine information to generate report. we can do this way but we have too many single sql query and we may encounter inconsistent data in the report. Instead we can use set operators to combine the all these table data into one single table.

**Example with set operators**
![union-use-case-set-operators](images/union-use-case-set-operators.png)
Here we have one single big table and one sql query.

**Example 2 with set operators**
![union-use-case-reporting](images/union-use-case-reporting.png)
