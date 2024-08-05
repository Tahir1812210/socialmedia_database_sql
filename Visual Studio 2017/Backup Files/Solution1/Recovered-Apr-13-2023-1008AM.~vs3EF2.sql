create database practicework
use practicework
go

Create Table tblProducts
(
 [Id] int identity primary key,
 [Name] nvarchar(50),
 [Description] nvarchar(250)
)

Create Table tblProductSales
(
 Id int primary key identity,
 ProductId int foreign key references tblProducts(Id),
 UnitPrice int,
 QuantitySold int
)

Insert into tblProducts values ('TV', '52 inch black color LCD TV')
Insert into tblProducts values ('Laptop', 'Very thin black color acer laptop')
Insert into tblProducts values ('Desktop', 'HP high performance desktop')

Insert into tblProductSales values(3, 450, 5)
Insert into tblProductSales values(2, 250, 7)
Insert into tblProductSales values(3, 450, 4)
Insert into tblProductSales values(3, 450, 9)

select *from tblProducts
select *from tblProductSales

select Id , [Name] , [Description] from tblProducts
where Id NOT IN (select distinct Productid from tblProductSales)

select tblProducts.Id , [Name] , [Description] from tblProducts left join tblProductSales
on tblProducts.Id = tblProductSales.ProductId where tblProductSales.ProductId is null

Select Name, (Select SUM(QuantitySold) from tblProductSales
where ProductID = tblProducts.Id
) as QTYSold
from tblProducts order by [name]



