USE FitnessFreak;

-- =============================================
-- Author:      Aastha Kumar
-- Create date:  Nov, 27, 2017
-- Description:  add running Procedure
-- Version: 0.1
-- =============================================

DROP PROCEDURE IF EXISTS prc_view_progress_exerciseprogress;

DELIMITER $$

CREATE PROCEDURE prc_view_progress_exerciseprogress (
				IN User_ID									INT,
                IN DateOfAct								Date
                )
BEGIN
	
    declare Calories_Burned FLOAT;
	DECLARE EXIT HANDLER FOR SQLEXCEPTION 
            BEGIN
				ROLLBACK; 
                RESIGNAL;-- rollback any changes made in the transaction
			END;
     
    START TRANSACTION; 
																																																		   
	 
       
	select SUM(CaloriesBurned)  into Calories_Burned from vw_exerciselogdetails e  
	where UserID = USER_ID and  Date(e.DateofActivity) = DateOfAct;
     
	SELECT ActivityID, Calories_Burned , e.exercisename,e.WorkoutDurationInMinutes, e.CaloriesBurned ,e.DateOfActivity, e.UserID 
    from vw_exerciselogdetails e  
	where UserID = USER_ID and  Date(e.DateofActivity) = DateOfAct;
    
    COMMIT;  
END $$

DELIMITER ;


