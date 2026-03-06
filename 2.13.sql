USE northwind;

-- Extraed información de los productos "Beverages"

SELECT *
	FROM products;
    
SELECT *
	FROM categories;
    
SELECT *	
	FROM categories
    WHERE categoryID = 1;
    
SELECT ProductID, ProductName,CategoryID
	FROM products
    WHERE categoryID IN (SELECT categoryID
							FROM categories
                            WHERE CategoryName = "Beverages");
                            
-- Extraed la lista de países donde viven los clientes, pero no hay ningún proveedor ubicado en ese país

SELECT country
	FROM customers;
    
SELECT country
	FROM suppliers;
    
SELECT DISTINCT country
	FROM customers
    WHERE country NOT IN (SELECT country 	
								FROM suppliers);
                                
-- Extraed los pedidos con el máximo "order_date" para cada empleado.

SELECT MAX(OrderDate) AS last_order
	FROM orders;
    
SELECT orders.OrderID, orders.customerID, orders.employeeID, employees.LastName, employees.FirstName, orders.RequiredDate, orders.OrderDate
	FROM orders
    LEFT JOIN employees
    ON orders.employeeID = employees.employeeID
    WHERE OrderDate = (SELECT MAX(OrderDate)
								FROM orders);
                                
SELECT * 
	FROM employees;
    
-- Extraer los clientes que compraron mas de 20 artículos "Grandma's Boysenberry Spread"

SELECT ProductID, ProductName
	FROM products
    WHERE ProductName = "Grandma's Boysenberry Spread";
    
SELECT CustomerID, CompanyName
	FROM customers;

SELECT OrderID, CustomerID
	FROM orders
    WHERE OrderID;
    
SELECT *
	FROM orders;
    
SELECT *
	FROM orderdetails
    WHERE Quantity > 20 AND productID IN (SELECT ProductID
												FROM products);
