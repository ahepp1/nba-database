DELIMITER //

DROP PROCEDURE IF EXISTS Two //

CREATE PROCEDURE Two(IN s VARCHAR(40))
BEGIN
        IF EXISTS(SELECT * FROM Stat WHERE season = s) THEN
	
	select team, avg(pts) as avg_points	
       	from Stat
	where season = s
        group by team
	order by avg_points desc;
	END IF;
END; //

DELIMITER ;


