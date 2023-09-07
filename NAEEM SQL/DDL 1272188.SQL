/*
					SQL PROJECT NAME :BLOOD DONETION MANAGEMENT SYSTEM[BDMS]
							    Trainee Name : Abu Shahadat Naeem   
						    	  Trainee ID : 1272188       
							Batch ID : ESAD-CS/PNTL-M/53/01 

 --------------------------------------------------------------------------------

Table of Contents: DDL
			#01CHECK DATABASE EXISTANCE & CREATE DATABASE WITH ATTRIBUTES
			#02 CREATE TABLES WITH COLUMN DEFINITION 
			#03CREATE A SCHEMA -
			#04 ALTER, DROP AND MODIFY TABLES & COLUMN
			#05CREATE CLUSTERED AND NONCLUSTERED INDEX
			#06CREATE SEQUENCE
			#07CREATE A VIEW
			#08 STORED PROCEDURE
			#09 FUNCTION
			#10 FOR/AFTER TRIGGER 
			#11 INSTEAD OF TRIGGER
			#12 DROP STORED PROCEDORE
			#13 DROP TRIGGER

*/
/*

	     #01CHECK DATABASE EXISTANCE & CREATE DATABASE WITH ATTRIBUTES

*/


IF DB_ID('BDMS') IS NOT NULL
DROP DATABASE BDMS
GO

CREATE DATABASE BDMS
ON
(
	name = 'BDMS_DATA',
	filename = 'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\BDMS_DATA.mdf',
	size = 8MB,
	maxsize = 100MB,
	filegrowth = 4MB
)
LOG ON
(
	name = 'BDMS_LOG',
	filename = 'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\BDMS_LOG.ldf',
	size = 4MB,
	maxsize = 60MB,
	filegrowth = 2MB
)
GO
USE BDMS
GO
					
--		         #02 CREATE TABLES WITH COLUMN DEFINITION 


-- Table with IDENTITY, PRIMARY KEY & nullability CONSTRAINT... -



CREATE TABLE	User_table
(
	[user_id] INT IDENTITY PRIMARY KEY,
	UserName VARCHAR(35) NOT NULL,
	UserPassword VARCHAR(35)NOT NULL,
	contact VARCHAR (20)NOT NULL,
	email VARCHAR (40)NOT NULL,
	
)
GO
--################:> TABLE WITH PRIMARY KEY & FOREIGN KEY & ...<:#####################--

CREATE TABLE	blood_group
(
	blood_group_Id INT IDENTITY PRIMARY KEY,
	blood_group_name VARCHAR(15) NULL,
	description_of_blood VARCHAR(120)NOT NULL,
	[user_id] INT REFERENCES User_table([user_id]) 
)
GO
--################:> TABLE WITH CHECK CONSTRAINT & SET CONSTRAINT NAME & DEFAULT CONSTRAINT...<:#####################--

