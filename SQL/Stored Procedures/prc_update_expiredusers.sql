USE FitnessFreak;

-- =============================================
-- Author:      Aastha Kumar
-- Create date:  Nov, 27, 2017
-- Description:  update_expired_members
-- Version: 0.1
-- =============================================

DROP PROCEDURE IF EXISTS prc_update_expired_members;

DELIMITER $$

CREATE PROCEDURE prc_update_expired_members (
				IN     User_ID				INT,
                OUT Msg						VARCHAR(100)
                )
BEGIN

	DECLARE EXIT HANDLER FOR SQLEXCEPTION 
            BEGIN
				ROLLBACK; 
                RESIGNAL;-- rollback any changes made in the transaction
			END;
     
    START TRANSACTION; 
    -- only admin can add offers
     IF EXISTS(SELECT *  FROM USER WHERE userid = User_ID AND UserRole ='ADMIN')
    THEN
    
			UPDATE  USER
			SET UserType = 'NONE', Tier = 'Membership Expired'
			Where MembershipValidTill <= NOW(); 
            
            SET Msg ='Records Updated Successfully';
	 ELSE
			SET Msg = 'You are not authorized to run this action';
     END IF;

COMMIT;  
END 
