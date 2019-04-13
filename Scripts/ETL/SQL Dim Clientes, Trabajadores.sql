--DIMENSION EMPLEADOS O TRABAJADORES
SELECT	EmployeeID,
		CONCAT(FirstName, ' ', LastName) As Nombre_Empleado, 
		City, 
		Country  
FROM Employees;

--DIMENSION EMPLEADOS
SELECT	CustomerID,
		CompanyName,
		City,
		Country 
FROM Customers;



