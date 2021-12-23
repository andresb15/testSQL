
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






3. Seleccionar las categorías que tengan más 5 productos. Mostrar el nombre de la categoría y el
número de productos por parámetro
4. Calcular cuántos clientes existen en cada País
5. Calcular cuántos clientes existen en cada Ciudad.
6. Calcular cuántos proveedores existen en cada Ciudad y País
7. Seleccionar cuantos proveedores tengo en cada país, considerando solo al nombre de los
proveedores que comienzan con la letra X hasta la letra x(parámetro), además de mostrar
solo los paísesdonde tenga más de 2 proveedores (parámetro).
8. Mostrar el nombre de producto y en cuantas órdenes de compra se encuentra.

--Parte 2 Realizar un CRUD SP_PARTE#_EJERICIO#_GRUPO#
--• inserción de 20 registros en la tabla Clientes
--• Actualizar 10 registros en la tabla Clientes
--• Eliminar 5 clientes
--• Realice un SP que contenga un buscador por Nombre de la tabla Cliente
