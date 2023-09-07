/*

					SQL PROJECT NAME : BLOOD DONETION MANAGEMENT SYSTEM[BDMS]
							    Trainee Name : ABU SHAHADAT NAEEM
						    	  Trainee ID : 1272188     
							BATCH ID : ESAD-CS/PNTL-M/53/01 

 --------------------------------------------------------------------------------
Table of Contents: DML
			#01.INSERT DATA USING INSERT INTO KEYWORD
			#02. Insert data by specifying column name 
			#03.Insert data by column sequence
			#04.insert data with relation
			#05.INSERT DATA THROUGH STORED PROCEDURE
			#06.INSERT DATA THROUGH STORED PROCEDURE WITH AN OUTPUT PARAMETER

			#07.INSERT DATA USING SEQUENCE VALUE
			#08.DELETE DATA THROUGH STORED PROCEDURE
			#09 UPDATE DATA THROUGH STORED PROCEDURE
			#10.STORED PROCEDURE WITH TRY CATCH AND RAISE ERROR 
			#11.INSERT DATA through view
			#12.UPDATE DATA through view 
			#13. DELETE DATA through view 
			#14.A SCALAR FUNCTION TO GET PER DAY AMOUNT OF BLOOD PRICE of
			#15.A Inline Table Valued Function for  issued by
			#16.A Multi Statement Table Valued Function
			#17.FOR/AFTER TRIGGER ON TABLE
			#18.INSERT IN AN INSTEAD OF TRIGGER 
			#19. A SELECT STATEMENT TO GET RESULT SET FROM A TABLE 
			#20. A SELECT STATEMENT TO GET RESULT SET  FROM A VIEW 
			#21.SELECT INTO  SAVE RESULT SET TO A NEW TEMPORARY TABLE
			#22.INNER JOIN
			#23. LEFT OUTER JOIN
			#24.RIGHT OUTER JOIN
			#25. CROSS JOIN
			#26.TOP CLAUSE WITH TIES 
			#27.DISTINCT
			#28. COMPARISON, LOGICAL(AND OR NOT) & BETWEEN OPERATOR 
			#29. LIKE, IN, NOT IN, OPERATOR & IS NULL CLAUSE 
			#30. OFFSET 5 ROWS
			#31. OFFSET 10 ROWS AND GET NEXT 5 ROWS
			#32. EXCEPT
			#33.INTERSECT
			#34. AGGREGATE FUNCTION 
			#35. AGGREGATE FUNCTION WITH GROUP BY & HAVING CLAUSE
			#36.ROLLUP
			#37. CUBE
			#38. GROUPING SETS
			#39.A subquery to findout donor who have not enrolled yet
			#40.A correlated subquery
			#41. EXISTS 
			#42.A CTE TO GET DONOR ALL INFORMATION 
			#43. MERGE 
			#44. GET CURRENT DATE AND TIME
			#45. GET STRING LENGTH
			#46. CAST
			#47. CONVERT
			#48.TRY_CONVERT
			#49.GET MONTH NAME
			#50. GET YEAR NAME
			#51.GET DAY NAME
			#52.CASE
			#53. IIF 
			#54.COALESCE
			#55.ISNULL
			#56. WHILE 
			#57. RANKING FUNCTION 
			#58. IF ELSE & PRINT
			#59.GROPING FUNCTION
			#TRYCATCH
			#60. GOTO
			#61. WAITFOR
			#62. SYSTEM STORED PROCEDURE(sp_helptext) TO GET UNENCRYPTED STORED PROCEDURE SCRIPT  
			#63. TRANSACTION WITH SAVE POIN
*/
/*

					#01.INSERT DATA USING INSERT INTO KEYWORD

*/

USE BDMS
GO

--*************** #02. Insert data by specifying column name **********
INSERT INTO User_table (UserName,UserPassword,contact,email)VALUES
('AFNAN','2003*@0518','(800)18921421','afnanahmed@email.com'),
('KHASPIK AHMED','200209@#KPkp','(800)18921421','KAP@EMAIL.NET')

