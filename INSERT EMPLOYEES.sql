SELECT * FROM Employees;

--PROCEDIMIENTO ALMACENADO PARA ASIGNAR EMPLEADOS
GO
CREATE OR ALTER PROC Insertar 
	@count INT = 0, 
	@option INT = 0, 
	@lugar varchar(50) = 'Francisco Morazan', 
	@ciudad varchar(50) = 'Tegucigalpa', 
	@cargo varchar(20) = 'Sales Man',
	@nombre varchar(10) = 'Pedro',
	@apellido varchar(20) = 'Morazan'
AS
	WHILE @count < 41 
	BEGIN
		SET @option = ROUND(((10-1) * RAND() + 1), 0);
		SET @nombre = CASE 
						when @option = 1 then 'Ramon' 
						when @option = 2 then 'Jair'
						when @option = 3 then 'Emilzon'
						when @option = 4 then 'Laura'
						when @option = 5 then 'Joaquin' 
						when @option = 6 then 'Maria'
						when @option = 7 then 'Carlos'
						when @option = 8 then 'Lester'
						when @option = 9 then 'Oscar'
						when @option = 10 then 'German'
						else 'Raul'

					END;
		SET @option = ROUND(((10-1) * RAND() + 1), 0);

		SET @apellido = CASE 
						when @option = 1 then 'Ramirez' 
						when @option = 2 then 'Perez'
						when @option = 3 then 'Obama'
						when @option = 4 then 'Trump'
						when @option = 5 then 'Jackson' 
						when @option = 6 then 'Hernandez'
						when @option = 7 then 'Matamoros'
						when @option = 8 then 'Alvarez'
						when @option = 9 then 'Alvarado'
						when @option = 10 then 'Tejada'
						else 'Zelaya'

					END;
		SET @option = ROUND(((5-1) * RAND() + 1), 0);
		SET @lugar = CASE 
						when @option = 1 then 'Francisco Morazan' 
						when @option = 2 then 'Cortes'
						when @option = 3 then 'Atlantida'
						when @option = 4 then 'Comayagua'
						else 'El Paraiso'

					END;
		SET @ciudad = CASE 
						when @option = 1 then 'Tegucigalpa' 
						when @option = 2 then 'San Pedro Sula'
						when @option = 3 then 'Ceiba'
						when @option = 4 then 'Siguatepeque'
						else 'Danli'

					END;

		SET @cargo = CASE 
						when @option = 1 then 'Sales Man' 
						when @option = 2 then 'Operative Manager'
						when @option = 3 then 'concierge'
						when @option = 4 then 'Security Man'
						else 'RRHH'

					END;
		INSERT INTO Employees (LastName, FirstName, Title, TitleOfCourtesy, BirthDate, HireDate, [Address], City, Region, PostalCode, Country, HomePhone, Extension, Photo, Notes, ReportsTo, PhotoPath)
		VALUES (@apellido, @nombre, @cargo, 'Mr',convert(datetime,'18-06-18 10:34:09 PM',5), convert(datetime,'18-06-18 10:34:09 PM',5), @lugar, @ciudad, 'WA', 11011, 'HN', '123456789', 4567, 'PHOTO','Graduated', 2, 'http://accweb/emmployees/davolio.bmp');
		SET @count =  @count + 1;
	END;
GO

EXECUTE Insertar;

DBCC CHECKIDENT ('Employees', RESEED, 9); --ASIGNAR UN NUEVO VALOR A LA PROPIEDAD IDENTITY
SELECT IDENT_CURRENT ('EMPLOYEES') AS Current_Identity;  --SIRVE PARA VER EL VALOR ACTUAL DE LA PROPIEDAD IDENTITY
DELETE FROM Employees WHERE EmployeeID > 9;