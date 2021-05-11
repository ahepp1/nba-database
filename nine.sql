DELIMITER //

DROP PROCEDURE IF EXISTS Nine //

CREATE PROCEDURE Nine(IN n VARCHAR(40))
BEGIN
        IF EXISTS(SELECT * FROM Stat WHERE name = n) THEN
	   select S.name, sum(T.W) as total_wins
from Stat as S, Team as T
where T.season = S.season and T.team = S.team and S.name = n;
	END IF;
END; //

DELIMITER ;


