USE FitnessFreak;

-- =============================================
-- Author:      Aastha Kumar
-- Create date:  Nov, 27, 2017
-- Description:  logic update user calorie limits
-- Version: 0.1
-- =============================================

DROP FUNCTION IF EXISTS fn_adjust_user_Weight;

DELIMITER $$


CREATE FUNCTION fn_adjust_user_Weight(User_ID int ,RetWeight float) RETURNS Float
NOT DETERMINISTIC
BEGIN
   DECLARE height_user FLOAT;
   DECLARE dob DATE;
   DECLARE HeightInInches FLOAT;
   DECLARE age INT;
   DECLARE DAILYCALLIMIT FLOAT;
   
			SELECT Height,DateOfBirth INTO height_user,dob  FROM USER WHERE userid = User_ID;
	
			SET HeightInInches = 0.393 * height_user;
                        
			SET AGE = YEAR(NOW())- year(dob);
                        -- set maintaince calorie limit 
			SET DAILYCALLIMIT = (655 + (4.35 * RetWeight) + (4.7 * HeightInInches) - (4.7 * AGE));
                        -- weight lose formula 
			SET DAILYCALLIMIT = .8 * DAILYCALLIMIT;
	
    RETURN DAILYCALLIMIT;
                        
   END $$
DELIMITER ;

