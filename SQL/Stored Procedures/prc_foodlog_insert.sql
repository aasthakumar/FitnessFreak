USE FitnessFreak;

-- =============================================
-- Author:      Aastha Kumar
-- Create date:  Nov, 27, 2017
-- Description:  foodlog insert Procedure
-- Version: 0.1
-- =============================================

DROP PROCEDURE IF EXISTS prc_foodlog_insert;

DELIMITER $$
CREATE PROCEDURE prc_foodlog_insert (
				IN  Quant	 				FLOAT,
                IN Meal_Type				VARCHAR(10),
				IN  USER_ID 				INT,
                IN  Food_ID					INT,
				OUT RetMsg				VARCHAR(300)
) 
BEGIN

			DECLARE DailyCalLimit VARCHAR(300);
            DECLARE CalPerFoodItem  FLOAT;
            DECLARE QuantityPerFoodItem FLOAT;
            DECLARE CalConsumedPerMeal FLOAT;
            DECLARE RemainingCalAsPerLastRecord FLOAT;
            DECLARE RemainingCalForDay FLOAT;
            DECLARE SumOfCalConsumed FLOAT DEFAULT 0;
            DECLARE CalBurnedInDay FLOAT DEFAULT 0;
             -- Exception Handing 
			  
			DECLARE EXIT HANDLER FOR SQLEXCEPTION 
            BEGIN
				 SET RetMsg = 'Error Occurred. Try again later';
				ROLLBACK;  -- rollback any changes made in the transaction
                RESIGNAL;
			END;
			
            START TRANSACTION;
            
            -- check if user weight is greater or less than his signupweight
			SELECT  DailyCalorieLimit  INTO DailyCalLimit
            FROM USER WHERE USERID= USER_ID;
            
            SELECT Calories, Quantity INTO CalPerFoodItem, QuantityPerFoodItem FROM Food 
            WHERE FoodID = Food_ID;
            
            -- calories consumed as per latest record
            SET CalConsumedPerMeal = (CalPerFoodItem/ QuantityPerFoodItem) * Quant;
            
            -- SUM OF calories consumed in day
            SELECT SUM(CaloriesConsumed) into SumOfCalConsumed FROM FoodLogDetails WHERE USERID = USER_ID
            AND DATE(NOW()) = Date(DateOfConsumption);
            
            
            -- sum of calories burned in day
            SELECT SUM(CaloriesBurned ) INTO CalBurnedInDay FROM EXERCISEDAILYACTIVITY WHERE USERID = USER_ID
            AND DATE(NOW()) = Date(DateOfActivity);
            
            -- remaining calories = daily limit - calories consumed just now - calories consumed entire day + calories burned during exercise
					
                    IF SumOfCalConsumed is NULL THEN
                    SET SumOfCalConsumed = 0;
                    END IF;
                    
					IF CalBurnedInDay is NULL THEN
                    SET CalBurnedInDay = 0;
                    END IF;
                    
					SET RemainingCalForDay = DailyCalLimit - CalConsumedPerMeal - SumOfCalConsumed + CalBurnedInDay;
				
					
				INSERT INTO FoodLogDetails(Quantity ,DateOfConsumption ,MealType ,UserID,FoodID,CaloriesConsumed,RemainingCalories)
				VALUES
				(Quant,Now(), Meal_Type, User_ID,Food_ID,CalConsumedPerMeal,RemainingCalForDay);
                         
			IF RemainingCalForDay > 0
					THEN
                         SET RetMsg = CONCAT('You can consume ' , RemainingCalForDay , ' more calories today.');
			ELSE
						SET  RetMsg = 'Oops you have consumed all the calories for today.';
             END IF;
             
            COMMIT;
END $$

DELIMITER ;