CREATE TABLE donor
(
	donorId INT IDENTITY PRIMARY KEY,
	donor_full_name VARCHAR(35) NOT NULL,
	donor_photo VARCHAR(25)NOT NULL,
	donor_nid VARCHAR(10) UNIQUE CHECK(donor_nid  LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	donor_address VARCHAR(120) NOT NULL,
	donor_contact VARCHAR(25)NOT NULL,
	donor_email_address VARCHAR(40) UNIQUE CONSTRAINT ck_email CHECK (donor_email_address LIKE '%@%' ) NOT NULL,
	donor_region VARCHAR(45) NOT NULL,
	donor_city VARCHAR(35) NOT NULL,
	donor_age INT NOT NULL,
	COMMENT VARCHAR(120) NULL,
	website VARCHAR(70) DEFAULT 'N/A',
	blood_group_id INT  REFERENCES blood_group (blood_group_id),
	[user_id] INT  REFERENCES User_table([user_id])
)
GO

CREATE TABLE	recipient
(
	recipientId INT IDENTITY PRIMARY KEY,
	recipient_full_name VARCHAR(35) NOT NULL,
	recipient_photo VARCHAR(25)NOT NULL,
	recipient_nid VARCHAR(10) UNIQUE CHECK(recipient_nid  LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	recipient_address VARCHAR(120) NOT NULL,
	recipient_contact VARCHAR(25)NOT NULL,
	recipient_email_address VARCHAR(40) UNIQUE CONSTRAINT ck_emailRE CHECK (recipient_email_address LIKE '%@%' ) NOT NULL,
	recipient_region VARCHAR(45) NOT NULL,
	recipient_city VARCHAR(35) NOT NULL,
	recipient_age INT,
	website VARCHAR(70) DEFAULT 'WWW.ISDB.COM',
	blood_group_id INT FOREIGN KEY REFERENCES blood_group (blood_group_id),
	[user_id] INT  REFERENCES User_table([user_id]) 

)
GO
CREATE TABLE	bloodRequest
(
	Request_id INT IDENTITY PRIMARY KEY,
	control_Number VARCHAR(35) NOT NULL,
	Request_by VARCHAR(35)NOT NULL,
	blood_group INT NOT NULL,
	date_of_Request	DATE NOT NULL,
	no_of_bag INT NOT NULL,
	amount_per_bag MONEY NOT NULL,
	purpose VARCHAR(25) NOT NULL,
	recipientId INT  REFERENCES recipient(recipientId),
	[user_id] INT  REFERENCES User_table([user_id])
)
GO
alter table bloodRequest alter column  blood_group varchar(6) NOT NULL
GO
CREATE TABLE	bloodCollection
(
	blood_Collection_Id INT IDENTITY PRIMARY KEY,
	Name_of_Hospital VARCHAR(35) NOT NULL,
	date_of_Collection VARCHAR(35)NOT NULL,
	no_of_bag INT NOT NULL,
	nurse_doctor_incharge VARCHAR NOT NULL,
	comment VARCHAR(120) NOT NULL,
	donorId INT  REFERENCES donor(donorId),
	blood_groupId INT  REFERENCES blood_group(blood_group_Id), 
	[user_id] INT  REFERENCES User_table([user_id])
)
GO
alter table bloodCollection alter column nurse_doctor_incharge VARCHAR(40) NOT NULL
go

CREATE TABLE	bloodIssued
(
	blood_Issued_Id INT IDENTITY PRIMARY KEY NONCLUSTERED,
	Issued_by VARCHAR(35)NOT NULL,
	Issued_date DATETIME NOT NULL,
	Issued_to  VARCHAR(35)NOT NULL,
	no_of_bag INT NOT NULL,
	amount_paid MONEY,
	Requestid INT  REFERENCES bloodRequest(Request_id),
	[user_id] INT  REFERENCES User_table([user_id])
)
GO

CREATE TABLE blood_stock_details

(	blood_stock_id INT IDENTITY,
	blood_stock_no_of_bag INT,
	blood_Issued_Id INT REFERENCES bloodIssued(blood_Issued_Id),
	blood_Collection_Id INT REFERENCES bloodCollection(blood_Collection_Id),
	Request_id INT REFERENCES bloodRequest(Request_id),
	blood_group_Id INT REFERENCES blood_group(blood_group_Id),
	[user_id] INT REFERENCES User_table  ([user_id]),
	recipientId INT REFERENCES recipient(recipientId),
	donorId INT REFERENCES donor(donorId)
)
GO
--GENAREL TABLE
CREATE TABLE blood__price	

(	blood_price_id INT  PRIMARY KEY,
	blood_price money,
	blood_discount float,
	blood_bga_qty INT
)
GO
--MERGE TABLE 
CREATE TABLE bloodPR	

(	blood_id INT PRIMARY KEY,
	blood_price money,
	blood_dis float,
	blood_qty INT
)
GO



--#03CREATE A SCHEMA -

CREATE SCHEMA ASNM
GO
--============== USE SCHEMA IN A TABLE ============--

CREATE TABLE ASNM.user_group
(
	BLOD_group_Id INT PRIMARY KEY ,
	group_name NVARCHAR(10) NULL,
	descriptio VARCHAR(120) NULL
)
GO
SELECT * FROM ASNM.user_group

--########################  **************  ##################################
		          -- #04 ALTER, DROP AND MODIFY TABLES & COLUMN
	--***********###################################################***********--


--==============# ALTER TABLE SCHEMA AND TRANSFER TO [DBO] #============--

ALTER SCHEMA dbo TRANSFER BDMS.user_group
GO
--==============# DPDATE COLUMN  #============--

ALTER TABLE blood_group
ALTER COLUMN blood_group_name VARCHAR(12)NOT NULL
GO
--*************** ADD COLUMN WITH DEFAULT CONSTRAINT *

ALTER TABLE bloodIssued
ADD amount_paid MONEY DEFAULT 0.00
GO

--**************# ADD CHECK CONSTRAINT WITH NAME *-
ALTER TABLE donor
ADD CONSTRAINT CK_donornidValidate CHECK(nid LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')
GO
--DROP COLUMN *********
ALTER TABLE donor DROP COLUMN website
GO
--DROP TABLE ***********
--DROP TABLE bloodCollection
--GO
--DROP SCHEMA**********
DROP SCHEMA ASNM
GO

						
		          --#05CREATE CLUSTERED AND NONCLUSTERED INDEX
						--**********************--
						-- CLUSTERED INDEX
CREATE CLUSTERED INDEX AN_bloodIssued ON  bloodIssued (blood_Issued_Id)
GO
					  --NONCLUSTERED INDEX
CREATE NONCLUSTERED INDEX NA_recipient ON recipient(recipient_city,recipient_age)
GO


--								#06CREATE SEQUENCE

CREATE SEQUENCE ASNAEEM 
AS INT
	START WITH 1
		INCREMENT BY 1 
			MINVALUE 0
				MAXVALUE 250
					CYCLE
						CACHE 10
GO
--						ALTER SEQUENCE

									ALTER SEQUENCE ASNAEEM
														MAXVALUE 300
																CYCLE
																	CACHE 9
GO
							
							  --#07CREATE A VIEW***************

CREATE VIEW V_BLOOD
		AS
		SELECT
			blood_Issued_Id,Issued_by,Issued_date,amount_paid,Issued_to,no_of_bag
				FROM bloodIssued
GO
CREATE VIEW V_BLOOD01
		AS
		SELECT
			Issued_by,Issued_date,amount_paid,Issued_to,no_of_bag
				FROM bloodIssued
GO
--							 #######VIEW WITH ENCRYPTION, SCHEMABINDING & WITH CHECK OPTION****************
CREATE VIEW VVASDAT01
WITH SCHEMABINDING, ENCRYPTION
	AS
		SELECT
			blood_Issued_Id,Issued_by,Issued_date,amount_paid,Issued_to 
				FROM DBO.bloodIssued
					WITH CHECK OPTION
GO
--						ALTER VIEW

ALTER VIEW V_BLOOD01
AS
SELECT
	blood_Issued_Id,Issued_by,Issued_date,amount_paid,Issued_to 
		FROM bloodIssued
			WHERE blood_Issued_Id BETWEEN 1 AND 49
GO

--####################################################################################################################################						    
--							       #08 STORED PROCEDURE
--						STORED PROCEDURE FOR INSERT DATA USING PERAMETER
CREATE PROCEDURE spInsertUser_table
@name VARCHAR(40),
  @UserPassword VARCHAR(35) ,
     @contact VARCHAR (20),
	    @email VARCHAR (40)
								
AS	
BEGIN
	INSERT INTO User_table(UserName, UserPassword,contact,email) 
	         VALUES(@name, @UserPassword, @contact, @email)
END
GO
--============== STORED PROCEDURE for insert data with OUTPUT parameter ============--
CREATE PROCEDURE spInsertUser_tableOURPUT
@name VARCHAR(40),
  @UserPassword VARCHAR(35) ,
	  @contact VARCHAR (20),
	    @email VARCHAR (40),
		 @ID INT  OUTPUT						
AS	
BEGIN
	INSERT INTO User_table(UserName, UserPassword,contact,email) 
	         VALUES(@name, @UserPassword,@contact, @email)
			  SELECT @ID=IDENT_CURRENT('User_table')
END
GO
--							 STORED PROCEDURE for UPDATE data --
CREATE PROCEDURE spUpdateUser_table	@name VARCHAR(40),
									@USERID INT
AS
BEGIN
	UPDATE User_table  SET UserName = @name
		WHERE [user_id] = @USERID
END
GO
--#########################STORED PROCEDURE for DELETE Table data *************************$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

CREATE PROCEDURE spDelete	@USERID INT
AS
BEGIN
	DELETE FROM ASNM.user_group
	WHERE BLOD_group_Id = @USERID
END
GO
--			***********TRY CATCH IN A STORED PROCEDURE & RAISERROR WITH ERROR NUMBER AND ERROR MESSAGE ***********

CREATE PROCEDURE spRaisErrorbdms
AS
BEGIN
	BEGIN TRY
		DELETE FROM ASNM.user_group
	END TRY
	BEGIN CATCH
		DECLARE @Error VARCHAR(200) = 'EORRO' + CONVERT(varchar, ERROR_NUMBER(), 1) + ' : ' + ERROR_MESSAGE()
		RAISERROR(@Error, 1, 1)
	END CATCH
END
GO
--						 ALTER STORED PROCEDURE --
ALTER PROCEDURE spInsertUser_table
@name VARCHAR(40),
  @UserPassword VARCHAR(35) ,
	  @contact VARCHAR (20),
	    @email VARCHAR (40)
								
AS	
BEGIN
	INSERT INTO User_table(UserName, UserPassword,contact,email) 
	         VALUES(@name, @UserPassword, @contact, @email)
END
GO

ALTER PROCEDURE spInsertUser_tableOURPUT
	@name VARCHAR(40),
	@UserPassword VARCHAR(35) ,
	  @contact VARCHAR (20),
	    @email VARCHAR (40),
		 @ID INT  OUTPUT						
AS	
BEGIN
	INSERT INTO User_table(UserName, UserPassword,contact,email) 
	         VALUES(@name, @UserPassword,@contact, @email)
			  SELECT @ID=IDENT_CURRENT('User_table')
END
GO
--##########################################################################################################
					  
--								#09 FUNCTION
--									***
--								A SCALAR FUNCTION 
--				 A SCALAR FUNCTION TO GET PER DAY AMOUNT OF BLOOD PRICE
CREATE FUNCTION fntotalamountofblood (@ISSUED VARCHAR(45))
RETURNS MONEY
AS
BEGIN
	DECLARE @totalamount MONEY
		SELECT @totalamount = SUM(amount_paid)
			FROM bloodIssued 
				WHERE Issued_to= @ISSUED
	RETURN @totalamount
END
GO
--						########A SIMPLE TABLE VALUED FUNCTION###############
--							****A Inline Table Valued Function *******
CREATE FUNCTION fnblood (@name varchar(40) )
RETURNS TABLE
AS
RETURN
(	SELECT blood_Issued_Id,Issued_date,Issued_by,no_of_bag FROM bloodIssued
	WHERE Issued_by = @name
)
GO
--						 A MULTISTATEMENT TABLE VALUED FUNCTION
--							 BLOOD INFORMATION BY DATE 
CREATE FUNCTION fnMULTILINE(@name varchar(40) )
RETURNS @TABLRR TABLE

(	blood_Issued_Id INT ,
	Issued_by VARCHAR(35),
	Issued_date DATETIME,
	Issued_to  VARCHAR(35),
	no_of_bag INT, 
	amount_paid MONEY
)
AS
BEGIN
	INSERT INTO @TABLRR
	SELECT 
	blood_Issued_Id,Issued_by,Issued_date,Issued_to,no_of_bag,amount_paid
	FROM bloodIssued
	WHERE Issued_by=@name
	RETURN
END
GO
--							***ALTER FUNCTION****
ALTER FUNCTION fnMULTILINE(@date DATE)
RETURNS @TABLRR TABLE

(	blood_Issued_Id INT ,
	Issued_by VARCHAR(35),
	Issued_date DATETIME,
	Issued_to  VARCHAR(35),
	no_of_bag INT, 
	amount_paid MONEY,
	Requestid INT,
	[user_id] INT
)
AS
BEGIN
	INSERT INTO @TABLRR
	SELECT 
	blood_Issued_Id,Issued_by,Issued_date,Issued_to,no_of_bag,Requestid,[user_id]
	FROM bloodIssued
	WHERE Issued_date=@date
	RETURN
END
GO
--#################################################################
--									 
--									 #10 FOR/AFTER TRIGGER 
--						***********UPDATE********************
--- Create trigger on bloodCollection table and update NO OF BAG in blood_stock_details table
CREATE TRIGGER trbag_no_of_blood
ON bloodCollection
FOR INSERT
AS
BEGIN
	DECLARE @stocid INT
	DECLARE @no_bag INT

	SELECT
	@stocid = blood_Collection_Id,
	@no_bag = no_of_bag 
	FROM inserted

	UPDATE blood_stock_details
	SET blood_stock_no_of_bag = blood_stock_no_of_bag+ @no_bag
	WHERE blood_stock_id = @stocid
	
END
GO
--						***********DELETE********************
--Create trigger on bloodCollection table and DELETE in blood_stock_details table

CREATE TRIGGER trStockIn_no_of_blood
ON bloodCollection
FOR	DELETE
AS
BEGIN
	DECLARE @stocid INT
	DECLARE @no_bag INT

	SELECT
	@stocid = blood_Collection_Id,
	@no_bag = no_of_bag 
	FROM deleted

	UPDATE blood_stock_details
	SET blood_stock_no_of_bag = blood_stock_no_of_bag - @no_bag
	WHERE blood_stock_id = @stocid
	
END
GO

			
--	***************************** ############ ************************************
--								#11 INSTEAD OF TRIGGER
-- AN INSTEAD OF TRIGGER ON TABLE
CREATE TRIGGER TRISTEREDONTABLE
ON bloodIssued
INSTEAD OF INSERT AS
BEGIN
INSERT INTO V_BLOOD01 (Issued_by,Issued_date,amount_paid,Issued_to)
SELECT Issued_by,Issued_date,amount_paid,Issued_to FROM inserted
END
GO
select * from V_BLOOD01

-- AN INSTEAD OF TRIGGER ON VIEW
CREATE TRIGGER TRISTEREDONVIEW 
ON V_BLOOD01
INSTEAD OF INSERT AS
BEGIN
INSERT INTO bloodIssued (Issued_by,Issued_date,amount_paid,Issued_to,no_of_bag)
SELECT Issued_by,Issued_date,amount_paid,Issued_to,no_of_bag FROM inserted
END
GO
--				 ALTER TRIGGER 
ALTER TRIGGER TRISTEREDONTABLE
ON bloodIssued
INSTEAD OF INSERT AS
BEGIN
INSERT INTO V_BLOOD01 (Issued_by,Issued_date,amount_paid,Issued_to,no_of_bag)
SELECT Issued_by,Issued_date,amount_paid,Issued_to,no_of_bag FROM inserted
END
GO
GO
--#12 DROP STORED PROCEDORE
DROP PROC spInsertUser_table
DROP PROC spInsertUser_tableOURPUT
--#13 DROP TRIGGER
DROP TRIGGER TRISTEREDONVIEW
DROP TRIGGER trdelete_no_of_blood

