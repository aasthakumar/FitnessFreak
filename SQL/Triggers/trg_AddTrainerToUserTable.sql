USE FitnessFreak;

-- =============================================
-- Author:      Aastha Kumar
-- Create date:  Nov, 28, 2017
-- Description:  Trigger to update UserType and Tier for users whose membership expired
-- Version: 0.1
-- =============================================

DROP TRIGGER IF EXISTS AddTrainerToUserTable;

DELIMITER $$

CREATE TRIGGER AddTrainerToUserTable
    AFTER INSERT ON Trainer
    FOR EACH ROW 
BEGIN
    
		DECLARE f_name varchar(50);
		DECLARE m_name varchar(50);
        DECLARE l_name varchar(50);
        DECLARE email_addr varchar(50);
        
		SELECT firstname, middlename, lastname,emailaddress 
        INTO f_name,m_name,l_name,email_addr FROM trainer 
        WHERE trainerid = new.trainerid;
        
		INSERT INTO USER(FirstName ,MiddleName ,LastName ,Password ,Height ,SignUpDate ,AmountPaid ,WeightAtSignUp ,MembershipValidTill ,DateOfBirth ,
		StreetAddress ,City ,State ,Country ,ZipCode ,EmailAddress ,GoalWeight,UserType,Tier,DailyCalorieLimit,DaysToAchieveGoal,UserRole )
		VALUES
						(f_name,m_name, l_name, MD5('trainer'), 0, NOW(), 0, 0, DATE_ADD(NOW(), INTERVAL 1 YEAR) ,'9999-12-12',
						 'N/A', 'N/A' ,'N/A' ,'N/A' ,'12345' ,email_addr ,0, 'SILVER','Basic Subscription',0,0,'TRAINER');

END$$

DELIMITER ;