USE FitnessFreak;

-- =============================================
-- Author:      Aastha Kumar
-- Create date:  Nov, 27, 2017
-- Description:  foodlog update Procedure
-- Version: 0.1
-- =============================================

DROP PROCEDURE IF EXISTS prc_foodlog_delete;

DELIMITER $$
CREATE PROCEDURE prc_foodlog_delete (
				IN FoodLog_Id				INT,
				OUT RetMsg				VARCHAR(300)
) 
BEGIN

            DECLARE RemainingCalAsPerLastRecord FLOAT;
			DECLARE Calories_Consumed FLOAT;
             -- Exception Handing 
			  
			DECLARE EXIT HANDLER FOR SQLEXCEPTION 
            BEGIN
				 SET RetMsg = 'Error Occurred. Try again later';
				ROLLBACK;  -- rollback any changes made in the transaction
                RESIGNAL;
			END;
			
            START TRANSACTION;
            
         
            -- update remaining calories as this record will be deleted
            SELECT RemainingCalForDay, CaloriesConsumed INTO RemainingCalAsPerLastRecord, Calories_Consumed FROM FoodLogDetails WHERE USERID = USER_ID
            AND DATE(NOW()) = Date(DateOfConsumption) AND FoodLogID = FoodLog_Id;
            
            IF RemainingCalAsPerLastRecord is not null
            THEN
				SET RemainingCalAsPerLastRecord = RemainingCalAsPerLastRecord + Calories_Consumed;
			ELSE
				SELECT DailyCalorieLimit into RemainingCalAsPerLastRecord from FoodLogDetails fd join User u on fd.UserID = u.userID and FoodLogID = FoodLog_Id;
            END IF;
            
			DELETE FROM FoodLogDetails where FoodLogID = FoodLog_Id;
                         
			IF RemainingCalForDay > 0
					THEN
                         SET RetMsg = CONCAT('You can consume ' , RemainingCalAsPerLastRecord , ' more calories today.');
			ELSE
						SET  RetMsg = 'Oops you have consumed all the calories for today.';
             END IF;
             
            COMMIT;
END $$

DELIMITER ;