DELIMITER //

DROP PROCEDURE IF EXISTS Fourteen //

CREATE PROCEDURE Fourteen(IN n int)
BEGIN
       
	   
select season, team, D.name, weight, PTS
from Demographic as D, Stat as S
where D.name = S.name and PTS = 
        (select max(PTS) 
        from Stat as S2 
        where S.team = S2.team and S.season = S2.season)
group by team, season
      order by weight desc
limit n;

END; //

DELIMITER ;


