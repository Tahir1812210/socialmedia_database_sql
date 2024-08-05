USE [Yama_VenusNet]
GO

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
                CASE WHEN @Lang = 'ar' THEN city.ArbName ELSE city.EngName END AS 'city.textfield'
                -- ... (other project details)
            FROM sys_project P
            LEFT JOIN fcs_Customers customer ON P.Customer_ID = customer.ID
            LEFT JOIN sys_Countries country ON P.Country_ID = country.ID
            LEFT JOIN sys_Cities city ON P.City_ID = city.ID
            -- ... (other JOINs)
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
