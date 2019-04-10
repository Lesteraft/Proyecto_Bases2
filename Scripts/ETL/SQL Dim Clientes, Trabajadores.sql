--DIMENSION EMPLEADOS O TRABAJADORES
SELECT	EmployeeID,
		CONCAT(FirstName, ' ', LastName) As Nombre_Empleado, 
		City, 
		Country  
FROM Employees;

--DIMENSION EMPLEADOS
SELECT	CustomerIDNumeric,
		CustomerID,
		CompanyName,
		City,
		Country 
FROM Customers;

ALTER TABLE Customers ADD CustomerIDNumeric Integer IDENTITY(1,1) CONSTRAINT ID_Customer UNIQUE (CustomerID, CustomerIDNumeric); 
--Agregue esta columna ya que el id de empleado no es un numero.


