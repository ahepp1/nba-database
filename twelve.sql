DELIMITER //

DROP PROCEDURE IF EXISTS Twelve //

CREATE PROCEDURE Twelve(IN s VARCHAR(40))
BEGIN
        IF EXISTS(SELECT * FROM Stat WHERE season = s) THEN
	   
select coach_name, C.team, sum(PTS) as total_points
from Coach as C, Stat as S
where C.team = S.team and C.season = S.season and C.season = s
group by coach_name
order by total_points
limit 1;
	END IF;
END; //

DELIMITER ;


