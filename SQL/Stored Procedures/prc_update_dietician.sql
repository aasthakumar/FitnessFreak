USE FitnessFreak;

-- =============================================
-- Author:      Aastha Kumar
-- Create date:  Nov, 27, 2017
-- Description:  User SignUp Procedure
-- Version: 0.1
-- =============================================

DROP PROCEDURE IF EXISTS prc_update_dietician;

DELIMITER $$

CREATE PROCEDURE prc_update_dietician (
				IN User_ID							INT,
                IN Dietician_ID					INT,
				IN First_Name 					VARCHAR(50),
				IN Middle_Name 				VARCHAR(50),
				IN Last_Name 					VARCHAR(50),
				IN Pos 					     		VARCHAR(50),
                IN Email_Addr						VARCHAR(50),
                OUT Msg								VARCHAR(100)
                )
BEGIN

	DECLARE EXIT HANDLER FOR SQLEXCEPTION 
            BEGIN
				ROLLBACK; 
                RESIGNAL;-- rollback any changes made in the transaction
			END;
     
    START TRANSACTION; 
    
    IF EXISTS(SELECT *  FROM USER WHERE userid = user_id AND UserRole ='ADMIN')
    
    THEN
				IF NOT EXISTS(SELECT 1 FROM Dietician 
										  WHERE EmailAddress = Email_Addr) 
				THEN
							Update Dietician
                            Set FirstName = First_Name,
                            MiddleName = Middle_Name,
                            LastName = Last_Name,
                            Position = Pos,
                            EmailAddress = Email_Addr
                            Where DieticianId = Dietician_ID;
							
							  
							SET msg ='data updated successfully'; 
				ELSE
							SET msg = 'record already exist';
				END IF;
	ELSE
       
       SET msg = 'You are not authorized to add dietician';
       
	END IF;
      
    COMMIT;  
END


