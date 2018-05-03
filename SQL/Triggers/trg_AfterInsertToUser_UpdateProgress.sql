USE FitnessFreak;

-- =============================================
-- Author:      Aastha Kumar
-- Create date:  Nov, 28, 2017
-- Description:  Trigger to insert record into progress
-- Version: 0.1
-- =============================================

DROP TRIGGER IF EXISTS InsertIntoProgress;

DELIMITER $$

CREATE TRIGGER InsertIntoProgress
    AFTER INSERT ON  User
    FOR EACH ROW 
BEGIN
    
    INSERT INTO  PROGRESS(CurrentWeight, EncouragingMessages,ProgressDate,UserID)
    SELECT WeightAtSignUp, 'Congratulations on getting started', SignUpDate, UserID FROM USER where UserID = NEW.USERID;

END$$

DELIMITER ;


