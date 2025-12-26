SET @CustomerID = 1; 

PREPARE GetOrderDetail FROM 
'SELECT OrdersID, Quantity, TotalCost 
 FROM Orders 
 WHERE Customers_CustomersID = ?';
 


SET @id = 3;
EXECUTE GetOrderDetail USING @id;