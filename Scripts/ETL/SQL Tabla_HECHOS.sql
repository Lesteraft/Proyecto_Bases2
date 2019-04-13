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