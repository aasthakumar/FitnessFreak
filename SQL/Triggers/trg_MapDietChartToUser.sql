USE FitnessFreak;

-- =============================================
-- Author:      Aastha Kumar
-- Create date:  Nov, 28, 2017
-- Description:  Trigger to map DietChart to users
-- Version: 0.1
-- =============================================

DROP TRIGGER IF EXISTS MapDietChartToUser;

DELIMITER $$

CREATE TRIGGER MapDietChartToUser
    AFTER INSERT ON DietChart
    FOR EACH ROW 
BEGIN
    
		DECLARE chart_desc varchar(50);
		DECLARE calories_perchart varchar(50);
       
        
		SELECT description, caloriesperchart 
        INTO chart_desc,calories_perchart FROM DietChart 
        WHERE DietChartID = new.DietChartID;
        
		INSERT INTO UserDietChart(PortionOfFood ,DateRecommended ,IsActive ,UserID)
		SELECT chart_desc,now(), 1, UserID From User where UserType in('Gold','Platinum') and DailyCalorieLimit > calories_perchart;
						

END$$

DELIMITER ;