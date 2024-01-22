select sum(CASE WHEN discontinued = 1 then 1 else 0 END) AS Discontinued,sum(CASE WHEN discontinued = 0 then 1 else 0 END) AS 'Current' from dbo.Products;

SELECT Count(ProductName)
FROM Products
GROUP BY Discontinued;