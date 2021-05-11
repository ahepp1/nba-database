DELIMITER //

DROP PROCEDURE IF EXISTS Four //

CREATE PROCEDURE Four(IN s VARCHAR(40))
BEGIN
        
select S.season, S.team, D.name, D.height, PTS AS category
from Stat as S, Demographic as D
where S.name = D.name and PTS IN (
        select case s
	       
        WHEN '3P' THEN 3P
        WHEN '3PA' THEN 3PA
        WHEN 'FG' THEN FG
       WHEN 'FGA' THEN FGA
       WHEN 'FT' THEN FT
       WHEN 'FTA' THEN FTA
            
       WHEN 'ORB' THEN ORB
       WHEN 'DRB' THEN DRB
       WHEN 'AST' THEN AST
       WHEN 'STL' THEN STL
       WHEN 'BLK' THEN BLK
       WHEN 'TOV' THEN TOV
       WHEN 'PTS' THEN PTS
       
       ELSE NULL
       END
        from Stat as S2 
        where S.season = S2.season)
group by season
order by D.height
limit 1;

END; //

DELIMITER ;


