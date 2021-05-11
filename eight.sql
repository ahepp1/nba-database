DELIMITER //

DROP PROCEDURE IF EXISTS Eight //

CREATE PROCEDURE Eight()
BEGIN
        
select team, count(playoffs) as num_playoffs, round(avg(SRS), 2) as avg_SRS
from Team
where playoffs = 1
group by team
order by num_playoffs desc;
END; //

DELIMITER ;


