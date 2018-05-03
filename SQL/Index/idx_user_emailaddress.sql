Use FitnessFreak;

-- =============================================
-- Author:      Aastha Kumar
-- Create date:  Dec, 3, 2017
-- Description:  Creating  index on Email Address column, user table as that column is frequently used for query
-- Version: 0.1
-- =============================================

CREATE INDEX idx_user_emailaddress
ON User (EmailAddress);