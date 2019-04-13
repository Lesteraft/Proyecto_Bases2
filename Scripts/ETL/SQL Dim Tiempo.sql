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