DELIMITER //

DROP PROCEDURE IF EXISTS ShowPlayerStatsTotals //

CREATE PROCEDURE ShowPlayerStatsTotals(IN n VARCHAR(40))
BEGIN
        IF EXISTS(SELECT * FROM Stat WHERE name = n) THEN
	   SELECT a.name, a.G, a.FG, a.FGA, round(a.FG/a.FGA, 2) AS FGP, a.3P, a.3PA, round(a.3P/a.3PA, 2) AS 3PP, a.FT, a.FTA, round(a.FT/a.FTA, 2) AS FTP, (a.ORB + a.DRB) AS REB, round((ORB + DRB)/G, 2) AS RPG, a.ORB, round(ORB/G, 2) AS ORBPG, a.DRB, round(DRB/G, 2) AS DRBPG, a.AST, round(AST/G, 2) AS APG, a.STL, round(STL/G, 2) AS SPG, a.BLK, round(BLK/G, 2) AS BPG, a.TOV, round(TOV/G, 2) AS TPG, a.PTS, round(PTS/G, 2) AS PPG
FROM (
        (SELECT name, sum(G) AS G, sum(FG) AS FG, sum(FGA) AS FGA, sum(3P) AS 3P, sum(3PA) AS 3PA, sum(FT) AS FT, sum(FTA) AS FTA, sum(ORB) AS ORB, sum(DRB) AS DRB, sum(AST) AS AST, sum(STL) AS STL, sum(BLK) AS BLK, sum(TOV) AS TOV, sum(PTS) AS PTS
        FROM Stat
        GROUP BY name) a
) WHERE name = n;
	  
        END IF;
END; //

DELIMITER ;


