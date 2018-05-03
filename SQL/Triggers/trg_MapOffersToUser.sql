USE FitnessFreak;

-- =============================================
-- Author:      Aastha Kumar
-- Create date:  Nov, 28, 2017
-- Description:  Trigger to update map offers to users
-- Version: 0.1
-- =============================================

DROP TRIGGER IF EXISTS trg_MapOffersToUser;

DELIMITER $$

CREATE TRIGGER trg_MapOffersToUser
    AFTER INSERT ON Offers
    FOR EACH ROW 
BEGIN
	
		DECLARE Offer_id INT;
        DECLARE User_Type varchar(50);
        
        select new.offerid, new.ApplicableToTier into Offer_id,User_Type;
	
        INSERT INTO OffersApplicableTo(OfferID, UserID)
        SELECT Offer_id,USERID FROM USER WHERE UserType = User_Type
        AND USERROLE ='USER';


END$$

DELIMITER ;


