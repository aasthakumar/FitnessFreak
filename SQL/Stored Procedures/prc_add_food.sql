USE FitnessFreak;

-- =============================================
-- Author:      Aastha Kumar
-- Create date:  Nov, 27, 2017
-- Description:  Dietician can add food Procedure
-- Version: 0.1
-- =============================================

DROP PROCEDURE IF EXISTS prc_add_food;

DELIMITER $$
CREATE PROCEDURE prc_add_food (
				 IN User_ID							 	INT,
				 IN Food_Name 					 	Varchar(50),
				 IN Cal		 								Float,
				 IN Qntity							 		FLOAT,
				 IN Unit_OfMeasurement 		Varchar(50),
				 IN Food_Type						 	VARCHAR(500),
                 OUT msg 							VARCHAR(100)
) 
BEGIN

			DECLARE EXIT HANDLER FOR SQLEXCEPTION 
            BEGIN
				ROLLBACK; 
                RESIGNAL;-- rollback any changes made in the transaction
			END;
      START TRANSACTION; 
    
    -- only dietician can add diet chart 
		IF EXISTS( SELECT *  FROM USER WHERE userid = user_id AND UserRole ='DIETICIAN')
		THEN
					
					IF NOT EXISTS(SELECT * FROM Food 
							  WHERE FoodName = Food_Name) 
					THEN
								INSERT INTO Food(FoodName, Calories, Quantity,UnitOfMeasurement, FoodType)                 
								VALUES                                                                                                       
								(Food_Name,Cal, Qntity,Unit_OfMeasurement,Food_Type);
                  
								SET msg ='data inserted successfully'; 
					ELSE
								SET msg ='record already exist';
					END IF;
				
	ELSE
       
       SET msg = 'You are not authorized to add food';
       
	END IF;
   COMMIT;
			 
			  
END $$

DELIMITER ;


