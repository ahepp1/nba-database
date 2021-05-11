DELIMITER //

DROP PROCEDURE IF EXISTS ShowTeamLeadersAllTime //

CREATE PROCEDURE ShowTeamLeadersAllTime(IN c VARCHAR(10))
BEGIN

SELECT  a.team, a.FG, a.FGA, round(a.FG/a.FGA, 2) AS FGP, a.3P, a.3PA, round(a.3P/a.3PA, 2) AS 3PP, a.FT, a.FTA, round(a.FT/a.FTA, 2) AS FTP, (a.ORB + a.DRB) AS REB, a.ORB, a.DRB, a.AST, a.STL, a.BLK, a.TOV, a.PTS
FROM (
        (SELECT team, count(season) as c, sum(FG) AS FG, sum(FGA) AS FGA, sum(3P) AS 3P, sum(3PA) AS 3PA, sum(FT) AS FT, sum(FTA) AS FTA, sum(ORB) AS ORB, sum(DRB) AS DRB, sum(AST) AS AST, sum(STL) AS STL, sum(BLK) AS BLK, sum(TOV) AS TOV, sum(PTS) AS PTS
        FROM Stat
        GROUP BY team) a

) ORDER BY
        CASE c
        WHEN '3P' THEN 3P
        WHEN '3PA' THEN 3PA
       WHEN '3PP' THEN 3PP
       WHEN 'FG' THEN FG
       WHEN 'FGA' THEN FGA
       WHEN 'FGP' THEN FGP
       WHEN 'FT' THEN FT
       WHEN 'FTA' THEN FTA
       WHEN 'FTP' THEN FTP
       WHEN 'REB' THEN REB
       WHEN 'ORB' THEN ORB
       WHEN 'DRB' THEN DRB
       WHEN 'AST' THEN AST
       WHEN 'STL' THEN STL
       WHEN 'BLK' THEN BLK
       WHEN 'TOV' THEN TOV
       WHEN 'PTS' THEN PTS
       ELSE NULL
       END DESC;

END; //

DELIMITER ;


