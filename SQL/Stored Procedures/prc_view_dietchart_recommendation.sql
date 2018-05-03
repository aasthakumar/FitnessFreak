USE FitnessFreak;

-- =============================================
-- Author:      Aastha Kumar
-- Create date:  Nov, 27, 2017
-- Description:  proc to Insert diet chart 
-- Version: 0.1
-- =============================================

DROP PROCEDURE IF EXISTS prc_ViewDietChartRecommendation;

DELIMITER $$

CREATE PROCEDURE prc_ViewDietChartRecommendation (	
				IN User_ID							INT,
                OUT msg								varchar(100)
                )
BEGIN

   
	DECLARE EXIT HANDLER FOR SQLEXCEPTION 
            BEGIN
				ROLLBACK; 
                RESIGNAL;-- rollback any changes made in the transaction
			END;
     
    START TRANSACTION; 
    
   
    IF EXISTS( SELECT *  FROM USER WHERE userid = User_ID AND UserType in ('Gold','Platinum'))
   THEN
				select * from userdietchart where userid = User_ID and isactive = 1;
				
	ELSE
       
       SET msg = 'You are not authorized to view diet chart';
       
	END IF;
    
      
    COMMIT;  
END


