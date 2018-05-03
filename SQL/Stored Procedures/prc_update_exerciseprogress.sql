USE FitnessFreak;

-- =============================================
-- Author:      Aastha Kumar
-- Create date:  Nov, 27, 2017
-- Description:  add running Procedure
-- Version: 0.1
-- =============================================

DROP PROCEDURE IF EXISTS prc_update_exercise_progress;

DELIMITER $$

CREATE PROCEDURE prc_update_exercise_progress (
				IN Activity_ID								INT,
                IN Exercise_Name						Varchar(100),
                IN WorkOut_Duration					INT,
                IN DateOf_Activity						Date,
                OUT msg										Varchar(100)
                )
BEGIN
	
    DECLARE Exercise_ID INT;
	DECLARE EXIT HANDLER FOR SQLEXCEPTION 
            BEGIN
                SET msg = 'Some error occurred, try again later!';
				ROLLBACK; 
                RESIGNAL;-- rollback any changes made in the transaction
			END;
     
    START TRANSACTION; 
																																																		   
	 
		SELECT ExerciseID INTO Exercise_ID FROM Exercise WHERE ExerciseName = Exercise_Name;

		UPDATE ExerciseDailyActivity SET DateOfActivity = DateOf_Activity,
		ExerciseID = Exercise_ID,
		WorkOutDuration = WorkOut_Duration
        WHERE ActivityID = Activity_ID;
        
        SET   msg = 'Record updated successfully';
    COMMIT;  
END $$

DELIMITER ;


