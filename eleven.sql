DELIMITER //

DROP PROCEDURE IF EXISTS Eleven //

CREATE PROCEDURE Eleven(IN n int)
BEGIN
        
select D.player_position, count(D.player_position) as number_of_awards
from Award as A, Demographic as D
where A.sixth_man = D.Name
group by player_position
order by number_of_awards desc
limit n;
END; //

DELIMITER ;


