USE [Yama_VenusNet]
GO
/****** Object:  StoredProcedure [dbo].[sys_ProjectDetail]    Script Date: 9/19/2023 3:44:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[sys_ProjectDetail]
(
    @FormId INT,
    @User VARCHAR(50),
    @Lang VARCHAR(20) = 'EN',
    @ID INT,
    @Result NVARCHAR(MAX) OUT
)
AS 
BEGIN
    EXEC sys_CheckPermession @FormId = @FormId, @User = @User, @Lang = @Lang;

    DECLARE @projectDetails NVARCHAR(MAX);
    DECLARE @attachments NVARCHAR(MAX);

    -- Get project details
    SELECT 
        @projectDetails = (
            SELECT 
                P.ID AS 'ID',
                P.Code AS 'Code',
                P.Customer_ID AS 'customer.valueField',
                CASE WHEN @Lang = 'ar' THEN customer.ArbName ELSE customer.EngName END AS 'customer.textfield',
                P.Country_ID AS 'country.valueField',
                CASE WHEN @Lang = 'ar' THEN country.ArbName ELSE country.EngName END AS 'country.textfield',
                P.City_ID AS 'city.valueField',
                CASE WHEN @Lang = 'ar' THEN city.ArbName ELSE city.EngName END AS 'city.textfield',
                P.BusinessActivity_ID AS 'businessactivity.valueField',
                CASE WHEN @Lang = 'ar' THEN businessactivity.ArbName ELSE businessactivity.EngName END AS 'businessactivity.textfield',
                P.Owner_ID AS 'owner.valueField',
                CASE WHEN @Lang = 'ar' THEN [owner].ArbName ELSE [owner].EngName END AS 'owner.textfield',
                P.Status_ID AS 'status.valueField',
                CASE WHEN @Lang = 'ar' THEN [status].ArbName ELSE [status].EngName END AS 'status.textfield',
                P.StartDate AS 'startdate.valueField',
                P.EndDate AS 'enddate.valueField',
                P.ExpectedProjectDurationDays AS 'expectedprojectdurationdays.valueField',
                P.Types_ID AS 'types.valueField',
                CASE WHEN @Lang = 'ar' THEN [types].ArbName ELSE [types].EngName END AS 'types.textfield',
                P.Priority_ID AS 'priority.valueField',
                CASE WHEN @Lang = 'ar' THEN [priority].ArbName ELSE [priority].EngName END AS 'priority.textfield',
                P.MOULES_ID AS 'moules.valueField',
                CASE WHEN @Lang = 'ar' THEN moules.ArbName ELSE moules.EngName END AS 'moules.textfield',
                P.ContractNO AS 'contractno.valueField',
                P.ContractValueWithoutVAT AS 'contractvaluewithoutvat.valueField',
                P.VATPercent AS 'vatpercent.valueField',
                P.VATValue AS 'vatvalue.valueField',
                P.TotalContractValue AS 'totalcontractvalue.valuefield',
                P.SalesPerson_ID AS 'salesperson.valuefield',
                CASE WHEN @Lang = 'ar' THEN salesperson.ArbName ELSE salesperson.EngName END AS 'salesperson.textfield',
                P.TeamViewerDetails AS 'teamviewerdetails.valueField',
                P.AnyDeskDetails AS 'anydeskdetails.valueField',
                P.SQLDetails AS 'sqldetails.valueField',
                P.ServerConnectionDetails AS 'serverconnectiondetails.valueField',
                P.ERPApplicationURL AS 'erpapplicationurl.valueField',
                P.HRApplicationURL AS 'hrapplicationurl.valueField',
                P.HMSApplicationURL AS 'hmsapplicationurl.valueField',
                P.OtherField AS 'otherfield.valueField',
                P.Notes AS 'notes.valueField'
            FROM sys_project P
            LEFT JOIN fcs_Customers customer ON P.Customer_ID = customer.ID
            LEFT JOIN sys_Countries country ON P.Country_ID = country.ID
            LEFT JOIN sys_Cities city ON P.City_ID = city.ID
            LEFT JOIN Sys_BusinessActivitiesTypes businessactivity ON P.BusinessActivity_ID = businessactivity.ID
            LEFT JOIN sys_owners [owner] ON P.Owner_ID = [owner].ID
            LEFT JOIN sys_status [status] ON P.Status_ID = [status].ID
            LEFT JOIN sys_types [types] ON P.Types_ID = [types].ID
            LEFT JOIN sys_priority [priority] ON P.Priority_ID = [priority].ID
            LEFT JOIN sys_moules moules ON P.Moules_ID = moules.ID
            LEFT JOIN sys_salesperson salesperson ON P.SalesPerson_ID = salesperson.ID
            WHERE P.ID = @ID
            FOR JSON AUTO
        );

    -- Get attachments as JSON
    SELECT 
        @attachments = (
            SELECT 
                Id AS 'id', 
                FileName AS 'name', 
                Size, 
                type 
            FROM sys_FormAttachments
            WHERE FormID = @FormID AND TransactionId = @ID
            FOR JSON PATH
        );

    -- Combine project details and attachments
   SET @Result = '{ "project_details": ' + @projectDetails + ', "attachments": ' + @attachments + ' }';
END;
