USE FitnessFreak;

-- =============================================
-- Author:      Aastha Kumar
-- Create date:  Nov, 27, 2017
-- Description:  get user type - silver, gold, platinum
-- Version: 0.1
-- =============================================

DROP FUNCTION IF EXISTS fn_get_usertype;

DELIMITER $$


CREATE FUNCTION fn_get_usertype(User_ID int) RETURNS Varchar(20)
 DETERMINISTIC
BEGIN
   DECLARE User_Type Varchar(20);
  
   
			SELECT UserType INTO User_Type  FROM USER WHERE userid = User_ID;
	
		
	
    RETURN User_Type;
                        
   END $$
DELIMITER ;


