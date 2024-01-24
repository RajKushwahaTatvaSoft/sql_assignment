-- Assignment 4

-- Question 1

ALTER PROCEDURE [dbo].[CalculateAverageFreight]
    @CustomerID nchar(5),
	@OUTPUT money OUTPUT
AS
BEGIN
    DECLARE @AverageFreight money;

    SELECT @AverageFreight = AVG(Freight)
    FROM Orders
    WHERE CustomerID = @CustomerID;
	SELECT @OUTPUT = @AverageFreight;
    RETURN @AverageFreight;
END;


ALTER TRIGGER CheckFreight
ON Orders
INSTEAD OF INSERT, UPDATE
AS
BEGIN
    DECLARE @CustomerID nchar(5);
    DECLARE @Freight money;

    SELECT @CustomerID = CustomerID, @Freight = Freight
    FROM inserted;

    DECLARE @AverageFreight money;
    print @AverageFreight
    EXEC dbo.CalculateAverageFreight @CustomerID , @AverageFreight OUTPUT;
    PRINT @AverageFreight

    IF @Freight > @AverageFreight
    BEGIN
        RAISERROR('Freight cannot exceed the average freight for the specified customer.',16,1);
    END
	ELSE
	BEGIN
		INSERT INTO Orders (CustomerID,EmployeeID,OrderDate,RequiredDate,
	ShippedDate,ShipVia,Freight,ShipName,ShipAddress,
	ShipCity,ShipRegion,ShipPostalCode,ShipCountry)
		SELECT CustomerID,EmployeeID,OrderDate,RequiredDate,
	ShippedDate,ShipVia,Freight,ShipName,ShipAddress,
	ShipCity,ShipRegion,ShipPostalCode,ShipCountry
		FROM inserted;
	END
END


declare @money decimal(8,2)
execute CalculateAverageFreight 'ANATR', @money output
print @money

select * from orders
where customerID = 'ANATR'


-- Question 2

ALTER PROCEDURE [Sales by Country Employees]
AS
BEGIN	SELECT e.EmployeeID, e.FirstName + ' ' + e.LastName AS EmployeeName, c.Country, SUM(Quantity * UnitPrice) AS 'Total Sales' FROM Employees e	JOIN Orders o ON e.EmployeeID = o.EmployeeID	JOIN Customers c ON c.CustomerID = o.CustomerID	JOIN [Order Details] od ON o.OrderID = od.OrderID	GROUP BY e.EmployeeID, e.FirstName, e.LastName, c.Country	ORDER BY c.Country, e.EmployeeID;
END

EXEC [Sales by Country Employees];

-- Question 3
ALTER PROCEDURE [dbo].[Get Sales By Year]
	@BeginningDate Date
AS
BEGIN
	SET NOCOUNT ON;
	Select * from Orders
	WHERE Orders.ShippedDate BETWEEN @BeginningDate AND DATEADD(YEAR, 1, @BeginningDate)
	ORDER BY Orders.ShippedDate;

END

EXEC [Get Sales By Year] @BeginningDate = '1997-01-01';

-- Question 4

ALTER PROCEDURE [dbo].[Sales By Category]
    @CategoryName nvarchar(15), @OrdYear nvarchar(4) = '1998'
AS
BEGIN
IF @OrdYear != '1996' AND @OrdYear != '1997' AND @OrdYear != '1998'
BEGIN
	SELECT @OrdYear = '1998'
END

SELECT ProductName,
	TotalPurchase=ROUND(SUM(CONVERT(decimal(14,2), OD.Quantity * (1-OD.Discount) * OD.UnitPrice)), 0)
FROM [Order Details] OD, Orders O, Products P, Categories C
WHERE OD.OrderID = O.OrderID
	AND OD.ProductID = P.ProductID
	AND P.CategoryID = C.CategoryID
	AND C.CategoryName = @CategoryName
	AND SUBSTRING(CONVERT(nvarchar(22), O.OrderDate, 111), 1, 4) = @OrdYear
GROUP BY ProductName
ORDER BY ProductName

END

exec [dbo].[SalesByCategory] @CategoryName = 'Beverages';

-- Question 5

ALTER procedure [dbo].[Ten Most Expensive Products] 
AS
BEGIN
	SET ROWCOUNT 10
	SELECT Products.ProductName AS TenMostExpensiveProducts, Products.UnitPrice
	FROM Products
	ORDER BY Products.UnitPrice DESC
END

exec [dbo].[Ten Most Expensive Products];

-- Question 6

ALTER PROCEDURE [Insert Customer Order Details]
	@CustomerID nchar(5) , @ProductID int, @Quantity int, @Discount real
AS

BEGIN
	
	SET NOCOUNT ON;

	INSERT INTO [Order Details] (OrderID, ProductID, Quantity, Discount)
	VALUES ( (Select top 1 OrderID from Orders where Orders.CustomerID = @CustomerID order by Orders.OrderDate DESC), @ProductID, @Quantity, @Discount );

END

exec [dbo].[Insert Customer Order Details] @CustomerID = 'ANATR', @ProductID = 7, @Quantity = 3, @discount = 0.05;

select * from [Order Details]
order by OrderID;

-- Question 7

ALTER PROCEDURE [Update Customer Order Details]
	@OrderID int , @ProductID int, @Quantity int, @Discount real
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	UPDATE [Order Details]
	SET ProductID = @ProductID, Quantity = @Quantity, Discount = @Discount
	WHERE OrderID = @OrderID;

END

exec [dbo].[Update Customer Order Details] @OrderID = 11077, @ProductID = 1, @Quantity = 3, @discount = 0.05;