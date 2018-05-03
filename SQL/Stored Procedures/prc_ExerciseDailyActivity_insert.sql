USE FitnessFreak;

-- =============================================
-- Author:      Aastha Kumar
-- Create date:  Nov, 27, 2017
-- Description:  exerciselog insert Procedure
-- Version: 0.1
-- =============================================

DROP PROCEDURE IF EXISTS prc_ExerciseDailyActivity_insert;

DELIMITER $$
CREATE PROCEDURE prc_ExerciseDailyActivity_insert (
				IN  WorkoutDurationInMinutes	 				INT,
                IN  USER_ID				INT,
				IN  Exercise_ID 			INT,
				OUT RetMsg				VARCHAR(300)
) 
BEGIN

			DECLARE CaloriesBurn_Formula FLOAT;
            DECLARE Duration_InMinutes  INT;
            DECLARE CalBurned FLOAT;
             -- Exception Handing 
			  
			DECLARE EXIT HANDLER FOR SQLEXCEPTION 
            BEGIN
				 SET RetMsg = 'Error Occurred. Try again later';
				ROLLBACK;  -- rollback any changes made in the transaction
                RESIGNAL;
			END;
			
            START TRANSACTION;
            
           
			SELECT  CaloriesBurnFormula, DurationInMinutes  INTO CaloriesBurn_Formula, Duration_InMinutes
            FROM Exercise WHERE ExerciseID= Exercise_ID;
            
            SET CalBurned = (CaloriesBurn_Formula/ Duration_InMinutes) * WorkoutDurationInMinutes;
            
              
           
			INSERT INTO ExerciseDailyActivity(DateOfActivity ,WorkoutDurationInMinutes ,UserID ,ExerciseID,CaloriesBurned)
				VALUES
				(Now(), WorkoutDurationInMinutes, User_ID,Exercise_ID,CalBurned);
            
            SET RetMsg = CONCAT('Good Work, You have just burned ', CalBurned, ' Calories');
             
            COMMIT;
END $$

DELIMITER ;