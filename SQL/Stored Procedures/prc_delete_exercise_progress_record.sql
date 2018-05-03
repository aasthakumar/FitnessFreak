USE FitnessFreak;

-- =============================================
-- Author:      Aastha Kumar
-- Create date:  Nov, 27, 2017
-- Description:  add running Procedure
-- Version: 0.1
-- =============================================

DROP PROCEDURE IF EXISTS prc_delete_exercise_progress;

DELIMITER $$

CREATE PROCEDURE prc_delete_exercise_progress (
				IN Activity_ID								INT,
                OUT msg										Varchar(100)
                )
BEGIN
	
	DECLARE EXIT HANDLER FOR SQLEXCEPTION 
            BEGIN
                 SET msg = 'Some error occurred, try again later';
				ROLLBACK; 
                RESIGNAL;-- rollback any changes made in the transaction
			END;
     
    START TRANSACTION; 
																																																		

		Delete from ExerciseDailyActivity 
        WHERE ActivityID = Activity_ID;
        
        SET msg = 'Record deleted successfully';
        
    COMMIT;  
END $$

DELIMITER ;


