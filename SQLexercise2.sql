-- joins: select all the computers from the products table:
 -- using the products table and the categories table, return the product name and the category name
 SELECT p.name as product, c.name as category FROM PRODUCTS AS p
 INNER JOIN categories AS c ON c.categoryID AND p.categoryID
 WHERE c.categoryID = 1;
 
-- joins: find all product names, product prices, and products ratings that have a rating of 5
 SELECT p.NAME, p.PRICE, r.Rating FROM PRODUCTS AS p
 INNER JOIN REVIEWS AS r ON r.PRODUCTID = p.PRODUCTID
 WHERE r.RATING = 5;
 
 
-- joins: find the employee with the most total quantity sold.  use the sum() function and group by
SELECT e.FirstName, e.LastName, sum(s.Quantity) AS total FROM sales AS s
INNER JOIN employees AS e ON e.EmployeeID = s.EmployeeID
GROUP BY e.EmployeeID
ORDER BY total DESC 
LIMIT 2;



-----------------------------------------------------------------
-- joins: find the name of the department, and the name of the category for Appliances and Games
SELECT c.name AS 'caterogry name', d.Name AS 'department name' FROM departments as d
INNER JOIN categories AS c ON c.DepartmentID = d.DepartmentID
WHERE c.name = 'appliances' OR c.name = 'games';


-- joins: find the product name, total # sold, and total price sold,
-- for Eagles: Hotel California --You may need to use SUM()
SELECT P.NAME, SUM(S.Quantity) AS 'total price', SUM(S.Quantity * S.PricePerUnit) AS 'total sold' FROM products as p
INNER JOIN sales AS s ON S.ProductID = p.ProductID
WHERE p.ProductID = 97;

-- joins: find Product name, reviewer name, rating, and comment on the Visio TV.
-- (only return for the lowest rating!)
SELECT p.name, r.Reviewer, r.Rating, r.Comment FROM products AS p
INNER JOIN  reviews AS r ON r.ProductID = p.ProductID
WHERE p.ProductID = 857 AND r.Rating = 1;




-------------------------------------------- Extra - May be difficult
-- /* Your goal is to write a query that serves as an employee sales report.
-- This query should return the employeeID, the employee's first and last name, the name of each product, how many of that product they sold */
SELECT e.EmployeeID, e.FirstName, e.LastName, p.name, sum(s.Quantity) AS 'total sold', s.Date FROM sales AS s
INNER JOIN employees AS e ON e.EmployeeID = s.EmployeeID
INNER JOIN products AS p ON p.ProductID = s.ProductID
GROUP BY e.EmployeeID, p.ProductID, s.Date;