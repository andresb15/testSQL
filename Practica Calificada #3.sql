********





Practica Calificada #3
Grupo2: Tavo , Andres Bejarano ,Luis Esquivel 



--Parte 1 Realice los siguientes procedimientos almacenados, SP_PARTE#_EJERICIO#_GRUPO#


--1. Visualizar el máximo y mínimo precio de los productos por categoría, mostrar el nombre de la
--categoría por parámetro.


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Grupo2: Tavo, Andres Bejarano ,Luis Esquivel
-- Create date: 23-12-2021
-- Description:	
--1. Visualizar el máximo y mínimo precio de los productos por categoría, mostrar el nombre de la
--categoría por parámetro.

-- =============================================
CREATE PROCEDURE SP_PARTE#1_EJERICIO#1_GRUPO#2
	-- Add the parameters for the stored procedure here
	
	@CodCategoria INT
AS
BEGIN
SET NOCOUNT ON;

    -- Insert statements for procedure here
 SELECT  B.[CategoryName],
A.[CategoryID],MAX([UnitPrice])
AS 'Precio maximo' ,MIN([UnitPrice]) AS 'Precio Minimo'
 FROM [dbo].[Products] AS  A
INNER JOIN [dbo].[Categories] AS B
ON A.CategoryID = B.CategoryID
WHERE A.CategoryID = @CodCategoria
GROUP BY  A.[CategoryID],B.[CategoryName]
END
GO




--2. Visualizar el máximo y mínimo precio de los productos por proveedor, mostrar el nombre de la
--compañía proveedora por parámetro.

