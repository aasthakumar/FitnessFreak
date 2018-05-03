USE FitnessFreak;

-- =============================================
-- Author:      Aastha Kumar
-- Create date:  Nov, 27, 2017
-- Description:  User SignIn Procedure
-- Version: 0.1
-- =============================================

DROP PROCEDURE IF EXISTS prc_user_signin;

DELIMITER $$
CREATE PROCEDURE prc_user_signin (
				IN Email_Address 			VARCHAR(50),
				IN Pswd 							VARCHAR(128),
                OUT User_ID					Varchar(50)
) 
BEGIN
			DECLARE Current_Weight FLOAT;
            DECLARE WeightAt_SignUp Float;
            DECLARE NewCalLimit FLOAT;
			 -- Exception Handing 
			  DECLARE EXIT HANDLER FOR SQLEXCEPTION SELECT 'SQLException encountered';
			 
             IF NOT Exists(
							SELECT userid
							FROM	USER	WHERE	EmailAddress = Email_Address
							AND Password = MD5(Pswd)) 
			THEN
				
					SET User_ID ='Incorrect UserName Password';
			
            ELSE
						
                        -- SET msg = 'Successful Login';
						 SELECT UserID INTO User_ID FROM USER WHERE EmailAddress = Email_Address	AND Password = MD5(Pswd);
                         
                         -- adjust user dailycalcorie consumption if his current weight is less than registered weight
                         -- this logic is put here as the trigger was causing a cycle, user table calls trigger on progress and progress table was suppose to call on user
                         
                         SELECT CurrentWeight INTO Current_Weight FROM progress WHERE UserID = User_ID AND DATE(ProgressDate) < DATE(Now());
                         IF Current_Weight IS NOT NULL 
                         THEN
								SELECT WeightAtSignUp into WeightAt_SignUp FROM USER WHERE userID = User_ID;
                                
                                IF WeightAt_SignUp != Current_Weight
                                THEN
                                 
										SELECT   fn_adjust_user_Weight(User_ID,Current_Weight) INTO NewCalLimit;
                                 
										UPDATE USER SET DailyCalorieLimit = NewCalLimit WHERE userId = user_id;
                                END If;
                         END IF;
            
              END IF;
END $$

DELIMITER ;


