DELIMITER //

DROP PROCEDURE IF EXISTS Thirteen//

CREATE PROCEDURE Thirteen()
BEGIN
        select A.season, A.mvp, S.AST, S.PTS
from Award as A, Stat as S 
where A.season = S.season and mvp = rookie_of_the_year and S.name = A.mvp;

END; //

DELIMITER ;


