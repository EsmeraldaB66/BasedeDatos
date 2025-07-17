--SQL-LMD(INSERT,DELETE,UPDATE,SELECT)
use NORTHWND;
GO

SELECT *
FROM Categories;
SELECT*FROM	
Products;
SELECT*
FROM Suppliers;
SELECT*
FROM Customers;
SELECT*
FROM Employees;
SELECT*
FROM Shippers;
SELECT*
FROM Orders;
SELECT*
FROM [Order Details];
SELECT customerid,CompanyName,City
FROM Customers;
--Alias de columna 
SELECT CustomerID AS 'Numero Empleado',
		CompanyName Empresa,
		city AS Ciudad,
		ContactName AS [Nombre del Contacto]
FROM Customers;
--Alias de tabla
SELECT Customers.CustomerID AS [Numero Cliente],
	   Customers.CompanyName AS [Empresa],
	   Customers.ContactName AS [Nombre del Contacto]
FROM Customers;
SELECT c.CustomerID AS [Numero Cliente],
	   c.CompanyName AS [Empresa],
	   c.ContactName AS [Nombre del Contacto]
FROM Customers AS c;
SELECT c.CustomerID AS [Numero Cliente],
	   c.CompanyName AS [Empresa],
	   c.ContactName AS [Nombre del Contacto]
FROM Customers c;
--Campo calculado 
SELECT*,(UnitPrice*Quantity) AS [Total]
FROM [Order Details];
SELECT od.OrderID AS[Numero de orden],
od.ProductID AS[Numero de producto],
od.UnitPrice AS [Precio],
od.Quantity AS [Cantidad],
(UnitPrice*Quantity) AS [Total]
FROM [Order Details] AS od;
--Selecciona todos los productos quje pertenezcan a 
--la categoria 1
select p.ProductID AS [Numero],
       p.ProductName AS [Nombre],
	   p.CategoryID AS [Categoria],
	   p.UnitPrice AS [Precio],
	   p.UnitsInStock AS [Cantidad],
	   (p.UnitPrice*p.UnitsInStock) AS [Costo]
from
Products AS p
WHERE CategoryID=1;
--Seleccionar todos los productos de la categoria condimens
select p.ProductID AS [Numero],
       p.ProductName AS [Nombre],
	   p.CategoryID AS [Categoria],
	   p.UnitPrice AS [Precio],
	   p.UnitsInStock AS [Cantidad],
	   (p.UnitPrice*p.UnitsInStock) AS [Costo]
from
Products AS p
WHERE CategoryID=2;
--Seleccionar que todos lols productos 
--que su precio sea mayor a
select p.ProductID AS [Numero],
       p.ProductName AS [Nombre],
	   p.UnitPrice AS [Precio]
from
Products AS p
WHERE p.UnitPrice>40.3;
select p.ProductID AS [Numero],
       p.ProductName AS [Nombre],
	   p.UnitPrice AS [Precio]
from
Products AS p
WHERE p.UnitPrice>=40;
--numero de categoria sea diferente a 3
select p.ProductID AS [Numero],
       p.ProductName AS [Nombre],
	   p.CategoryID AS [Categoria],
	   p.UnitPrice AS [Precio]
from
Products AS p
WHERE CategoryID!=3;
--Seleccionar todas las ordenes que sean de brasil -Rio de janeiro mostrando solo el no.de orden
--la fecga de orden, pais dde envio y la ciudad y su transportista 
SELECT o.OrderID AS [Numero],
       o.OrderDate AS [Fecha de orden],
	   o.ShipCountry AS[Pais de envio],
	   o.ShipCity AS [Ciudad],
	   o.ShipVia AS [Transportista]
FROM Orders AS o
WHERE o.ShipCity='Rio de Janeiro';

SELECT o.OrderID AS [Numero],
       o.OrderDate AS [Fecha de orden],
	   o.ShipCountry AS[Pais de envio],
	   o.ShipCity AS [Ciudad],
	   o.ShipVia AS [Transportista]
FROM Orders AS o
WHERE o.ShipRegion is null;


SELECT o.OrderID AS [Numero],
       o.OrderDate AS [Fecha de orden],
	   o.ShipCountry AS[Pais de envio],
	   o.ShipCity AS [Ciudad],
	   o.ShipVia AS [Transportista]
FROM Orders AS o
WHERE o.ShipRegion is not null;

--Seleccio9nar todas las ordenes enviadas a brazil, alemania y mexico y region
SELECT o.OrderID AS [Numero],
       o.OrderDate AS [Fecha de orden],
	   o.ShipCountry AS[Pais de envio],
	   o.ShipCity AS [Ciudad],
	   o.ShipVia AS [Transportista],
	   o.ShipRegion AS [Region]
FROM Orders AS o
WHERE (o.ShipCountry='Brazil' or o.ShipCountry='Germany' or o.ShipCountry='Mexico')and o.ShipRegion is null 
	  ORDER BY [Pais de envio] ASC, o.ShipCity DESC;

--Seleccionar las odernes de francia, alemania, argentina 

SELECT o.OrderID AS [Numero],
       o.OrderDate AS [Fecha de orden],
	   o.ShipCountry AS[Pais de envio],
	   o.ShipCity AS [Ciudad],
	   o.ShipVia AS [Transportista],
	   o.ShipRegion AS [Region]
FROM Orders AS o
WHERE o.ShipCountry in('France','Germany','Argentina') ;
--seleccionar todos lod productos descontiinuados, mayor a 50 y ordenados por el precio

select p.ProductID AS [Numero],
       p.ProductName AS [Nombre],
	   p.CategoryID AS [Categoria],
	   p.UnitPrice AS [Precio]
from
Products AS p
WHERE p.Discontinued=1 or p.UnitPrice>50
ORDER BY [Precio] DESC;

select *from Products;