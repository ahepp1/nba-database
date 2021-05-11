DELIMITER //

DROP PROCEDURE IF EXISTS Three //

CREATE PROCEDURE Three(IN s VARCHAR(40))
BEGIN
        IF EXISTS(SELECT * FROM Stat WHERE season = s) THEN
	select avg(D.height) as mean_height
	from Stat as S, Demographic as D
	where S.name = D.name and S.season = s and (DRB + ORB) = (
        select max(DRB + ORB) 
        from Stat as S2
        where season=s and S.team = S2.team);
	END IF;
END; //

DELIMITER ;


