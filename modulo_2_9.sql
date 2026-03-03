USE northwind;

-- sacar precio mas bajo y mas alto de categoria productos

SELECT  MAX(UnitPrice) as high_price, MIN(UnitPrice) as low_price
FROM products;


-- 2. calcular precio medio de productos

SELECT AVG(UnitPrice)
FROM Products;

-- 3. sacar la maxima y minima de los pedidos de UK

SELECT  MAX(Freight) as high_carga, MIN(Freight) as low_carga
FROM orders
where ShipCountry ='UK';

-- 4 que productos se venden por encima del precio medio, ordenar de mayor a menor

SELECT AVG(UnitPrice)
from products;

SELECT *
FROM products
WHERE UnitPrice>28.86
ORDER BY UnitPrice DESC;

-- 5 nº productos discontinuados

SELECT *
from products;

SELECT *
FROM products
WHERE Discontinued = 1;

SELECT *
FROM products
WHERE Discontinued = 0;

SELECT ProductID,ProductName,Discontinued
FROM products
WHERE Discontinued = 0
ORDER BY ProductID DESC
LIMIT 10;

-- 7 RELACCION ENTRE Nº PEDIDOS Y MAXIMA CARGA

SELECT EmployeeID, MAX(Freight) AS MAXIMA_CARGA 
FROM orders
GROUP BY EmployeeID;

-- 9 

