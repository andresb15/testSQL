


--Parte 1 Realice los siguientes procedimientos almacenados, SP_PARTE#_EJERICIO#_GRUPO#


--1. Visualizar el m�ximo y m�nimo precio de los productos por categor�a, mostrar el nombre de la
--categor�a por par�metro.


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Grupo2: Tavo, Andres Bejarano ,Luis Esquivel
-- Create date: 23-12-2021
-- Description:	
--1. Visualizar el m�ximo y m�nimo precio de los productos por categor�a, mostrar el nombre de la
--categor�a por par�metro.

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




--2. Visualizar el m�ximo y m�nimo precio de los productos por proveedor, mostrar el nombre de la
--compa��a proveedora por par�metro.






3. Seleccionar las categor�as que tengan m�s 5 productos. Mostrar el nombre de la categor�a y el
n�mero de productos por par�metro
4. Calcular cu�ntos clientes existen en cada Pa�s
5. Calcular cu�ntos clientes existen en cada Ciudad.
6. Calcular cu�ntos proveedores existen en cada Ciudad y Pa�s
7. Seleccionar cuantos proveedores tengo en cada pa�s, considerando solo al nombre de los
proveedores que comienzan con la letra X hasta la letra x(par�metro), adem�s de mostrar
solo los pa�sesdonde tenga m�s de 2 proveedores (par�metro).
8. Mostrar el nombre de producto y en cuantas �rdenes de compra se encuentra.

--Parte 2 Realizar un CRUD SP_PARTE#_EJERICIO#_GRUPO#
--� inserci�n de 20 registros en la tabla Clientes
--� Actualizar 10 registros en la tabla Clientes
--� Eliminar 5 clientes
--� Realice un SP que contenga un buscador por Nombre de la tabla Cliente
