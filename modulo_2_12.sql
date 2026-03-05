use northwind;
-- ejercio 1

SELECT City,CompanyName,ContactName
FROM customers
WHERE  City Like 'A%' OR 'B%';

-- ejercio 2, todas las ciudades que empiezan por L y suma los pedidos por empresa no por ciudad y la ciudad se tiene que repetir

SELECT  City, ContactName, CompanyName,COUNT(OrderID) as numero_pedidos
FROM customers
LEFT JOIN orders
ON orders.CustomerID=customers.CustomerID
WHERE City Like 'L%'
GROUP BY  City, ContactName, CompanyName
order by numero_pedidos DESC ;

-- ejercicio 3 no incluya sales

SELECT City,CompanyName,ContactName,ContactTitle 
FROM customers
WHERE ContactTitle    not Like 'Sales%';
 
 


 
