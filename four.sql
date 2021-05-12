DELIMITER //

DROP PROCEDURE IF EXISTS Four //

CREATE PROCEDURE Four(IN s VARCHAR(40))
BEGIN
        
select * from (
select S.season, S.team, D.name, D.height, PTS
from Stat as S, Demographic as D
where S.name = D.name and PTS = (
        select max(PTS) 
        from Stat as S2 
        where S.season = S2.season)
group by season
order by D.height) a
where team = s
limit 1;

END; //

DELIMITER ;


