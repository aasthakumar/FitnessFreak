USE FitnessFreak;

-- =============================================
-- Author:      Aastha Kumar
-- Create date:  Nov, 28, 2017
-- Description:  Trigger to map DietChart to users
-- Version: 0.1
-- =============================================

DROP TRIGGER IF EXISTS MapExerciseToUser;

DELIMITER $$

CREATE TRIGGER MapExerciseToUser
    AFTER INSERT ON Exercise
    FOR EACH ROW 
BEGIN
    
		
		DECLARE exercise_id varchar(50);
       
        
		SELECT ExerciseID 
        INTO exercise_id FROM Exercise 
        WHERE ExerciseID = new.ExerciseID;
        
		INSERT INTO UserExerciseChart(IsActive ,DateRecommended ,UserID ,ExerciseID)
		SELECT 1,now(), UserID,exercise_id From User where UserType in('Platinum') ;
						

END$$

DELIMITER ;