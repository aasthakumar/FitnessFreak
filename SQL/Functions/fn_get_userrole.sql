USE FitnessFreak;

-- =============================================
-- Author:      Aastha Kumar
-- Create date:  Nov, 27, 2017
-- Description:  get user role - admin, user, trainer, dietician
-- Version: 0.1
-- =============================================

DROP FUNCTION IF EXISTS fn_get_userrole;

DELIMITER $$


CREATE FUNCTION fn_get_userrole(User_ID int) RETURNS Varchar(20)
 DETERMINISTIC
BEGIN
   DECLARE User_Role Varchar(20);
  
   
			SELECT UserRole INTO User_Role  FROM USER WHERE userid = User_ID;
	
		
	
    RETURN User_Role;
                        
   END $$
DELIMITER ;


