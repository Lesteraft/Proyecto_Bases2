-------------SQL DIMENSION EMPLEADOS O TRABAJADORES

SELECT	EmployeeID,
		CONCAT(FirstName, ' ', LastName) As Nombre_Empleado, 
		City, 
		Country  
FROM Employees;

-------------------------------------------


-------------SQL DIMENSION EMPLEADOS

SELECT	CustomerID,
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
SELECT	ROW_NUMBER() OVER(ORDER BY OrderDate ASC) TimeID,
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
GROUP BY	Orders.OrderID, 
			Orders.EmployeeID, 
			Shippers.ShipperID, 
			Products.ProductID,
			OrderDate,
			CONVERT(DATE,OrderDate), 
			DATEPART(YEAR, OrderDate), 
			DATEPART(MONTH, OrderDate), 
			DATEPART(WEEK, OrderDate), 
			DATEPART(QUARTER, OrderDate), 
			DATENAME(WEEKDAY, OrderDate);

-------------------------------------------


-------------SQL TABLA HECHOS

Select	[orders].OrderID,
		[orders].OrderID as FechaID,
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