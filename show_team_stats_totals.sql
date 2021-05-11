DELIMITER //

DROP PROCEDURE IF EXISTS ShowTeamStatsTotals //

CREATE PROCEDURE ShowTeamStatsTotals(IN t VARCHAR(10))
BEGIN
	IF EXISTS(SELECT * FROM Stat WHERE team = t) THEN
SELECT  a.team, b.team_name, b.conference, b.playoffs, b.W, b.L, b.SRS, b.pace, b.ortg, b.drtg, a.FG, a.FGA, round(a.FG/a.FGA, 2) AS FGP, a.3P, a.3PA, round(a.3P/a.3PA, 2) AS 3PP, a.FT, a.FTA, (a.ORB + a.DRB) AS REB, a.ORB, a.DRB, a.AST, a.STL, a.BLK, a.TOV, a.PTS
FROM (
        (SELECT team, count(season) as c, sum(FG) AS FG, sum(FGA) AS FGA, sum(3P) AS 3P, sum(3PA) AS 3PA, sum(FT) AS FT, sum(FTA) AS FTA, sum(ORB) AS ORB, sum(DRB) AS DRB, sum(AST) AS AST, sum(STL) AS STL, sum(BLK) AS BLK, sum(TOV) AS TOV, sum(PTS) AS PTS
        FROM Stat
        GROUP BY team) a
        LEFT JOIN (select team, team_name, conference, count(playoffs) as playoffs, round(avg(W),2) as W, round(avg(L),2) as L, round(avg(SRS),2) as SRS, round(avg(pace),2) as pace, round(avg(ortg),2) as ortg, round(avg(drtg),2) as drtg
        from Team group by team) b
        on a.team = b.team

) WHERE a.team = t;





       END IF;
END; //

DELIMITER ;


