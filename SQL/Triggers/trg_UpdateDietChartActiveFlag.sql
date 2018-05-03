USE FitnessFreak;

-- =============================================
-- Author:      Aastha Kumar
-- Create date:  Nov, 28, 2017
-- Description:  Trigger to UpdateDietChartActiveFlag if dailycalorie limit of user drop below dietchart limit
-- Version: 0.1
-- =============================================

DROP TRIGGER IF EXISTS UpdateDietChartActiveFlag;

DELIMITER $$

CREATE TRIGGER UpdateDietChartActiveFlag
    AFTER UPDATE ON USER
    FOR EACH ROW 
BEGIN
    
		DECLARE user_id int;
		DECLARE newcallimit varchar(50);
        
        
		SELECT USERID,DailyCalorieLimit into  user_id,newcallimit FROM User 
        WHERE USERID = new.UserID;
        
        UPDATE UserDietChart dc JOIN dietchart d ON dc.portionoffood = d.description
        SET dc.IsActive = 0 
        WHERE dc.UserID = user_id and d.caloriesperchart > newcallimit;
        				

END$$

DELIMITER ;