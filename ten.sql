DELIMITER //

DROP PROCEDURE IF EXISTS Ten//

CREATE PROCEDURE Ten()
BEGIN
        
select avg(weight / (height * height) * 703) as BMI, year(birth_date) as birth_year
from Demographic
group by birth_year;
END; //

DELIMITER ;


