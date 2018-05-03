USE FitnessFreak;

-- =============================================
-- Author:      Aastha Kumar
-- Create date:  Nov, 27, 2017
-- Description:  proc to Insert diet chart 
-- Version: 0.1
-- =============================================

DROP PROCEDURE IF EXISTS prc_add_dietchart;

DELIMITER $$

CREATE PROCEDURE prc_add_dietchart (	
				IN User_ID							INT,
				IN Descp								VARCHAR(50),
                IN CaloriesPerChart			FLOAT,
                OUT Msg								VARCHAR(100)
                )
BEGIN
	DECLARE Dietician_ID INT;
   
	DECLARE EXIT HANDLER FOR SQLEXCEPTION 
            BEGIN
				ROLLBACK; 
                RESIGNAL;-- rollback any changes made in the transaction
			END;
     
    START TRANSACTION; 
    
    -- only dietician can add diet chart 
    IF EXISTS( SELECT *  FROM USER WHERE userid = user_id AND UserRole ='DIETICIAN')
   THEN
					SELECT DieticianID INTO Dietician_ID FROM USER u INNER JOIN dietician  d WHERE USERID = user_id
					AND d.EmailAddress = u.EmailAddress;
				
					IF NOT EXISTS(SELECT * FROM DietChart 
							  WHERE Description = Descp) 
					THEN
								INSERT INTO DietChart(Description ,DieticianID,CaloriesPerChart)
								VALUES
								(Descp,Dietician_ID,CaloriesPerChart);
                  
								SET msg ='data inserted successfully'; 
					ELSE
								SET msg ='record already exist';
					END IF;
				
	ELSE
       
       SET msg = 'You are not authorized to add diet chart';
       
	END IF;
    
      
    COMMIT;  
END


