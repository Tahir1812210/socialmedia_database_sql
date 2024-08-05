create database work




Create Table tblProducts
(
	[ID] int identity primary key not null,
	[Name] nvarchar(50),
	[Description] nvarchar(50)
)



Create Table tblProductSales
(
	[ID] int primary key not null,
	[ProductID] int foreign key references tblProducts(ID),
	UnitPrice int,
	QuantitySold int
)

Insert into tblProducts

