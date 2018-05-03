USE FitnessFreak;

-- =============================================
-- Author:      Aastha Kumar
-- Create date:  Nov, 27, 2017
-- Description:  proc to Insert diet chart 
-- Version: 0.1
-- =============================================

DROP PROCEDURE IF EXISTS prc_add_exercisechart;

DELIMITER $$

CREATE PROCEDURE prc_add_exercisechart (	
				IN User_ID							INT,
				IN Exercise_Name				VARCHAR(50),
                IN Duration_InMinutes			INT,
                IN CaloriesBurn_Formula		FLOAT,
                OUT Msg								VARCHAR(100)
                )
BEGIN
	DECLARE Trainer_ID INT;
   
	DECLARE EXIT HANDLER FOR SQLEXCEPTION 
            BEGIN
				ROLLBACK; 
                RESIGNAL;-- rollback any changes made in the transaction
			END;
     
    START TRANSACTION; 
    
    -- only dietician can add diet chart 
    IF EXISTS( SELECT *  FROM USER WHERE userid = user_id AND UserRole ='TRAINER')
   THEN
					SELECT TrainerID INTO Trainer_ID FROM USER u INNER JOIN Trainer  t WHERE USERID = user_id
					AND t.EmailAddress = u.EmailAddress;
				
					IF NOT EXISTS(SELECT * FROM Exercise
							  WHERE ExerciseName = Exercise_Name) 
					THEN
								INSERT INTO Exercise(ExerciseName ,DurationInMinutes,CaloriesBurnFormula,TrainerID)
								VALUES
								(Exercise_Name,Duration_InMinutes,CaloriesBurn_Formula,Trainer_ID);
                  
								SET msg ='data inserted successfully'; 
					ELSE
								SET msg ='record already exist';
					END IF;
				
	ELSE
       
       SET msg = 'You are not authorized to add exercise chart';
       
	END IF;
    
      
    COMMIT;  
END


