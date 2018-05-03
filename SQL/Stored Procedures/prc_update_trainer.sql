USE FitnessFreak;

-- =============================================
-- Author:      Aastha Kumar
-- Create date:  Nov, 27, 2017
-- Description:  update trainer
-- Version: 0.1
-- =============================================

DROP PROCEDURE IF EXISTS prc_update_Trainer;

DELIMITER $$

CREATE PROCEDURE prc_update_Trainer (
				IN User_ID									INT,
				IN Trainer_ID								INT,
                IN First_Name								Varchar(50),
                IN Middle_Name							Varchar(50),
                IN Last_Name								Varchar(50),
                IN Email_Addr								Varchar(50),
                OUT msg										Varchar(100)
                )
BEGIN
	
	DECLARE EXIT HANDLER FOR SQLEXCEPTION 
            BEGIN
				ROLLBACK; 
                RESIGNAL;-- rollback any changes made in the transaction
			END;
     
    START TRANSACTION; 
    -- only admin can update trainer 
    IF EXISTS( SELECT *  FROM USER WHERE userid = User_ID AND UserRole ='ADMIN')
   THEN
 
			IF NOT EXISTS(SELECT * FROM Trainer 
							  WHERE EmailAddress = Email_Addr) 
				THEN
								Update Trainer
                                Set FirstName = First_Name,
                                MiddleName = Middle_Name,
                                LastName = Last_Name,
                                EmailAddress = Email_Addr
								Where TrainerID = Trainer_ID;
                  
								SET msg ='data updated successfully'; 
				ELSE
								SET msg = 'record already exist';
			END IF;
       
	ELSE
       
       SET msg = 'You are not authorized to add trainer';
       
	END IF;
    
      
    COMMIT;  
END


