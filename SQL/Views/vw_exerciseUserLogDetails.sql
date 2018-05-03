USE FitnessFreak;

-- =============================================
-- Author:      Aastha Kumar
-- Create date:  Nov, 27, 2017
-- Description:  foodlog view
-- Version: 0.1
-- =============================================

DROP VIEW IF EXISTS vw_exerciselogdetails;


CREATE VIEW vw_exerciselogdetails
AS
	SELECT ed.ActivityID, e.exercisename, ed.WorkoutDurationInMinutes, ed.CaloriesBurned ,ed.DateOfActivity, ed.UserID
    FROM EXERCISE e INNER JOIN ExerciseDailyActivity ed ON e.ExerciseID  = ed.ExerciseID;
    
    



