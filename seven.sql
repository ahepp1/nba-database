DELIMITER //

DROP PROCEDURE IF EXISTS Seven //

CREATE PROCEDURE Seven(IN a int)
BEGIN
        select mvp, count(mvp) as num_mvp, height
from Award as A, Demographic as D
where A.mvp = D.name
group by mvp
order by num_mvp desc
limit a;
END; //

DELIMITER ;


