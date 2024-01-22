-- ASSIGNMENT 1

-- Table need to work from
select * from dbo.Products;

-- Question 1
select ProductID, ProductName, UnitPrice from dbo.Products 
where UnitPrice < 20;

-- Question 2
select ProductID, ProductName, UnitPrice from dbo.Products 
where UnitPrice BETWEEN 15 AND 25;

-- Question 3
SELECT ProductName, UnitPrice FROM dbo.Products
WHERE UnitPrice > (select avg(UnitPrice) from dbo.Products);

/*select ProductName, UnitPrice from dbo.Products 
where UnitPrice > AVG(UnitPrice); 
select avg(UnitPrice) from dbo.Products; */

-- Question 4
SELECT TOP 10 ProductName, UnitPrice FROM dbo.Products
ORDER BY UnitPrice DESC;

-- Question 5
select sum(CASE WHEN discontinued = 1 then 1 else 0 END) AS Discontinued,sum(CASE WHEN discontinued = 0 then 1 else 0 END) AS 'Current' from dbo.Products;

SELECT Count(ProductName)
FROM Products
GROUP BY Discontinued;

-- Question 6
select ProductName, UnitsOnOrder, UnitsInStock from dbo.Products
where UnitsInStock < UnitsOnOrder;