USE [VLANort]
GO
/****** Object:  StoredProcedure [dbo].[SP_PARTE#1_EJERICIO#2_GRUPO#2]    Script Date: 12/23/2021 2:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Grupo2: Tavo , Andres Bejarano ,Luis Esquivel
-- Create date: 23-12-2021
-- Description:	--2. Visualizar el máximo y mínimo precio de los productos por proveedor, mostrar el nombre de la
--compañía proveedora por parámetro.

-- =============================================
ALTER PROCEDURE [dbo].[SP_PARTE#1_EJERICIO#2_GRUPO#2] 
	-- Add the parameters for the stored procedure here
	@SupplierID INT

AS
BEGIN

	SET NOCOUNT ON;

    -- Insert statements for procedure here
	 SELECT S.[CompanyName],
MAX(P.[UnitPrice]) AS 'PRECIO MAXIMO',
MIN(P.[UnitPrice]) AS 'PRECIO MINIMO'
 FROM [dbo].[Products] AS P
INNER JOIN [dbo].[Suppliers] AS S
ON P.[SupplierID] = S.[SupplierID]
WHERE S.[SupplierID] = @SupplierID
GROUP BY S.[CompanyName]

END





--3. Seleccionar las categorías que tengan más 5 productos. Mostrar el nombre de la categoría y el
número de productos por parámetro

USE [VLANort]
GO
/****** Object:  StoredProcedure [dbo].[SP_PARTE#1_EJERICIO#3_GRUPO#2]    Script Date: 12/23/2021 5:01:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Grupo2: Tavo , Andres Bejarano ,Luis Esquivel
-- Create date: 23-12-2021
-- Description:	<3. Seleccionar las categorías que tengan más 5 productos. Mostrar el nombre de la categoría y el número de productos por parámetro>
-- =============================================
ALTER PROCEDURE [dbo].[SP_PARTE#1_EJERICIO#3_GRUPO#2] 
	-- Add the parameters for the stored procedure here
	@numero_de_productos INT 


	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

 SELECT C.[CategoryID]  ,C.[CategoryName]  ,COUNT(*) AS 'Numero de productos'
FROM [dbo].[Categories] AS C
INNER JOIN [dbo].[Products] AS P
ON C.[CategoryID] = P.[CategoryID]
GROUP BY  C.[CategoryID], C.[CategoryName]
having COUNT(*)  > 5 AND  COUNT(*) = @numero_de_productos
 

END









--4. Calcular cuántos clientes existen en cada País

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Grupo2: Tavo , Andres Bejarano ,Luis Esquivel
-- Create date: 25-12-2021
-- Description:	4. Calcular cuántos clientes existen en cada País
-- =============================================
CREATE PROCEDURE SP_PARTE#1_EJERICIO#4_GRUPO#2 

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

SELECT  [Country] as 'PAIS', COUNT(*) AS 'NUMERO DE CLIENTES'
 from [dbo].[Customers]  group by [Country]

END
GO






--5. Calcular cuántos clientes existen en cada Ciudad.
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Grupo2: Tavo , Andres Bejarano ,Luis Esquivel
-- Create date: 25-12-2021
-- Description:	5. Calcular cuántos clientes existen en cada Ciudad.
-- =============================================
CREATE PROCEDURE SP_PARTE#1_EJERICIO#5_GRUPO#2 

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

SELECT [City] as 'CIUDAD', COUNT(*) AS 'NUMERO DE CLIENTES'
 from [dbo].[Customers]  group by [City]

END
GO



6. Calcular cuántos proveedores existen en cada Ciudad y País

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Grupo2: Tavo , Andres Bejarano ,Luis Esquivel
-- Create date: 25-12-2021
-- Description: 6. Calcular cuántos proveedores existen en cada Ciudad y País
-- =============================================
CREATE PROCEDURE SP_PARTE#1_EJERICIO#6_GRUPO#2 
AS
BEGIN
SET NOCOUNT ON;
SELECT [City], [Country] , COUNT([Country])
AS 'CANTIDAD DE PROVEEDORES POR PAIS',
COUNT([City]) AS 'CANTIDAD DE PROVEEDORES POR CIUDAD '
FROM [dbo].[Suppliers]
GROUP BY [City], [Country]
END
GO



7. Seleccionar cuantos proveedores tengo en cada país, considerando solo al nombre de los
proveedores que comienzan con la letra X hasta la letra x(parámetro), además de mostrar
solo los paísesdonde tenga más de 2 proveedores (parámetro).

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Grupo2: Tavo , Andres Bejarano ,Luis Esquivel
-- Create date: 26-12-2021
-- Description:	--7. Seleccionar cuantos proveedores tengo en cada país, considerando solo al nombre de los
--proveedores que comienzan con la letra X hasta la letra x(parámetro), además de mostrar
--solo los paísesdonde tenga más de 2 proveedores (parámetro).
-- =============================================
CREATE PROCEDURE SP_PARTE#1_EJERICIO#7_GRUPO#2 
	-- Add the parameters for the stored procedure here
	@letra1 CHAR(40) , 
	@letra2 CHAR(40) ,
	@country NVARCHAR(15) 
AS
BEGIN
SET NOCOUNT ON;
SELECT [Country], COUNT(*) AS 'Cantidad de proveedores'
FROM [dbo].[Suppliers]
where [CompanyName]  LIKE '['+@letra1+'-'+@letra2+']%' 
AND [Country] = @country
GROUP BY [Country] 
HAVING COUNT(*) > 2
END
GO




8. Mostrar el nombre de producto y en cuantas órdenes de compra se encuentra.

USE [VLANort]
GO
/****** Object:  StoredProcedure [dbo].[SP_PARTE#1_EJERICIO#8_GRUPO#2]    Script Date: 12/28/2021 10:52:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:	Grupo2: Tavo , Andres Bejarano ,Luis Esquivel
-- Create date: 12-26-2021
-- Description:8. Mostrar el nombre de producto y en cuantas órdenes de compra se encuentra.	
-- =============================================
ALTER PROCEDURE [dbo].[SP_PARTE#1_EJERICIO#8_GRUPO#2]
	-- Add the parameters for the stored procedure here
	@ProductoID int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
		SELECT A.ProductName,COUNT (B.OrderID)as 'ORDENES DE COMPRA'
FROM Products AS A
INNER JOIN [Order Details] AS B
ON A.ProductID=B.ProductID
group by A.ProductName,A.ProductID
HAVING A.ProductID=@ProductoID
END



--Parte 2 Realizar un CRUD SP_PARTE#_EJERICIO#_GRUPO#
--• inserción de 20 registros en la tabla Clientes

USE [VLANort]
GO
/****** Object:  StoredProcedure [dbo].[SP_PARTE#2_EJERICIO#1_GRUPO#2]    Script Date: 12/29/2021 5:16:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:	Grupo2: Tavo , Andres Bejarano ,Luis Esquivel
-- Create date: 12-29-2021
-- Description:	1 inserción de 20 registros en la tabla Clientes
-- =============================================
ALTER PROCEDURE [dbo].[SP_PARTE#2_EJERICIO#1_GRUPO#2] 
	-- Add the parameters for the stored procedure here
	@1NOMBRE VARCHAR(50),
	@1APELLIDO VARCHAR(50),
	@1EDAD INT,

	@2NOMBRE VARCHAR(50),
	@2APELLIDO VARCHAR(50),
	@2EDAD INT,

	@3NOMBRE VARCHAR(50),
	@3APELLIDO VARCHAR(50),
	@3EDAD INT,

	@4NOMBRE VARCHAR(50),
	@4APELLIDO VARCHAR(50),
	@4EDAD INT,

	@5NOMBRE VARCHAR(50),
	@5APELLIDO VARCHAR(50),
	@5EDAD INT,

	@6NOMBRE VARCHAR(50),
	@6APELLIDO VARCHAR(50),
	@6EDAD INT,

	@7NOMBRE VARCHAR(50),
	@7APELLIDO VARCHAR(50),
	@7EDAD INT,

	@8NOMBRE VARCHAR(50),
	@8APELLIDO VARCHAR(50),
	@8EDAD INT,

	@9NOMBRE VARCHAR(50),
	@9APELLIDO VARCHAR(50),
	@9EDAD INT,

	@10NOMBRE VARCHAR(50),
	@10APELLIDO VARCHAR(50),
	@10EDAD INT,

	@11NOMBRE VARCHAR(50),
	@11APELLIDO VARCHAR(50),
	@11EDAD INT,

	@12NOMBRE VARCHAR(50),
	@12APELLIDO VARCHAR(50),
	@12EDAD INT,

	@13NOMBRE VARCHAR(50),
	@13APELLIDO VARCHAR(50),
	@13EDAD INT,

	@14NOMBRE VARCHAR(50),
	@14APELLIDO VARCHAR(50),
	@14EDAD INT,

	@15NOMBRE VARCHAR(50),
	@15APELLIDO VARCHAR(50),
	@15EDAD INT,

	@16NOMBRE VARCHAR(50),
	@16APELLIDO VARCHAR(50),
	@16EDAD INT,

	@17NOMBRE VARCHAR(50),
	@17APELLIDO VARCHAR(50),
	@17EDAD INT,

	@18NOMBRE VARCHAR(50),
	@18APELLIDO VARCHAR(50),
	@18EDAD INT,

	@19NOMBRE VARCHAR(50),
	@19APELLIDO VARCHAR(50),
	@19EDAD INT,

	@20NOMBRE VARCHAR(50),
	@20APELLIDO VARCHAR(50),
	@20EDAD INT

	

	
AS

BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [dbo].[Cliente] VALUES(@1NOMBRE,@1APELLIDO,@1EDAD)

	INSERT INTO [dbo].[Cliente]
VALUES(@2NOMBRE,@2APELLIDO,@2EDAD)

	INSERT INTO [dbo].[Cliente]
VALUES(@3NOMBRE,@3APELLIDO,@3EDAD)

	INSERT INTO [dbo].[Cliente]
VALUES(@4NOMBRE,@4APELLIDO,@4EDAD)

	INSERT INTO [dbo].[Cliente]
VALUES(@5NOMBRE,@5APELLIDO,@5EDAD)

	INSERT INTO [dbo].[Cliente]
VALUES(@6NOMBRE,@6APELLIDO,@6EDAD)

	INSERT INTO [dbo].[Cliente]
VALUES(@7NOMBRE,@7APELLIDO,@7EDAD)

	INSERT INTO [dbo].[Cliente]
VALUES(@8NOMBRE,@8APELLIDO,@8EDAD)

	INSERT INTO [dbo].[Cliente]
VALUES(@9NOMBRE,@9APELLIDO,@9EDAD)

	INSERT INTO [dbo].[Cliente]
VALUES(@10NOMBRE,@10APELLIDO,@10EDAD)

	INSERT INTO [dbo].[Cliente]
VALUES(@11NOMBRE,@11APELLIDO,@11EDAD)

	INSERT INTO [dbo].[Cliente]
VALUES(@12NOMBRE,@12APELLIDO,@12EDAD)

	INSERT INTO [dbo].[Cliente]
VALUES(@13NOMBRE,@13APELLIDO,@13EDAD)

	INSERT INTO [dbo].[Cliente]
VALUES(@14NOMBRE,@14APELLIDO,@14EDAD)

	INSERT INTO [dbo].[Cliente]
VALUES(@15NOMBRE,@15APELLIDO,@15EDAD)

	INSERT INTO [dbo].[Cliente]
VALUES(@16NOMBRE,@16APELLIDO,@16EDAD)

	INSERT INTO [dbo].[Cliente]
VALUES(@17NOMBRE,@17APELLIDO,@17EDAD)

	INSERT INTO [dbo].[Cliente]
VALUES(@18NOMBRE,@18APELLIDO,@18EDAD)

	INSERT INTO [dbo].[Cliente]
VALUES(@19NOMBRE,@19APELLIDO,@19EDAD)

	INSERT INTO [dbo].[Cliente] VALUES(@20NOMBRE,@20APELLIDO,@20EDAD)


END





--• Actualizar 10 registros en la tabla Clientes

USE [VLANort]
GO
/****** Object:  StoredProcedure [dbo].[SP_PARTE#2_EJERICIO#2_GRUPO#2]    Script Date: 12/29/2021 5:22:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Grupo2: Tavo , Andres Bejarano ,Luis Esquivel
-- Create date: 12-29-2021
-- Description:	Actualizar 10 registros en la tabla Clientes
-- =============================================
ALTER PROCEDURE [dbo].[SP_PARTE#2_EJERICIO#2_GRUPO#2] 
	-- Add the parameters for the stored procedure here
	@1ClienteID int,
	@1Nombre varchar(30),
	@1Apellido varchar(30),
	@1Edad int,

	@2ClienteID int,
	@2Nombre varchar(30),
	@2Apellido varchar(30),
	@2Edad int,

	@3ClienteID int,
	@3Nombre varchar(30),
	@3Apellido varchar(30),
	@3Edad int,

	@4ClienteID int,
	@4Nombre varchar(30),
	@4Apellido varchar(30),
	@4Edad int,

	@5ClienteID int,
	@5Nombre varchar(30),
	@5Apellido varchar(30),
	@5Edad int,

	@6ClienteID int,
	@6Nombre varchar(30),
	@6Apellido varchar(30),
	@6Edad int,

	@7ClienteID int,
	@7Nombre varchar(30),
	@7Apellido varchar(30),
	@7Edad int,

	@8ClienteID int,
	@8Nombre varchar(30),
	@8Apellido varchar(30),
	@8Edad int,

	@9ClienteID int,
	@9Nombre varchar(30),
	@9Apellido varchar(30),
	@9Edad int,

	@10ClienteID int,
	@10Nombre varchar(30),
	@10Apellido varchar(30),
	@10Edad int
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [dbo].[Cliente] set [Nombre]=@1Nombre,[Apellido]=@1Apellido,[Edad]=@1Edad
	where [IdCliente]= @1ClienteID

	UPDATE [dbo].[Cliente] set [Nombre]=@2Nombre,[Apellido]=@2Apellido,[Edad]=@2Edad
	where [IdCliente]= @2ClienteID
	
	UPDATE [dbo].[Cliente] set [Nombre]=@3Nombre,[Apellido]=@3Apellido,[Edad]=@3Edad
	where [IdCliente]= @3ClienteID

	UPDATE [dbo].[Cliente] set [Nombre]=@4Nombre,[Apellido]=@4Apellido,[Edad]=@4Edad
	where [IdCliente]= @4ClienteID

	UPDATE [dbo].[Cliente] set [Nombre]=@5Nombre,[Apellido]=@5Apellido,[Edad]=@5Edad
	where [IdCliente]= @5ClienteID

	UPDATE [dbo].[Cliente] set [Nombre]=@6Nombre,[Apellido]=@6Apellido,[Edad]=@6Edad
	where [IdCliente]= @6ClienteID

	UPDATE [dbo].[Cliente] set [Nombre]=@7Nombre,[Apellido]=@7Apellido,[Edad]=@7Edad
	where [IdCliente]= @7ClienteID

	UPDATE [dbo].[Cliente] set [Nombre]=@8Nombre,[Apellido]=@8Apellido,[Edad]=@8Edad
	where [IdCliente]= @8ClienteID

    UPDATE [dbo].[Cliente] set [Nombre]=@9Nombre,[Apellido]=@9Apellido,[Edad]=@9Edad
	where [IdCliente]= @9ClienteID

	UPDATE [dbo].[Cliente] set [Nombre]=@10Nombre,[Apellido]=@10Apellido,[Edad]=@10Edad
	where [IdCliente]= @10ClienteID


END


--• Eliminar 5 clientes

USE [VLANort]
GO
/****** Object:  StoredProcedure [dbo].[SP_PARTE#2_EJERICIO#3_GRUPO#2]    Script Date: 12/29/2021 5:24:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Grupo2: Tavo , Andres Bejarano ,Luis Esquivel
-- Create date: 12-29-2021
-- Description:	#3 Eliminar 5 clientes
-- =============================================
ALTER PROCEDURE [dbo].[SP_PARTE#2_EJERICIO#3_GRUPO#2] 
	-- Add the parameters for the stored procedure here
	@1IDCLIENTE int,
	@2IDCLIENTE int,
	@3IDCLIENTE int,
	@4IDCLIENTE int,
	@5IDCLIENTE int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE from [dbo].[Cliente]
	where [IdCliente] in (@1IDCLIENTE,@2IDCLIENTE,@3IDCLIENTE,@4IDCLIENTE,@5IDCLIENTE)
END
--• Realice un SP que contenga un buscador por Nombre de la tabla Cliente



USE [VLANort]
GO
/****** Object:  StoredProcedure [dbo].[SP_PARTE#2_EJERICIO#4_GRUPO#2]    Script Date: 12/29/2021 5:25:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Grupo2: Tavo , Andres Bejarano ,Luis Esquivel
-- Create date: 12-29-2021
-- Description:	#4 Realice un SP que contenga un buscador por Nombre de la tabla Cliente
-- =============================================
ALTER PROCEDURE [dbo].[SP_PARTE#2_EJERICIO#4_GRUPO#2] 
	-- Add the parameters for the stored procedure here
	@NOMBRE varchar(30)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT *
	from [dbo].[Cliente]
	where [Nombre] =@NOMBRE
END

