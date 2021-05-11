DELIMITER //

DROP PROCEDURE IF EXISTS ShowCategoryLeadersAllTimeSeason //

CREATE PROCEDURE ShowCategoryLeadersAllTimeSeason(IN c VARCHAR(10))
BEGIN
     SELECT season, name, G, FG, FGA, round(FG/FGA, 2) AS FGP, 3P, 3PA, round(3P/3PA, 2) AS 3PP, FT, FTA, round(FT/FTA, 2) AS FTP, (ORB + DRB) AS REB, round((ORB + DRB)/G, 2) AS RPG, ORB, round(ORB/G, 2) AS ORBPG, DRB, round(DRB/G, 2) AS DRBPG, AST, round(AST/G, 2) AS APG, STL, round(STL/G, 2) AS SPG, BLK, round(BLK/G, 2) AS BPG, TOV, round(TOV/G, 2) AS TPG, PTS, round(PTS/G, 2) AS PPG
FROM Stat
ORDER BY
        CASE "PPG"
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


