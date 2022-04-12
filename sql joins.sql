/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
SELECT products.Name, products.CategoryID FROM Products
JOIN categories
ON products.CategoryID = categories.CategoryID
WHERE products.CategoryID = 1;
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
 SELECT products.Name, products.Price, reviews.Rating FROM products
 JOIN reviews
 WHERE reviews.rating = 5;
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
select employees.firstname, employees.LastName, sum(sales.Quantity) AS total from sales
INNER JOIN employees ON employees.EmployeeID=sales.EmployeeID
group by employees.EmployeeID
ORDER BY total desc
limit 2;

/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT d.Name as 'Department Name', c.name as 'Category Name' from departments AS d
INNER JOIN categories as c ON c.DepartmentID = d.DepartmentID
WHERE c.name = 'Appliances' OR c.name = 'Games';

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
SELECT products.Name, sum(sales.Quantity) as 'Units Sold', sum(sales.Quantity*sales.PricePerUnit) as 'Total Sales' FROM products
JOIN sales ON sales.ProductID = products.ProductID
WHERE sales.ProductID = 97;
/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT products.name, reviews.Reviewer, reviews.Rating, reviews.Comment FROM reviews
Join products ON products.ProductID=reviews.ProductID
WHERE reviews.Rating = 1 AND products.Name = 'Visio TV';

-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return the employeeID, the employee's first and last name, the name of each product, how many of that product they sold */
SELECT employees.EmployeeID, employees.FirstName, employees.LastName, products.Name, sum(sales.Quantity) as 'Total' from sales
JOIN employees ON sales.EmployeeID=employees.EmployeeID
JOIN products on products.ProductID = sales.ProductID
GROUP BY employees.EmployeeID, products.ProductID
order by employees.firstname;