SELECT * FROM Employees;

--PROCEDIMIENTO ALMACENADO PARA ASIGNAR EMPLEADOS
GO
CREATE OR ALTER PROC Insertar @count INT = 0, @option INT = 0
AS
	WHILE @count < 41 
	BEGIN
		SET @option = ROUND(((5-1) * RAND() + 1), 0);
		INSERT INTO Employees (LastName, FirstName, Title, TitleOfCourtesy, BirthDate, HireDate, [Address], City, Region, PostalCode, Country, HomePhone, Extension, Photo, Notes, ReportsTo, PhotoPath)
		VALUES ('APELLIDO'+CONVERT(varchar(2), @count+10),'NOMBRE'+CONVERT(varchar(2), @count+10), 'Sales Man', 'Mr',convert(datetime,'18-06-18 10:34:09 PM',5), convert(datetime,'18-06-18 10:34:09 PM',5), 'Col Kennedy', 'Tegucigalpa', 'WA', 11011, 'HN', '123456789', 4567, 'PHOTO','Graduated', 2, 'http://accweb/emmployees/davolio.bmp');
		SET @count =  @count + 1;
	END;
GO

EXECUTE Insertar;

DBCC CHECKIDENT ('Employees', RESEED, 9); --ASIGNAR UN NUEVO VALOR A LA PROPIEDAD IDENTITY
SELECT IDENT_CURRENT ('EMPLOYEES') AS Current_Identity;  --SIRVE PARA VER EL VALOR ACTUAL DE LA PROPIEDAD IDENTITY
DELETE FROM Employees WHERE EmployeeID > 9;