--					#03.Insert data by column sequence 
INSERT INTO User_table VALUES('LAV_AID_HOSPITAL','aidlav12166','(800)121666','lavaidhop@email.com'),
							 ('BRB','BRB10256166','(800)12712616','BRBhop@email.com')

SELECT * FROM User_table
GO

INSERT INTO blood_group VALUES('O-','PLASMA ',1),
							  ('A-','deoxyhemoglobin ',2),
							  ('A-','Polycythemia ',3),
							  ('A-','Leukopenia ',4),
							  ('A-','Plasmodium ',4),
							  ('A-','anemia',2),
							  ('A-','Hemorrhage',1),
							  ('A-','hematoma',3),
							  ('A-','deoxyhemoglobin ',2)
SELECT * FROM blood_group
GO

INSERT INTO donor VALUES('KHASPIK AHMED','PHOTO','2003051822','CHANDPUR','(800)17529654','KAP@EMAIL.NET',
'CHOTTGRAM','CHANDPUR',19,NULL, DEFAULT,1,2
)
INSERT INTO donor VALUES('AFNAN','PHOTO','2004082822','KRISNOPUR','(800)17529654','afnanahmed@email.com',
'CHOTTGRAM','CHANDPUR',18,NULL, DEFAULT,5,1
)
GO
SELECT * FROM donor
GO

INSERT INTO recipient VALUES ('LAV_AID_HOSPITAL','PHOTO','2006102522','DHANMONDI',
'(800)121666','lavaidhop@email.com','DHAKA',
'DHAKA',00,DEFAULT,7,3)
INSERT INTO recipient VALUES ('BRB_HOSPITAL','PHOTO','2016102522','DHANMONDI',
'(800)121666','BRBhop@email.com','DHAKA',
'DHAKA',00,DEFAULT,5,4)


INSERT INTO recipient VALUES('ISTEAQ AHMED','PHOTO','200912250635709','DHAKA',
'(800)18529654','ISTEAQ@EMAIL.NET','CHOTTGRAM','DHAKA',13,1,1
)
SELECT * FROM recipient
GO

INSERT INTO bloodRequest VALUES('20191508','LAV_AID_HOSPITAL','A-',2019-16-12,
15,480.00,'DONT_NO',2,3)
INSERT INTO bloodRequest VALUES('20191509','BRB_HOSPITAL','A-',16-12-2019,
25,450.00,'DONT_NO',3,4)

SELECT * FROM bloodRequest
GO


INSERT INTO bloodCollection VALUES('QUANTAM-BLOOD-BANK','21-12-2019',1,'NRS_SETU_RANI',
'NOT ARGENT',1,1,1)

SELECT * FROM bloodCollection
GO

INSERT INTO bloodIssued VALUES('MR.TOWHID',2019-12-18,'LAV_AID_HOSPITAL',15,0.00,6,3)
INSERT INTO bloodIssued VALUES('MR.ASRAFUL',2019-12-17,'LAV_AID_HOSPITAL',10,5000.00,6,3)
INSERT INTO bloodIssued VALUES('MR.TOWHID',2019-12-20,'BRB_HOSPITAL',5,2500.00,8,4)
INSERT INTO bloodIssued VALUES('MR.ASRAFUL',2019-12-21,'BRB_HOSPITAL',10,1500.00,9,4)

SELECT * FROM bloodIssued
GO
-- #04.insert data with relation


INSERT INTO blood_stock_details VALUES(50,3,2,6,2,3,2,1)
INSERT INTO blood_stock_details VALUES(40,5,2,8,5,4,3,1)
INSERT INTO blood_stock_details VALUES(22,7,2,9,6,3,3,3)
SELECT * FROM blood_stock_details
GO

INSERT INTO blood__price VALUES(11,500.00,.05,10)
INSERT INTO blood__price VALUES(12,450.00,.08,15)
INSERT INTO blood__price VALUES(13,400.00,.05,20)
go
/*
					#05.INSERT DATA THROUGH STORED PROCEDURE
*/



