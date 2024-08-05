USE [Yama_VenusNet]
GO




SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[sys_ProjectSave]
(
    @FormId INT,
    @User VARCHAR(50),
    @Lang VARCHAR(20) = 'EN',
    @json NVARCHAR(MAX),
    @Result NVARCHAR(MAX) OUT,
    @Error NVARCHAR(MAX) OUT
)
AS 
BEGIN
    SET NOCOUNT ON;

    DECLARE @ID INT = JSON_VALUE(@json, '$.Head.ID'),
            @Code VARCHAR(50) = JSON_VALUE(@json, '$.Head.Code'),
            @Customer_ID INT = JSON_VALUE(@json, '$.Head.Customer_ID'),
            @Country_ID INT = JSON_VALUE(@json, '$.Head.Country_ID'),
            @City_ID INT = JSON_VALUE(@json, '$.Head.City_ID'),
            @BusinessActivity_ID INT = JSON_VALUE(@json, '$.Head.BusinessActivity_ID'),
            @Owner_ID INT = JSON_VALUE(@json, '$.Head.Owner_ID'),
            @Status_ID INT = JSON_VALUE(@json, '$.Head.Status_ID'),
            @Start_Date SMALLDATETIME = JSON_VALUE(@json, '$.Head.Start_Date'),
            @End_Date SMALLDATETIME = JSON_VALUE(@json, '$.Head.End_Date'),
            @ExpectedProjectDurationDays INT = JSON_VALUE(@json, '$.Head.ExpectedProjectDurationDays'),
            @Types_ID INT = JSON_VALUE(@json, '$.Head.Type_ID'),
            @Priority_ID INT = JSON_VALUE(@json, '$.Head.Priority_ID'),
            @MOULES_ID INT = JSON_VALUE(@json, '$.Head.Moules_ID'),
            @ContractNO INT = JSON_VALUE(@json, '$.Head.ContractNO'),
            @ContractValueWithoutVAT INT = JSON_VALUE(@json, '$.Head.ContractValueWithoutVAT'),
            @VATPercent INT = JSON_VALUE(@json, '$.Head.VATPercent'),
            @VATValue INT = JSON_VALUE(@json, '$.Head.VATValue'),
            @TotalContractValue INT = JSON_VALUE(@json, '$.Head.TotalContractValue'),
            @SalesPerson_ID INT = JSON_VALUE(@json, '$.Head.SalesPerson'),
            @TeamViewerDetails INT = JSON_VALUE(@json, '$.Head.TeamViewerDetails'),
            @AnyDeskDetails INT = JSON_VALUE(@json, '$.Head.AnyDeskDetails'),
            @SQLDetails NVARCHAR(MAX) = JSON_VALUE(@json, '$.Head.SQLDetails'),
            @ServerConnectionDetails NVARCHAR(MAX) = JSON_VALUE(@json, '$.Head.ServerConnectionDetails'),
            @ERPApplicationURL NVARCHAR(MAX) = JSON_VALUE(@json, '$.Head.ERPApplicationURL'),
            @HRApplicationURL NVARCHAR(MAX) = JSON_VALUE(@json, '$.Head.HRApplicationURL'),
            @HMSApplicationURL NVARCHAR(MAX) = JSON_VALUE(@json, '$.Head.HMSApplicationURL'),
            @OtherField NVARCHAR(20) = JSON_VALUE(@json, '$.Head.OtherField'),
            @Notes NVARCHAR(50) = JSON_VALUE(@json, '$.Head.Notes');

    IF ISNULL(@ID, 0) = 0
    BEGIN
        DECLARE @X NVARCHAR(MAX);

        BEGIN TRY
            BEGIN TRANSACTION
            EXEC sys_CheckPermession @FormId = @FormId, @User = @User, @Lang = @Lang, @Mode = 'I';

            INSERT INTO sys_project
            (
                Code,
                Customer_ID,
                Country_ID,
                City_ID,
                BusinessActivity_ID,
                Owner_ID,
                Status_ID,
                StartDate,
                EndDate,
                ExpectedProjectDurationDays,
                Types_ID,
                Priority_ID,
                Moules_ID,
                ContractNO,
                ContractValueWithoutVAT,
                VATPercent,
                VATValue,
                TotalContractValue,
                SalesPerson_ID,
                TeamViewerDetails,
                AnyDeskDetails,
                SQLDetails,
                ServerConnectionDetails,
                ERPApplicationURL,
                HRApplicationURL,
                HMSApplicationURL,
                OtherField,
                Notes
            )
            VALUES
            (
                @Code,
                @Customer_ID,
                @Country_ID,
                @City_ID,
                @BusinessActivity_ID,
                @Owner_ID,
                @Status_ID,
                @Start_Date,
                @End_Date,
                @ExpectedProjectDurationDays,
                @Types_ID,
                @Priority_ID,
                @MOULES_ID,
                @ContractNO,
                @ContractValueWithoutVAT,
                @VATPercent,
                @VATValue,
                @TotalContractValue,
                @SalesPerson_ID,
                @TeamViewerDetails,
                @AnyDeskDetails,
                @SQLDetails,
                @ServerConnectionDetails,
                @ERPApplicationURL,
                @HRApplicationURL,
                @HMSApplicationURL,
                @OtherField,
                @Notes
            );

            SET @ID = SCOPE_IDENTITY();
            EXEC sys_ProjectDetail @FormId = @FormId, @User = @User, @Lang = @Lang, @ID = @ID, @Result = @X OUT;
            SET @Result = @X;
            COMMIT;
        END TRY
        BEGIN CATCH
            ROLLBACK;
            SET @Error = ERROR_MESSAGE();
        END CATCH;
    END
    ELSE
    BEGIN
        BEGIN TRY
            BEGIN TRANSACTION
            EXEC sys_CheckPermession @FormId = @FormId, @User = @User, @Lang = @Lang, @Mode = 'U';

            UPDATE sys_project
            SET
                Code = @Code,
                Customer_ID = @Customer_ID,
                Country_ID = @Country_ID,
                City_ID = @City_ID,
                BusinessActivity_ID = @BusinessActivity_ID,
                Owner_ID = @Owner_ID,
                Status_ID = @Status_ID,
                StartDate = @Start_Date,
                EndDate = @End_Date,
                ExpectedProjectDurationDays = @ExpectedProjectDurationDays,
                Types_ID = @Types_ID,
                Priority_ID = @Priority_ID,
                Moules_ID = @MOULES_ID,
                ContractNO = @ContractNO,
                ContractValueWithoutVAT = @ContractValueWithoutVAT,
                VATPercent = @VATPercent,
                VATValue = @VATValue,
                TotalContractValue = @TotalContractValue,
                SalesPerson_ID = @SalesPerson_ID,
                TeamViewerDetails = @TeamViewerDetails,
                AnyDeskDetails = @AnyDeskDetails,
                SQLDetails = @SQLDetails,
                ServerConnectionDetails = @ServerConnectionDetails,
                ERPApplicationURL = @ERPApplicationURL,
                HRApplicationURL = @HRApplicationURL,
                HMSApplicationURL = @HMSApplicationURL,
                OtherField = @OtherField,
                Notes = @Notes
            WHERE ID = @ID;

            EXEC sys_ProjectDetail @FormId = @FormId, @User = @User, @Lang = @Lang, @ID = @ID, @Result = @Result OUT;
            COMMIT;
        END TRY
        BEGIN CATCH
            ROLLBACK;
            SET @Error = ERROR_MESSAGE();
        END CATCH;
    END;
END;
