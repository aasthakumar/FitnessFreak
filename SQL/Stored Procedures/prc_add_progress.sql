USE FitnessFreak;

-- =============================================
-- Author:      Aastha Kumar
-- Create date:  Nov, 27, 2017
-- Description:  update offers
-- Version: 0.1
-- =============================================

DROP PROCEDURE IF EXISTS prc_add_progress;

DELIMITER $$

CREATE PROCEDURE prc_add_progress (
				IN      User_ID										INT,
                IN      Current_Weight							INT,
                OUT  Msg											VARCHAR(100)
                )
BEGIN
	
    Declare lastweight Float;
    Declare Goal Float; -- see  if user wants to gain or lose;
    
	DECLARE EXIT HANDLER FOR SQLEXCEPTION 
            BEGIN
				ROLLBACK; 
                RESIGNAL;-- rollback any changes made in the transaction
			END;
     
    START TRANSACTION; 
    -- only admin can add offers
   
		Select CurrentWeight into lastweight From Progress where UserId = User_Id 
        order by ProgressDate desc Limit 1;

       
        Select (GoalWeight - WeightAtSignUp) into goal from user where UserID = User_Id;
        IF goal < 0 THEN
					IF Current_Weight < lastweight Then 	
					
					SET msg =CONCAT('Good job, you lost ' , ( lastweight - Current_Weight) , ' pounds'); 
                    
					ELSE
							SET msg = 'We know that you are working hard,little bit more effort required';
					END IF;
		ELSE
        	IF Current_Weight > lastweight Then 	
					
					SET msg =CONCAT('Good job, you gained ' , (Current_Weight - lastweight) , ' pounds'); 
                    
					ELSE
							SET msg = 'We know that you are working hard,little bit more effort required';
					END IF;
        END IF;
		 INSERT Into progress(CurrentWeight,ProgressDate,EncouragingMessages,UserID) values(Current_Weight, now(), msg,User_ID);
    COMMIT;  
END$$
DELIMITER ;
