USE northwind;

SELECT P.ProductName, C.CategoryName
	FROM categories AS C
    RIGHT JOIN products AS P
    ON C.CategoryID = P.CategoryID;
    
SELECT o.OrderID, o.CustomerID, c.CustomerID, c.CompanyName
	FROM orders AS o
    LEFT JOIN customers AS c
    ON c.CustomerID = o.CustomerID;
    
SELECT e.EmployeeID, e.FirstName, e.LastName, o.EmployeeID, o.OrderID
    FROM employees AS e
    LEFT JOIN orders AS o
    ON e.EmployeeID = o.EmployeeID,
    CASE 
	WHEN e.EmployeeID = o.EmployeeID THEN COUNT(o.OrderID)
    ELSE NULL
    END AS Employee_Orders
    GROUP BY e.FirstName;
    
SELECT e.EmployeeID, e.FirstName, e.LastName, COUNT(o.OrderID) AS Orders_number 
    FROM employees AS e
    LEFT JOIN orders AS o
    ON e.EmployeeID = o.EmployeeID
    GROUP BY e.EmployeeID, e.FirstName, e.LastName
    ORDER BY Orders_number DESC;
    
SELECT s.ShipperID, s.CompanyName, COUNT(o.OrderID) AS Shippers
	FROM Shippers AS s
    LEFT JOIN orders AS o
    ON s.ShipperID = o.ShipVia
    GROUP BY s.ShipperID, s.CompanyName
    ORDER BY Shippers DESC;