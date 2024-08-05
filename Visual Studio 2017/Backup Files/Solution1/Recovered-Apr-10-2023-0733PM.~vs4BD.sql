/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [FormID]
      ,[ControlName]
      ,[FieldName]
      ,[Icon]
      ,[ArbCaption]
      ,[EngCaption]
      ,[MaxLength]
      ,[MinLength]
      ,[MaxValue]
      ,[MinValue]
      ,[DataType]
      ,[IsHidden]
      ,[DefaultValue]
      ,[DefaultValueScalarFun]
      ,[Required]
      ,[RegExpression]
      ,[ControlType]
      ,[SearchID]
      ,[AnotherCriteria]
      ,[Disabled]
      ,[IndexPage]
      ,[width]
      ,[Section]
      ,[AutoGenerate]
      ,[Rank]
      ,[EngToolTip]
      ,[ArbToolTip]
      ,[ModifyUserID]
      ,[ModifyDate]
  FROM [Srabeel_Demo].[dbo].[sys_FormsControls]
  where formid=72 and section=3

UPDATE [Srabeel_Demo].[dbo].[sys_FormsControls] SET EngCaption='Code Section' where formid=72 and section=3 and controlname='colCode'

UPDATE [Srabeel_Demo].[dbo].[sys_FormsControls] SET EngCaption='Area' where formid=72 and section=3 and controlname='colCountry'

UPDATE [Srabeel_Demo].[dbo].[sys_FormsControls] SET EngCaption='Review' where formid=72 and section=3 and controlname='colRemarks'

UPDATE [Srabeel_Demo].[dbo].[sys_FormsControls] SET EngCaption='Review' where formid=72 and section=3 and controlname='colRemarks'

UPDATE [Srabeel_Demo].[dbo].[sys_FormsControls] SET IsHidden=1 where formid=72 and section=3 and controlname='colRemarks'

