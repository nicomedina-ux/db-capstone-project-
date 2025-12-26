
DELIMITER //

CREATE PROCEDURE CancelOrder(IN OrdersID INT)
BEGIN
    DELETE FROM Orders
    WHERE id = OrdersID;
END //

DELIMITER ;


CALL CancelOrder(1);  #no ejecutar para no perder un registro
#este procedimiento cancela una orden cuando desee solo usando el ID de la orden