EXEC spInsertUser_table 'AENAM_MEDICAL','ANME@*2013','1236913','AENAM_MEDICAL@EMAIL.COM'
EXEC spInsertUser_table 'SAMARETA_HOSPITAL','SAMARETA@*1989','19712626','SAMARETA_HOSPITAL@EMAIL.COM'

SELECT * FROM User_table
GO

--************** #06.INSERT DATA THROUGH STORED PROCEDURE WITH AN OUTPUT PARAMETER

DECLARE @OUTId INT
EXEC spInsertUser_tableOURPUT 'Ramzan Ali', 'ILANAZMAR#12','017895623', 'ramzan@gmail.com',@OUTId OUTPUT
PRINT 'NEW  ID NO : '+ str(@OUTId)
GO


--******************* #07.INSERT DATA USING SEQUENCE VALUE
INSERT INTO ASNM.user_group VALUES(101,'A-','AVELABLE')
GO
SELECT * FROM ASNM.user_group
GO
--#08.DELETE DATA THROUGH STORED PROCEDURE

EXEC spDelete 101
EXEC spDelete 102
EXEC spDelete 103
EXEC spDelete 103
GO
SELECT * FROM  ASNM.user_group
GO
--         #09 UPDATE DATA THROUGH STORED PROCEDURE
EXEC spUpdateUser_table 'KHASPIK AHMED',2
GO
--#10.STORED PROCEDURE WITH TRY CATCH AND RAISE ERROR 

EXEC spRaisErrorbdms
GO
--#11.INSERT DATA through view


INSERT INTO V_BLOOD(Issued_by,Issued_date,amount_paid,Issued_to,no_of_bag) VALUES
('SETU RANI', 2020-11-16,00.00,'ADD DIN HOSPITAL',10)

INSERT INTO V_BLOOD(Issued_by,Issued_date,amount_paid,Issued_to,no_of_bag) VALUES 
('SETU RANI', 2020-10-17,1500.00,'AENAM_MEDICAL',5)

INSERT INTO V_BLOOD(Issued_by,Issued_date,amount_paid,Issued_to,no_of_bag) VALUES
('SETU RANI', '2020-12-17 ',20000.00,'SQUAR HOSPITAL',40)
GO
SELECT * FROM V_BLOOD
GO
--#12.UPDATE DATA through view 
UPDATE V_BLOOD
SET amount_paid = 2500.00
WHERE blood_Issued_Id = 5
GO
SELECT * FROM V_BLOOD
GO
--#13. DELETE DATA through view -
DELETE FROM V_BLOOD
WHERE Issued_to = 'DHAKA MADICAL'
GO
SELECT * FROM V_BLOOD
GO

-- #14.A SCALAR FUNCTION TO GET PER DAY AMOUNT OF BLOOD PRICE of 

SELECT DBO.fntotalamountofblood('BRB_HOSPITAL') AS 'TOTAL AMOUNT OF BLOOD PRICE' 
GO
SELECT * FROM bloodIssued
GO
-- #15.A Inline Table Valued Function for  issued by

SELECT * FROM DBO.fnblood('MR.TOWHID')
GO


-- #16.A Multi Statement Table Valued Function
SELECT * FROM dbo.fnMULTILINE('MR.TOWHID')
GO
	--						   TEST TRIGGER
--#17.FOR/AFTER TRIGGER ON TABLE

SELECT * FROM bloodCollection
SELECT * FROM blood_stock_details
go

INSERT INTO bloodCollection(Name_of_Hospital,date_of_Collection,no_of_bag,nurse_doctor_incharge,comment) VALUES
('QUANTAM-BLOOD-BANK','21-12-2019',15,'NRS_SETU_RANI',
'NOT ARGENT')
GO

SELECT * FROM bloodCollection
SELECT * FROM blood_stock_details
GO
--#18.INSERT IN AN INSTEAD OF TRIGGER 

--insert in AN INSTEAD OF TRIGGER ON TABLE

SELECT * FROM bloodIssued 
SELECT * FROM V_BLOOD01
GO
INSERT INTO bloodIssued  (Issued_by,Issued_date,amount_paid,Issued_to,no_of_bag) VALUES
('MR.kawser',18-12-2019,00.00,'LAV_AID_HOSPITAL',12)
GO
SELECT * FROM bloodIssued 
GO

