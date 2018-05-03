USE FitnessFreak;

-- =============================================
-- Author:      Aastha Kumar
-- Create date:  Nov, 27, 2017
-- Description:  add running Procedure
-- Version: 0.1
-- =============================================

DROP PROCEDURE IF EXISTS prc_view_foodprogress;

DELIMITER $$

CREATE PROCEDURE prc_view_foodprogress (
				IN User_ID									INT,
                IN DateOfAct								Date
                )
BEGIN
	
    declare Calories_Consumed FLOAT;
	DECLARE EXIT HANDLER FOR SQLEXCEPTION 
            BEGIN
				ROLLBACK; 
                RESIGNAL;-- rollback any changes made in the transaction
			END;
     
    START TRANSACTION; 
																																																		   
	 
       
	select SUM(CaloriesConsumed)  into Calories_Consumed from vw_foodlogdetails e  
	where UserID = USER_ID and  Date(e.DateOfConsumption) = DateOfAct;
     
	SELECT Calories_Consumed as TotalCaloriesConsumedInDay, e.foodname as FoodName, e.quantity as Quantity, 
    e.MealType as MealType, e.DateOfConsumption, 
				e.CaloriesConsumed, e.DailyCalorieLimit, e.FoodLogID
    from vw_foodlogdetails e  
	where UserID = USER_ID and  Date(e.DateOfConsumption) = DateOfAct;
    
    COMMIT;  
END $$

DELIMITER ;

