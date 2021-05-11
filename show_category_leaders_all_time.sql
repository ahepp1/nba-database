DELIMITER //

DROP PROCEDURE IF EXISTS ShowCategoryLeadersAllTime //

CREATE PROCEDURE ShowCategoryLeadersAllTime(IN c VARCHAR(10))
BEGIN
     SELECT a.name, a.G, a.FG, a.FGA, round(a.FG/a.FGA, 2) AS FGP, a.3P, a.3PA, round(a.3P/a.3PA, 2) AS 3PP, a.FT, a.FTA, round(a.FT/a.FTA, 2) AS FTP, (a.ORB + a.DRB) AS REB, round((ORB + DRB)/G, 2) AS RPG, a.ORB, round(ORB/G, 2) AS ORBPG, a.DRB, round(DRB/G, 2) AS DRBPG, a.AST, round(AST/G, 2) AS APG, a.STL, round(STL/G, 2) AS SPG, a.BLK, round(BLK/G, 2) AS BPG, a.TOV, round(TOV/G, 2) AS TPG, a.PTS, round(PTS/G, 2) AS PPG
FROM (
        (SELECT name, sum(G) AS G, sum(FG) AS FG, sum(FGA) AS FGA, sum(3P) AS 3P, sum(3PA) AS 3PA, sum(FT) AS FT, sum(FTA) AS FTA, sum(ORB) AS ORB, sum(DRB) AS DRB, sum(AST) AS AST, sum(STL) AS STL, sum(BLK) AS BLK, sum(TOV) AS TOV, sum(PTS) AS PTS
        FROM Stat
        GROUP BY name) a
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
       WHEN 'RPG' THEN RPG
       WHEN 'ORB' THEN ORB
       WHEN 'DRB' THEN DRB
       WHEN 'ORBPG' THEN ORBPG
       WHEN 'DRBPG' THEN DRBPG
       WHEN 'AST' THEN AST
       WHEN 'APG' THEN APG
       WHEN 'STL' THEN STL
       WHEN 'SPG' THEN SPG
       WHEN 'BLK' THEN BLK
       WHEN 'BPG' THEN BPG
       WHEN 'TOV' THEN TOV
       WHEN 'TPG' THEN TPG
       WHEN 'PTS' THEN PTS
       WHEN 'PPG' THEN PPG
       ELSE NULL
       END DESC;
END; //

DELIMITER ;


