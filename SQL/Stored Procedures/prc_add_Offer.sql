USE FitnessFreak;

-- =============================================
-- Author:      Aastha Kumar
-- Create date:  Nov, 27, 2017
-- Description:  add running Procedure
-- Version: 0.1
-- =============================================

DROP PROCEDURE IF EXISTS prc_add_offer;

DELIMITER $$

CREATE PROCEDURE prc_add_offer (
				IN User_ID									INT,
				 IN Valid_Till 				  					DateTime,
				 IN Tier  					    VARCHAR(50),
				 IN OfferDetails  			VARCHAR(200),
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
				-- update expired offers
				UPDATE OFFERS SET IsActive = 0 WHERE offerId = offerId and ValidTill < NOW();
				
                IF NOT EXISTS(SELECT * FROM Offers 
										  WHERE RunningOfferDetails = OfferDetails AND ApplicableToTier = Tier
										  AND IsActive =1) 
				THEN
							INSERT INTO Offers(ValidTill ,ApplicableToTier ,RunningOfferDetails ,IsActive)
							VALUES
							(Valid_Till ,Tier ,OfferDetails ,1);
							  
							SET msg ='data inserted successfully'; 
				ELSE
							SET msg = 'record already exist';
				END IF;
	ELSE
       
       SET msg = 'You are not authorized to add offers';
       
	END IF;
     
    COMMIT;  
END


