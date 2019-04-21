-------------SQL DIMENSION EMPLEADOS O TRABAJADORES

SELECT	EmployeeID,
		CONCAT(FirstName, ' ', LastName) As Nombre_Empleado, 
		City, 
		Country  
FROM Employees;

-------------------------------------------


-------------SQL DIMENSION CLIENTES

SELECT	ROW_NUMBER() OVER(ORDER BY CustomerID ASC) as ClienteID,
		CustomerID,
		CompanyName,
		City,
		Country 
FROM Customers;

-------------------------------------------


-------------SQL DIMENSION LUGARES

SELECT	TerritoryID,
		TerritoryDescription	
From Territories;

--------------------------------------------


-------------SQL DIMENSION PRODUCTOS

SELECT ProductID,
      ProductName
  FROM Products;
  --CORRECION CAMPOS SOLICITADOS

-------------------------------------------


-------------SQL DIMENSION TIEMPO

--Se obtine la fecha por detalle de orden que corresponde a la fecha por producto vendido.
SELECT	[orders].OrderID TimeID,
		CONVERT(DATE, OrderDate) FechaOrden, 
		DATEPART(YEAR, OrderDate) Año, 
		DATEPART(MONTH, OrderDate) Mes,
		DATEPART(QUARTER, OrderDate) Trimestre,
		DATEPART(WEEK, OrderDate) Semana, 
		DATENAME(WEEKDAY, OrderDate) Dia
FROM Orders 
INNER JOIN [Order Details] 
ON Orders.OrderID=[Order Details].OrderID 
INNER JOIN Shippers 
ON Orders.ShipVia=Shippers.ShipperID 
INNER JOIN Products 
ON Products.ProductID=[Order Details].ProductID
WHERE [ORDERS].OrderID = 10248
GROUP BY	Orders.OrderID,
			CONVERT(DATE,OrderDate), 
			DATEPART(YEAR, OrderDate), 
			DATEPART(MONTH, OrderDate), 
			DATEPART(WEEK, OrderDate), 
			DATEPART(QUARTER, OrderDate), 
			DATENAME(WEEKDAY, OrderDate);


SELECT ORDERS.ORDERID FROM ORDERS
INNER JOIN [Order Details]
ON [ORDERS].OrderID = [Order Details].OrderID
GROUP BY ORDERS.OrderID;
-------------------------------------------


-------------SQL TABLA HECHOS

Select	ROW_NUMBER() OVER(ORDER BY [orders].OrderID ASC) as HechosID,
		[orders].OrderID,
		[orders].OrderID as TimeID,
		[Order Details].ProductID,
		[Employees].EmployeeID,
		[EmployeeTerritories].TerritoryID,
		[Customers].CustomerID,
		round(SUM([Order Details].Quantity*[Order Details].UnitPrice*(1-[Order Details].Discount)), 2) VENTA_TOTAL
FROM [ORDERS]
INNER JOIN [Order Details] 
ON [Order Details].OrderID = [ORDERS].OrderID
INNER JOIN [Employees]
ON [Employees].EmployeeID = [ORDERS].EmployeeID
INNER JOIN [EmployeeTerritories]
ON [EmployeeTerritories].EMPLOYEEID = [EMPLOYEES].EMPLOYEEID
INNER JOIN [CUSTOMERS] 
ON [CUSTOMERS].CustomerID = [Orders].CustomerID
GROUP BY	[orders].OrderID,
			[Order Details].ProductID,
			[Employees].EmployeeID,
			[EmployeeTerritories].TerritoryID,
			[Customers].CustomerID;



SELECT * FROM ORDERS WHERE OrderID = 10248;

