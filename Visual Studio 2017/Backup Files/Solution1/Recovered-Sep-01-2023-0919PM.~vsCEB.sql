create database DatabaseFirstDB

USE DatabaseFirstDB

create table clients
(
	ClientId INT PRIMARY KEY IDENTITY(1,1),
	ClientName VARCHAR NOT NULL,
	CustomerAmount Float
);

alter table clients 
add city varchar(50)


alter table clients 
alter column clientname varchar(50)


select *from clients

use CodeFirstDB

select *from customerss

create database checktask

USE checktask

-- Step 1: Add the column with the IDENTITY property
ALTER TABLE customerss
ADD customerid INT IDENTITY(1,1);

-- Step 2: Set the added column as the primary key
ALTER TABLE customerss
ADD CONSTRAINT PK_customers PRIMARY KEY (customerid);

select *from customerss

insert into customerss values ('Tahir Ahmed',30000)

/** Object:  StoredProcedure [dbo].[mms_UpdateParentStatus]    Script Date: 22/08/2023 1:09:49 PM **/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--CLOSE PARENT OPERATIONS IF RETERIVED COMPLITELY
--Reopen parent operation if it was closed
CREATE PROCEDURE [dbo].[mms_UpdateParentStatus]
(@OperationHeadID INT)
AS
BEGIN
	DECLARE @OperationParentID INT
	DECLARE Cur_OHParents  CURSOR  FOR 
		SELECT DISTINCT OD_Parentes.OperationHeadID  
		FROM mms_OperationsDetails OD
		INNER JOIN mms_OperationsDetails OD_Parentes ON OD_Parentes.ID=OD.OperationParentDetId
			WHERE OD.OperationHeadID=@OperationHeadID
	OPEN 	Cur_OHParents
	FETCH NEXT FROM Cur_OHParents INTO 	@OperationParentID

	WHILE @@FETCH_STATUS =0
	BEGIN
	IF	@OperationParentID IS NOT NULL	
	BEGIN 
	PRINT @OperationParentID
		--IF NOT EXISTS(
		IF (
			--SELECT OD.ID  FROM mms_OperationsDetails OD 
			--LEFT JOIN mms_OperationsDetails OD_Childs  ON OD.ID=OD_Childs.OperationParentDetId
			--WHERE OD.OperationHeadID=@OperationParentID
			--GROUP BY OD.ID,OD.BaseUnitofMeasurementEquivalentQty
			--HAVING OD.BaseUnitofMeasurementEquivalentQty
			--		-ISNULL(SUM(OD_Childs.BaseUnitofMeasurementEquivalentQty),0)<>0)

			SELECT ABS(SUM(ParentQTY))-ABS(SUM(ChildQTY))
			FROM(
			SELECT OD.BaseUnitofMeasurementEquivalentQty AS ParentQTY, 0 AS ChildQTY
			FROM mms_OperationsDetails OD 
			WHERE OD.OperationHeadID=@OperationParentID

			UNION all
            
			SELECT 0 AS ParentQTY,OD_Childs.BaseUnitofMeasurementEquivalentQty AS ChildQTY
			FROM mms_OperationsDetails OD_Childs 
			WHERE OD_Childs.OperationParentDetId IN (
			
			SELECT OD.ID
			FROM mms_OperationsDetails OD 
			WHERE OD.OperationHeadID=@OperationParentID
			) AND OperationHeadID=@OperationHeadID)aa)<=0


		BEGIN -- CLOSE PARENT OPERATIONS IF RETERIVED COMPLITELY
				UPDATE mms_OperationsHead SET StatusID=8/Closed/ WHERE ID=@OperationParentID
		END
		ELSE
		BEGIN -- Reopen parent operation if it was closed
				UPDATE mms_OperationsHead SET StatusID=5 WHERE ID=@OperationParentID AND StatusID=8/Closed/ 
		END
	END
	
	FETCH NEXT FROM Cur_OHParents INTO 	@OperationParentID

	END

	CLOSE Cur_OHParents
	DEALLOCATE Cur_OHParents
END














