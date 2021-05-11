DELIMITER //

DROP PROCEDURE IF EXISTS Six //

CREATE PROCEDURE Six(IN s1 VARCHAR(40), s2 VARCHAR(10))
BEGIN
        IF EXISTS(SELECT * FROM Stat WHERE season = s1) and  EXISTS(SELECT * FROM Stat WHERE season = s2) THEN
	   
select season, avg(3PA) as avg_3PA
from Stat
where (season = s1 or season = s2)
group by season;
	END IF;
END; //

DELIMITER ;


