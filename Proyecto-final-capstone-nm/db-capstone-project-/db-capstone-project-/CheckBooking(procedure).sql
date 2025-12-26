DELIMITER //

CREATE PROCEDURE CheckBooking(IN Date DATE, IN tableNumber INT)
BEGIN
    DECLARE tableStatus INT;

    SELECT COUNT(*) INTO tableStatus
    FROM booking
    WHERE Date = Date AND TableNumber = tableNumber;

    IF tableStatus > 0 THEN
        SELECT 'La mesa está reservada.' AS Status;
    ELSE
        SELECT 'La mesa está disponible.' AS Status;
    END IF;
END //

DELIMITER ;

call CheckBooking ('2022-11-12' , 13)