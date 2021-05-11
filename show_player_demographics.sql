DELIMITER //

DROP PROCEDURE IF EXISTS ShowPlayerDemographics //

CREATE PROCEDURE ShowPlayerDemographics(IN n VARCHAR(40))
BEGIN
        IF EXISTS(SELECT * FROM Demographic WHERE name = n) THEN
	   select * from Demographic
	   where name = n;
        END IF;
END; //

DELIMITER ;