--insert in AN INSTEAD OF TRIGGER ON view


SELECT * FROM V_BLOOD

INSERT INTO V_BLOOD(Issued_by,Issued_date,amount_paid,Issued_to,no_of_bag) VALUES
('MR.TOWHID',18-12-2019,00.00,'LAV_AID_HOSPITAL',12)

SELECT * FROM V_BLOOD
GO

--#19. A SELECT STATEMENT TO GET RESULT SET FROM A TABLE 

SELECT * FROM bloodCollection
GO
--#20. A SELECT STATEMENT TO GET RESULT SET  FROM A VIEW --

SELECT * FROM V_BLOOD
GO
--#21.SELECT INTO  SAVE RESULT SET TO A NEW TEMPORARY TABLE

SELECT * INTO TMPTABLE
FROM bloodCollection
GO

SELECT * FROM TMPTABLE
GO
--#22.INNER JOIN

SELECT D.donorId,D.donor_full_name,D.donor_age FROM 
blood_group BG INNER JOIN donor D ON BG.blood_group_Id=D.blood_group_id 
WHERE D.donor_full_name='KHASPIK AHMED'

--#23. LEFT OUTER JOIN

SELECT D.donorId,D.donor_full_name,D.donor_age FROM 
blood_group BG LEFT JOIN donor D ON BG.blood_group_Id=D.blood_group_id 
WHERE D.donor_full_name='KHASPIK AHMED'

--#24.RIGHT OUTER JOIN

SELECT D.donorId,D.donor_full_name,D.donor_age FROM 
blood_group BG RIGHT JOIN donor D ON BG.blood_group_Id=D.blood_group_id 
WHERE D.donor_full_name='KHASPIK AHMED'

--#25. CROSS JOIN

SELECT * FROM blood_group BG 
CROSS JOIN donor D
GO
--#26.TOP CLAUSE WITH TIES 

SELECT TOP 3  WITH TIES blood_group_Id,blood_group_name,description_of_blood 
FROM blood_group ORDER BY  blood_group_Id
-- #27.DISTINCT 
SELECT  DISTINCT blood_group_name,blood_group_Id, description_of_blood 
FROM blood_group ORDER BY  blood_group_Id
--#28. COMPARISON, LOGICAL(AND OR NOT) & BETWEEN OPERATOR 

SELECT * FROM donor
  WHERE donorId= 1
    AND donor_age  BETWEEN 18 AND 60
      AND NOT blood_group_id  = 4
         OR donor_address = 'DHAKA' AND donor_address= 'CHATTOGRAM'
GO
--#29. LIKE, IN, NOT IN, OPERATOR & IS NULL CLAUSE 

SELECT * FROM donor WHERE donor_full_name LIKE '%n'
  AND donor_age NOT IN (30,32,34,36,38,40)
   AND COMMENT IS  NULL
GO
-- OFFSET FETCH

--#30. OFFSET 5 ROWS
SELECT * FROM donor ORDER BY donor_nid OFFSET 5 ROWS
GO
--#31. OFFSET 10 ROWS AND GET NEXT 5 ROWS

SELECT * FROM donor ORDER BY donor_nid OFFSET 10 ROWS
  FETCH NEXT 5 ROWS ONLY
GO
SELECT * FROM donor WHERE donorId IN (1, 2)
UNION
SELECT * FROM donor WHERE donorId IN (3, 4 )
GO
-- EXCEPT INTERSECT 
--#32. EXCEPT
SELECT * FROM donor
EXCEPT
SELECT * FROM donor
WHERE donorId = 2
GO
-- #33.INTERSECT

SELECT * FROM donor
WHERE donorId > 3

INTERSECT

SELECT * FROM recipient
WHERE recipientId >1
GO

--#34. AGGREGATE FUNCTION 
SELECT	COUNT(*) 'Total ',
		SUM(blood_price) 'Total PRICE',
		AVG(blood_price) 'Average PRICE',
		MIN(blood_price) 'MIN PRICE',
		(MAX(blood_discount))*100 'MAX Discount %'
