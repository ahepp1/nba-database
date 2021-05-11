DELIMITER //

DROP PROCEDURE IF EXISTS Five //

CREATE PROCEDURE Five(IN s VARCHAR(40))
BEGIN
        IF EXISTS(SELECT * FROM Stat WHERE season = s) THEN
	
select name, 3P, 3PA, (3P / 3PA) as percent
from Stat
where season = s and 3PA > 50
order by percent desc
limit 5;
	END IF;
END; //

DELIMITER ;


