-- Scrip to test all stored procs

-- script to test signup
CALL `FitnessFreak`.`prc_user_signup`('Chirag','', 'Arora', 'test123', '165', 200, 153, '1992-06-19',
     'San Antonio', 'San Jose' ,'CA' ,'USA' ,'95137' ,'email11@gmail.com','145','50',@out);
     select @out;

-- script to test user sign in , returns user id in case of success and username password incorrect in case of failure
CALL `FitnessFreak`.`prc_user_signin`('email6@gmail.com','test123',@out);
select @out;

-- script to test add trainer, only admin can add it
CALL `FitnessFreak`.`prc_add_trainer`('1', 'test','','test','test@email.com',@out);
select @out;

CALL `FitnessFreak`.`prc_add_dietician`('1', 'test','','test','fda','dietician@email.com',@out);
select @out;


CALL `FitnessFreak`.`prc_add_offer`('1','2017-06-19','Silver','test12',@out);
select @out;


CALL `FitnessFreak`.`prc_add_dietchart`('3','test diet chart6','150',@out);
select @out;

-- id given in input is user id, but id that will be inserted in exercise will be trainer id, so don't get confused with id, stored proc takes care of it
CALL `FitnessFreak`.`prc_add_exercisechart`('2','test exercise chart1','15','200',@out);
select @out;


CALL `FitnessFreak`.`prc_add_food`('3','tea','90','1','cup','test',@out);
select @out;

CALL `FitnessFreak`.`prc_foodlog_insert`(2,'BreakFast',4,1,@out);
select @out;



CALL `FitnessFreak`.`prc_view_foodprogress`(4,'2017-12-02');


CALL `FitnessFreak`.`prc_ExerciseDailyActivity_insert`(20,4,1,@out);
select @out;

CALL `FitnessFreak`.`prc_view_progress_exerciseprogress`(4,'2017-12-01');

CALL `FitnessFreak`.`prc_ViewDietChartRecommendation`(7,@out);

CALL `FitnessFreak`.`prc_ViewExerciseChartRecommendation`(8,@out);