FROM blood__price
GO
--#35. AGGREGATE FUNCTION WITH GROUP BY & HAVING CLAUSE 

SELECT blood_price_id ,SUM(blood_price)'Total ' FROM blood__price
GROUP BY blood_price_id
HAVING blood_price_id> 2
GO
--.ROLLUP & CUBE OPERATOR 

--#36.ROLLUP
SELECT blood_price_id ,SUM(blood_price)'Total ' FROM blood__price
GROUP BY ROLLUP( blood_price_id)
HAVING blood_price_id> 2
GO

--#37. CUBE
SELECT blood_price_id ,SUM(blood_price)'Total ' FROM blood__price
GROUP BY CUBE( blood_price_id)
HAVING blood_price_id> 2
GO
--# 38. GROUPING SETS
SELECT blood_price_id ,SUM(blood_price)'Total ' FROM blood__price
GROUP BY GROUPING SETS( blood_price_id)
HAVING blood_price_id> 11
GO
--SUB-QUERIES


--#39.A subquery to findout donor who have not enrolled yet

SELECT donor_full_name, donor_address, donor_city, donor_nid FROM donor
WHERE donorId NOT IN (SELECT donorId FROM blood_group)
ORDER BY donor_full_name
GO
--#40.A correlated subquery

SELECT BP.blood_price_id, SUM(BP.blood_price) 'NET PRICE' FROM blood__price BP
GROUP BY  BP.blood_price_id
HAVING SUM(BP.blood_price)> (SELECT AVG(B.blood_price) FROM blood__price B WHERE BP.blood_price_id=B.blood_price_id)
GO
--#41. EXISTS 

SELECT donor_full_name, donor_address, donor_city, donor_nid FROM donor
WHERE NOT EXISTS 
			(SELECT donorId FROM blood_group
				WHERE blood_group.blood_group_Id=donor.blood_group_id )
GO
--=#42.CTE 

-- #42.A CTE TO GET DONOR ALL INFORMATION  
WITH BLOOD AS
(
SELECT BG.blood_group_name,D.donor_full_name,D.donor_address,D.donor_city,donor_age  FROM blood_group BG JOIN donor D 
ON BG.blood_group_Id=D.blood_group_id

)
SELECT * FROM BLOOD
GO
--#43. MERGE 

SELECT * FROM blood__price
SELECT * FROM bloodPR
GO

MERGE bloodPR AS TARGET 
USING blood__price AS SOURCE
ON SOURCE.blood_price_id = TARGET.blood_id
WHEN NOT MATCHED THEN
INSERT  (blood_price_id,blood_price,blood_discount,blood_bga_qty)values
(blood_id,blood_price,blood_dis,blood_qty);				
GO
--. BUILT IN FUNCTION 

--#44. GET CURRENT DATE AND TIME
SELECT GETDATE() 'DATE'
GO
--#45. GET STRING LENGTH
SELECT donorId, LEN(donor_full_name) 'Name Length' FROM donor
GO
-- #46. CAST
SELECT CAST(1500 AS decimal(20,3)) AS DecimalNumber
GO
--#47. CONVERT
DECLARE @currTime DATETIME = '10:00 AM'
SELECT CONVERT(VARCHAR, @currTime, 108) AS [Time]
GO

 --#48.TRY_CONVERT
SELECT TRY_CONVERT(FLOAT, 'HELLO', 1) AS [NULL]
GO
-- #49.GET MONTH NAME
SELECT DATENAME(MONTH, GETDATE()) AS 'Month'
GO
--#50. GET YEAR NAME
SELECT DATENAME(YEAR, GETDATE()) AS 'YEAR'
GO
-- #51.GET DAY NAME
SELECT DATENAME(DAY, GETDATE()) AS 'DAY'
GO
--#52.CASE

SELECT donor_age,
	CASE 
		WHEN donor_age >45  THEN 'RISK'
		WHEN donor_age >18 THEN ' NO RISK'
		ELSE 'AVG'
