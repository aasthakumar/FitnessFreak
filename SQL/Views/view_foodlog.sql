USE FitnessFreak;

-- =============================================
-- Author:      Aastha Kumar
-- Create date:  Nov, 27, 2017
-- Description:  foodlog view
-- Version: 0.1
-- =============================================

DROP VIEW IF EXISTS vw_foodlogdetails;


CREATE VIEW vw_foodlogdetails
AS
SELECT f.foodname, fl.quantity, fl.MealType, fl.DateOfConsumption, 
				fl.CaloriesConsumed, fl.RemainingCalories, u.DailyCalorieLimit ,u.UserId,fl.FoodLogID 
                FROM FoodLogDetails fl INNER JOIN Food f ON f.FoodID = fl.FoodID
				INNER JOIN User u On u.UserId = fl.UserID;

