
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

--Parte 2 Realizar un CRUD SP_PARTE#_EJERICIO#_GRUPO#
--• inserción de 20 registros en la tabla Clientes
--• Actualizar 10 registros en la tabla Clientes
--• Eliminar 5 clientes
--• Realice un SP que contenga un buscador por Nombre de la tabla Cliente
