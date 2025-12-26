DELIMITER //

CREATE PROCEDURE AddValidBooking(IN Date DATE, IN tableNumber INT)
BEGIN
    DECLARE tableStatus INT;

    START TRANSACTION;

     #Comprobar si la mesa ya está reservada
    SELECT COUNT(*) INTO tableStatus
    FROM booking
    WHERE Date = Date AND TableNumber = tableNumber;

    IF tableStatus > 0 THEN
        -- La mesa ya está reservada, deshacer la transacción
        ROLLBACK;
        SELECT 'Reserva cancelada: la mesa ya está reservada.' AS Status;
    ELSE
        -- La mesa está disponible, realizar la reserva
        INSERT INTO booking (Date, TableNumber) VALUES (Date, tableNumber);
        COMMIT;
        SELECT 'Reserva confirmada.' AS Status;
    END IF;
END //

DELIMITER ;

call AddValidBooking ("2022,12,17" , 6)