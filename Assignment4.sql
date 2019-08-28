# 6-58 
SELECT *
	FROM employee_t
    WHERE SUBSTR(employeename, INSTR(employeename, " ")+1) LIKE "L%";
      
# 6-59
SELECT *
	FROM employee_t
    WHERE EmployeeDateHired BETWEEN "2005-01-01" AND "2005-12-31";
    
# 6-61
SELECT CustomerState, COUNT(CustomerName) AS numofcustomers
	FROM customer_t
    GROUP BY CustomerState;
    
# 6-64
SELECT ProductLineID, AVG(ProductStandardPrice) AS averageofprice
	FROM product_t
    GROUP BY ProductLineID;
    
# 6-65
SELECT ProductID, SUM(OrderedQuantity) AS qntorders
	FROM orderline_t 
    GROUP BY ProductID
    ORDER BY qntorders DESC;
 
# 6-68
SELECT ProductID, COUNT(OrderedQuantity) AS Numorders
	FROM orderline_t
    GROUP BY ProductID
    ORDER BY Numorders DESC;
    
# 6-72
SELECT SalesTerritoryID, COUNT(SalespersonName) AS Numsalesperson
	FROM salesperson_t
    GROUP BY SalesTerritoryID
    HAVING Numsalesperson > 1;

# 6-79
SELECT ProductID, ProductDescription, ProductFinish, ProductStandardPrice
	FROM product_t
    WHERE (ProductFinish = "oak" AND ProductStandardPrice > 400)
    OR (ProductFinish = "cherry" AND ProductStandardPrice <300);
    
# 7-43
SELECT a.EmployeeName, COUNT(b.EmployeeID) AS HeadCount
	FROM employee_t a INNER JOIN employee_t b
    ON (a.EmployeeID = b.EmployeeSupervisor)
    GROUP BY a.EmployeeName
    HAVING HeadCount > 2;

# 7-50
SELECT a.CustomerID, a.CustomerName, SUM(C.OrderedQuantity) AS DeskOrders
	FROM customer_t a INNER JOIN order_t B
    ON (a.CustomerID = b.CustomerID) INNER JOIN orderline_t C
    ON (b.OrderID = c.OrderID) INNER JOIN product_t d
    ON (c.ProductID = d.ProductID)
	WHERE LOWER(d.ProductDescription) LIKE "%computer desk%"
    GROUP BY a.CustomerID, a.CustomerName;

# 7-55
SELECT a.SalespersonName, d.ProductFinish, SUM(c.OrderedQuantity) AS TotSales
	FROM salesperson_t a INNER JOIN order_t b
    ON (a.SalespersonID = b.SalespersonID) INNER JOIN orderline_t c
    ON (b.OrderID = c.OrderID) INNER JOIN product_t d 
    ON (c.ProductID = d.ProductID)
    GROUP BY a.SalespersonName, d.ProductFinish;

# 7-61
SELECT a.CustomerID, a.CustomerName, b.OrderID
	FROM customer_t a LEFT OUTER JOIN order_t b
    ON (a.CustomerID = b.CustomerID);

# 7-65
SELECT a.CustomerID, a.CustomerName, b.OrderID
	FROM customer_t a INNER JOIN order_t b
    ON (a.CustomerID = b.CustomerID)
    UNION (SELECT a.CustomerID, a.CustomerName, 0
				FROM customer_t a LEFT OUTER JOIN order_t b
				ON (a.CustomerID = b.CustomerID)
				WHERE b.OrderID IS NULL);
                
                