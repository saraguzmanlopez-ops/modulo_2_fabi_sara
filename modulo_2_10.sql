USE northwind;

-- Pedido por empresas de UK

SELECT *
	FROM orders
    WHERE ShipCountry = "UK";
    
SELECT c.customerID, c.CompanyName, o.OrderID
	FROM customers AS c
    INNER JOIN orders AS o
		ON c.customerID = o.customerID
	GROUP BY c.customerID, c.CompanyName, o.OrderID
    HAVING COUNT(OrderID);
    
/* SELECT c.customerID, c.CompanyName, o.OrderID
	FROM customers AS c
    INNER JOIN orders AS o
		ON c.customerID = o.customerID
	CASE 
		WHEN SUM(customerID) 
        ELSE NULL
        END suma_ventas_UK */
        
SELECT c.customerID, c.CompanyName,
    COUNT(o.OrderID) as NumberOfOrders
FROM customers AS c
INNER JOIN orders AS o
    ON c.customerID = o.customerID
WHERE c.country = 'UK'
GROUP BY c.customerID, c.CompanyName;

/*SELECT c.CompanyName, c.CustomerID, COUNT(o.OrderID) as NumberOfOrders, OrderDate
	FROM customers AS c
		INNER JOIN orders AS o
			ON c.customerID = o.customerID
	WHERE ShipCountry = "UK"
		INNER JOIN orders 
			ON o.NumberOfOrders = o.OrderDate
    GROUP BY c.CustomerID, c.CompanyName*/
    
SELECT c.CompanyName, YEAR(o.OrderDate) as Year, COUNT(o.OrderID) as NumberOfProducts
	FROM customers AS c
		INNER JOIN orders AS o
			ON c.customerID = o.customerID
	WHERE c.country = 'UK'
	GROUP BY c.CustomerID, YEAR(o.OrderDate)
		