USE FitnessFreak;

-- =============================================
-- Author:      Aastha Kumar
-- Create date:  Nov, 27, 2017
-- Description:  proc to Insert diet chart 
-- Version: 0.1
-- =============================================

DROP PROCEDURE IF EXISTS prc_ViewExerciseChartRecommendation;

DELIMITER $$

CREATE PROCEDURE prc_ViewExerciseChartRecommendation (	
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
    
   
    IF EXISTS( SELECT *  FROM USER WHERE userid = User_ID AND UserType in ('Platinum'))
   THEN
				select e.ExerciseName, e.CaloriesBurnFormula,uc.DateRecommended from UserExerciseChart uc join Exercise e 
                on uc.ExerciseID = e.ExerciseID
                where userid = User_ID and IsActive = 1;
				
	ELSE
       
       SET msg = 'You are not authorized to view exercise chart';
       
	END IF;
    
      
    COMMIT;  
END


