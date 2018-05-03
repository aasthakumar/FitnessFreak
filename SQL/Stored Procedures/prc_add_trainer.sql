USE FitnessFreak;

-- =============================================
-- Author:      Aastha Kumar
-- Create date:  Nov, 27, 2017
-- Description:  proc to Insert Trainer 
-- Version: 0.1
-- =============================================

DROP PROCEDURE IF EXISTS prc_add_trainer;

DELIMITER $$

CREATE PROCEDURE prc_add_trainer (	
				IN User_ID							INT,
				IN First_Name 					VARCHAR(50),
				IN Middle_Name 				VARCHAR(50),
				IN Last_Name 					VARCHAR(50),
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
    -- only admin can add trainer 
    IF EXISTS( SELECT *  FROM USER WHERE userid = user_id AND UserRole ='ADMIN')
   THEN
 
			IF NOT EXISTS(SELECT * FROM Trainer 
							  WHERE EmailAddress = Email_Addr) 
				THEN
								INSERT INTO Trainer(FirstName ,MiddleName ,LastName,EmailAddress )
								VALUES
								(First_Name ,Middle_Name ,Last_Name,Email_Addr);
                  
								SET msg ='data inserted successfully'; 
				ELSE
								SET msg = 'record already exist';
			END IF;
       
	ELSE
       
       SET msg = 'You are not authorized to add trainer';
       
	END IF;
    
      
    COMMIT;  
END


