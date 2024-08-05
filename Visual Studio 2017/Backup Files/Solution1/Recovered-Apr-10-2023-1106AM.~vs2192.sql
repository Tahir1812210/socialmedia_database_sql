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
  where formid=72
  and EngCaption like 'English name'

UPDATE [Srabeel_Demo].[dbo].[sys_FormsControls] SET EngCaption='English Name' , EngCaption='Foreign Name' where formid=72 AND ControlName='colEngName' AND FieldName='engName' AND section=3 AND ControlName like 'colEngName'

UPDATE [Srabeel_Demo].[dbo].[sys_FormsControls] SET EngCaption='English Name' , EngCaption='Foreign Name' where ControlName = 'colEngName'



SELECT[FormID]
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
  where EngCaption like 'Remarks' and FormID = 25










