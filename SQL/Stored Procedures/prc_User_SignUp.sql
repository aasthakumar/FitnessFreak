	USE FitnessFreak;

-- =============================================
-- Author:      Aastha Kumar
-- Create date:  Nov, 27, 2017
-- Description:  User SignUp Procedure
-- Version: 0.1
-- =============================================

DROP PROCEDURE IF EXISTS prc_user_signup;

DELIMITER $$
CREATE PROCEDURE prc_user_signup (
				IN FirstName 					VARCHAR(50),
				IN MiddleName 				VARCHAR(50),
				IN LastName 					VARCHAR(50),
				IN Password 					VARCHAR(128),
				IN Height 						FLOAT,
				IN AmountPaid 				FLOAT,
				IN WeightAtSignUp 		FLOAT,
				IN DateOfBirth 				DATE,
				IN StreetAddress 			VARCHAR(200),
				IN City 							VARCHAR(50),
				IN State 							VARCHAR(50),
				IN Country 						VARCHAR(50) ,
				IN ZipCode 						INT,
				IN EmailAddr					VARCHAR(50),
                IN GoalWeight					FLOAT,
                IN DaysToAchieveGoal	INT,
                OUT RetMsg					VARCHAR(50)
) 
BEGIN

			DECLARE UserType VARCHAR(50);
			DECLARE Tier VARCHAR(50);
			DECLARE CheckUser VARCHAR(50);
            DECLARE DailyCalLimit Float;
            DECLARE HeightInInches  FLOAT; -- needed to calculate daily calorie limit
            DECLARE AGE 	INT ; -- needed to calculate daily calorie limit
            DECLARE User_Role VARCHAR(100);
             -- Exception Handing 
			  
			DECLARE EXIT HANDLER FOR SQLEXCEPTION 
            BEGIN
				ROLLBACK;  -- rollback any changes made in the transaction
                RESIGNAL;
			END;
			
            START TRANSACTION;
             
			IF AmountPaid = '100'  THEN
					SET UserType = 'SILVER';
					SET Tier = 'Basic Subscription';
			ELSEIF (AmountPaid = '150')  THEN
					SET UserType ='GOLD';
					SET Tier = 'Diet Chart';
			ELSEIF (AmountPaid = '200')  THEN
					SET UserType ='PLATINUM';
					SET Tier = 'Diet & Exercise Chart';
			END IF;
			
            -- there will be 2 types of role - user and admin, everything added from UI would user, admin can only be inserted by another admin from sql script
            SET User_Role ='USER';
            
            IF NOT EXISTS (SELECT * FROM USER WHERE EmailAddress = EmailAddr)
            THEN
						SET HeightInInches = 0.393 * Height;
                        
                        SET AGE = YEAR(NOW())- year(DateOfBirth);
                        -- set maintaince calorie limit 
						SET DAILYCALLIMIT = (655 + (4.35 * WeightAtSignUp) + (4.7 * HeightInInches) - (4.7 * AGE));
                        
                        -- weight lose/gain formula 
                        IF GoalWeight > WeightAtSignUp THEN
								SET DAILYCALLIMIT = 1.2 * DAILYCALLIMIT;
                        ELSE
								SET DAILYCALLIMIT = .8 * DAILYCALLIMIT;
                        END IF;
                        
                        INSERT INTO USER(FirstName ,MiddleName ,LastName ,Password ,Height ,SignUpDate ,AmountPaid ,WeightAtSignUp ,MembershipValidTill ,DateOfBirth ,
						 StreetAddress ,City ,State ,Country ,ZipCode ,EmailAddress ,GoalWeight,UserType,Tier,DailyCalorieLimit,DaysToAchieveGoal,UserRole )
						VALUES
						(FirstName,MiddleName, LastName, MD5(Password), Height, NOW(), AmountPaid, WeightAtSignUp, DATE_ADD(NOW(), INTERVAL 1 YEAR) ,DateOfBirth,
						 StreetAddress, City ,State ,Country ,ZipCode ,EmailAddr ,GoalWeight, UserType,Tier,DAILYCALLIMIT,DaysToAchieveGoal,User_Role);
                         
                         SET RetMsg = 'User Successfully Added';
                         
              ELSE
						
                        SET RetMsg = 'User Already Exist';
                        
              END IF;
            COMMIT;
END $$

DELIMITER ;