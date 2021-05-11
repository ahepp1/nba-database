DELIMITER //

DROP PROCEDURE IF EXISTS One //

CREATE PROCEDURE One(IN s VARCHAR(40))
BEGIN
        IF EXISTS(SELECT * FROM Stat WHERE season = s) THEN
	   select team, sum(pts) / 82 as PPG
	   from Stat
	   where season = s
	   group by team
	   order by PPG desc;
	END IF;
END; //

DELIMITER ;