END AS 'Status'
FROM donor

--#53. IIF 
SELECT *, IIF((donor_age >18),'OK','NOT PEPEARD')AS 'Status'
FROM donor
--# 54. COALESCE & ISNULL 
--54.COALESCE
SELECT COALESCE(COMMENT ,'IGNOR') AS COMMENT,donorId,donor_full_name FROM donor
--#55.ISNULL
SELECT ISNULL(COMMENT ,'IGNOR') AS COMMENT,* FROM donor
--#56. WHILE 

	DECLARE @WR int
	SET @WR = 0

	WHILE @WR < 20

	BEGIN
	  SET @WR = @WR + 1
	  INSERT INTO blood__price(blood_price_id,blood_bga_qty,blood_discount,blood_price) VALUES(15,5, .05,450.00)
	END

	SELECT * FROM blood__price
GO
--#57. RANKING FUNCTION 

SELECT donorId,RANK() OVER(ORDER BY donorid) AS 'Rank' from donor
GO
SELECT donorId,DENSE_RANK() OVER(ORDER BY donorId) AS 'REALRank' from donor
GO
SELECT donorId,NTILE(3) OVER(ORDER BY donorId) AS 'LINE DIVIDED' from donor
GO
SELECT donorId,ROW_NUMBER () OVER(ORDER BY donorId) AS 'NEW LINE NUMBER' from donor
GO
-- #58. IF ELSE & PRINT

DECLARE @PRICE  MONEY
SELECT @PRICE = SUM((blood_price))
FROM blood__price
IF @PRICE > 100
	BEGIN
		PRINT 'PRICE IS GOOD'
	END
ELSE
	BEGIN
		PRINT 'Didn''t Reached the goal !'
	END
GO
--=#59.GROPING FUNCTION

SELECT 
	CASE 
		WHEN GROUPING(donorId) = 1 THEN 'ALL DONOR'
		ELSE donorId
		END AS D_ID	
FROM donor

GO
--#TRYCATCH
BEGIN TRY
	DELETE FROM blood__price
	PRINT 'SUCCESSFULLY DELETED'
END TRY

BEGIN CATCH
		DECLARE @Error VARCHAR(200) = 'Error' + CONVERT(varchar, ERROR_NUMBER(), 1) + ' : ' + ERROR_MESSAGE()
		PRINT (@Error)
END CATCH
GO
--#60. GOTO

DECLARE @value INT
SET @value = 0

WHILE @value <= 10
	BEGIN
	   IF @value = 2
		  GOTO printMsg
	   SET @value = @value + 1

	   	IF @value = 9
		  GOTO printMsg2
	   SET @value = @value + 1
	END
printMsg:
   PRINT 'Crossed Value 2'
printMsg2:
   PRINT 'Crossed Value 9'
GO
--#61. WAITFOR ============--

PRINT 'HELLO'
WAITFOR DELAY '00:00:03'
PRINT 'GOOD LUCK'
GO
--#62. SYSTEM STORED PROCEDURE(sp_helptext) TO GET UNENCRYPTED STORED PROCEDURE SCRIPT  

EXEC sp_helptext spDelete
GO
--#63. TRANSACTION WITH SAVE POINT 

SELECT * INTO TMPTABLE1
FROM bloodCollection
GO
SELECT * FROM TMPTABLE1
GO

BEGIN TRANSACTION
	DELETE FROM TMPTABLE1 WHERE no_of_bag = 5
	SAVE TRANSACTION TRANSACTION1
		DELETE FROM TMPTABLE1 WHERE no_of_bag = 6
		SAVE TRANSACTION TRANSACTION2
			DELETE FROM TMPTABLE1 WHERE no_of_bag = 7
			SAVE TRANSACTION TRANSACTION3

			SELECT * FROM TMPTABLE1

		ROLLBACK TRANSACTION TRANSACTION2
		SELECT * FROM TMPTABLE1
	ROLLBACK TRANSACTION TRANSACTION1
	SELECT * FROM TMPTABLE1
COMMIT TRANSACTION
GO

