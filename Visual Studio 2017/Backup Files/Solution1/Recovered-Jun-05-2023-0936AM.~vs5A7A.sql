create procedure sp_AddCountries
@CountryCode int,
@CountryEnglishName varchar(20),
@CountryArabicName varchar(20)
as
Insert into Countries (CountryCode , CountryEnglishName , CountryArabicName)
values (@CountryCode , @CountryEnglishName , @CountryArabicName)

exec sp_AddCountries @CountryCode=1 , @CountryEnglishName='USA' , @CountryArabicName='USA'
exec sp_AddCountries @CountryCode=2 , @CountryEnglishName='UAE' , @CountryArabicName='UAE'
exec sp_AddCountries @CountryCode=3 , @CountryEnglishName='Austrailia' , @CountryArabicName='Austrailia'
exec sp_AddCountries @CountryCode=4 , @CountryEnglishName='Saudi Arabia' , @CountryArabicName='Saudi Arabia'
exec sp_AddCountries @CountryCode=5 , @CountryEnglishName='Oman' , @CountryArabicName='Oman'
exec sp_AddCountries @CountryCode=6 , @CountryEnglishName='Pakistan' , @CountryArabicName='Pakistan'
exec sp_AddCountries @CountryCode=7 , @CountryEnglishName='India' , @CountryArabicName='India'
exec sp_AddCountries @CountryCode=8 , @CountryEnglishName='France' , @CountryArabicName='France'

create procedure sp_displayCountries
as
select *from Countries

exec sp_displayCountries

create procedure sp_UpdateCountries
@Id int,
@CountryCode int,
@CountryEnglishName varchar(20),
@CountryArabicName varchar(20)
as
update Countries set CountryCode=@CountryCode , CountryEnglishName = @CountryEnglishName ,
CountryArabicName = @CountryArabicName where Id = @Id

create procedure sp_DeleteCountry
@Id int
as
delete Countries where Id = @Id

create procedure sp_GetCountryById
@Id int
as
select *from Countries where Id = @Id

exec sp_GetCountryById @Id = 7

create procedure sp_AddCities
@CityCode int,
@CountryId int,
@CityEnglishName varchar(20),
@CityArabicName varchar(20)
as
insert into Cities (CityCode , CountryId , CityEnglishName , CityArabicName) values
(@CityCode , @countryId , @CityEnglishName , @CityArabicName)

exec sp_AddCities @CityCode = 8 , @CountryId=8 , @CityEnglishName='Le Havre' ,
@CityArabicName='Le Havre'

create procedure sp_DisplayCities
as
select c.Id , c.CityCode , c.CityEnglishName , d.CountryCode , c.CityArabicName from cities
c join Countries d on c.id = d.id



create procedure sp_AddCustomers
@CustomerCode int,
@CustomerEnglishName varchar(20),
@CustomerArabicName varchar(20),
@MobileNo int,
@Email varchar(20),
@AddressLine1 varchar(20),
@AddressLine2 varchar(20),
@AddressLine3 varchar(20),
@CountryId int,
@CityId int
as
Insert into Customers (CustomerCode , CustomerEnglishName, CustomerArabicName , MobileNo , Email , AddressLine1
, AddressLine2 , AddressLine3 , CountryId  , CityId  )
values
(@CustomerCode , @CustomerEnglishName, @CustomerArabicName , @MobileNo , @Email , @AddressLine1
, @AddressLine2 , @AddressLine3 , @CountryId  , @CityId )

exec sp_AddCustomers @CustomerCode=1 , @CustomerEnglishName='Fardeen', @CustomerArabicName='Fardeen' , @MobileNo='66889922' , @Email='fardeen1@gmail.com' , @AddressLine1='A Street'
, @AddressLine2 = 'B Buliding', @AddressLine3 = 'C Flat', @CountryId = 1  , @CityId = 1 

exec sp_AddCustomers @CustomerCode=2 , @CustomerEnglishName='Raza', @CustomerArabicName='Raza' , @MobileNo='66119922' , @Email='raza2@gmail.com' , @AddressLine1='K Street'
, @AddressLine2 = 'N Buliding', @AddressLine3 = 'R Flat', @CountryId = 2  , @CityId = 2 

exec sp_AddCustomers @CustomerCode=3 , @CustomerEnglishName='Qizr', @CustomerArabicName='Qizr' , @MobileNo='66779922' , @Email='qizr3@gmail.com' , @AddressLine1='O Street'
, @AddressLine2 = 'R Buliding', @AddressLine3 = 'L Flat', @CountryId = 3  , @CityId = 3 

exec sp_AddCustomers @CustomerCode=4 , @CustomerEnglishName='Jahangir', @CustomerArabicName='Jahangir' , @MobileNo='66339988' , @Email='qizr3@gmail.com' , @AddressLine1='O Street'
, @AddressLine2 = 'R Buliding', @AddressLine3 = ' S Flat', @CountryId = 4  , @CityId = 4 

exec sp_AddCustomers @CustomerCode=5 , @CustomerEnglishName='Hussain', @CustomerArabicName='Hussain' , @MobileNo='66339988' , @Email='qizr3@gmail.com' , @AddressLine1='P Street'
, @AddressLine2 = 'O Buliding', @AddressLine3 = 'L Flat', @CountryId = 5  , @CityId = 5 

exec sp_AddCustomers @CustomerCode=6 , @CustomerEnglishName='Aslam', @CustomerArabicName='Aslam' , @MobileNo='66339988' , @Email='qizr3@gmail.com' , @AddressLine1='O Street'
, @AddressLine2 = 'P Buliding', @AddressLine3 = 'N Flat', @CountryId = 6  , @CityId = 6

alter procedure sp_displaycustomers 
as
select a.Id , a.CustomerCode , a.CustomerEnglishName ,  a.CustomerArabicName , a.MobileNo ,
a.Email , b.CountryEnglishName , b.CountryArabicName , c.CityEnglishName ,
c.CityArabicName ,
a.AddressLine1 , a.AddressLine2 , a.AddressLine3
from Customers a Join Countries b on a.Id = b.Id
Join Cities c on a.Id = c.Id


create procedure sp_displayCustomersById
@Id int
as
select *from Customers where @Id = Id

create procedure sp_deleteCustomerById
@Id int
as
delete from customers where id = @id



create procedure sp_AddItems
@ItemCode int,
@ItemEnglishName varchar(20),
@ItemArabicName varchar(20),
@Price int,
@Vat int
as
insert into item (ItemCode , ItemEnglishName , ItemArabicName , Price , Vat)
values (@ItemCode , @ItemEnglishName , @ItemArabicName , @Price , @Vat)

exec sp_AddItems @ItemCode=1 , @ItemEnglishName='Desktop' , @ItemArabicName='Desktop' , @Price=200 , @Vat=5
exec sp_AddItems @ItemCode=2 , @ItemEnglishName='Printer' , @ItemArabicName='Printer' , @Price=600 , @Vat=5
exec sp_AddItems @ItemCode=3 , @ItemEnglishName='Keyboard' , @ItemArabicName='Keyboard' , @Price=800 , @Vat=5
exec sp_AddItems @ItemCode=4 , @ItemEnglishName='Mouse' , @ItemArabicName='Mouse' , @Price=400 , @Vat=5
exec sp_AddItems @ItemCode=5 , @ItemEnglishName='CPU' , @ItemArabicName='CPU' , @Price=1000 , @Vat=5
exec sp_AddItems @ItemCode=6 , @ItemEnglishName='USB' , @ItemArabicName='USB' , @Price=1200 , @Vat=5
exec sp_AddItems @ItemCode=7 , @ItemEnglishName='HardDisk' , @ItemArabicName='HardDisk' , @Price=1400 , @Vat=5
exec sp_AddItems @ItemCode=8 , @ItemEnglishName='Charger' , @ItemArabicName='Charger' , @Price=1800 , @Vat=5

create procedure sp_displayItems
as
select *from Item

create procedure sp_updateitems
@Id int,
@ItemCode int,
@ItemEnglishName varchar(20),
@ItemArabicName varchar(20),
@Price int,
@vat int
as
update item set itemcode = @ItemCode , ItemEnglishName = @ItemEnglishName , ItemArabicName = @ItemArabicName ,
Price = @Price , Vat = @Vat where Id=@Id


sp_displayItems

exec sp_updateitems @Id=1  , @ItemCode=1 , @ItemEnglishName = 'Printer' , @ItemArabicName = 'Printer' , @Price=600 , @Vat=5

sp_displayItems

exec sp_updateitems @Id=2  , @ItemCode=2 , @ItemEnglishName = 'Keyboard' , @ItemArabicName = 'Keyboard' , @Price=800 , @Vat=5

sp_displayItems

exec sp_updateitems @Id=3  , @ItemCode=3 , @ItemEnglishName='Mouse' , @ItemArabicName='Mouse' , @Price=400 , @Vat=5
exec sp_updateitems @Id=4  , @ItemCode=4 , @ItemEnglishName='CPU' , @ItemArabicName='CPU' , @Price=1000 , @Vat=5
exec sp_updateitems @Id=5  , @ItemCode=5 , @ItemEnglishName='USB' , @ItemArabicName='USB' , @Price=1200 , @Vat=5
exec sp_updateitems @Id=6  ,@ItemCode=6 , @ItemEnglishName='HardDisk' , @ItemArabicName='HardDisk' , @Price=1400 , @Vat=5
exec sp_updateitems @Id=7  , @ItemCode=7 , @ItemEnglishName='Charger' , @ItemArabicName='Charger' , @Price=1800 , @Vat=5
exec sp_updateitems @Id=8  , @ItemCode=8 , @ItemEnglishName='Desktop' , @ItemArabicName='Desktop' , @Price=200 , @Vat=5


create procedure sp_ItemDelete 
@Id int
as
delete from Item where Id = @Id

create procedure sp_GetItemById
@Id int
as
select *from Item where Id = @Id


create procedure sp_AddHeadDetails
@InvoiceNumber int,
@InvoiceDate datetime2(7),
@Remarks varchar(20),
@TotalSalesInvoiceAmount int,
@TotalVatAmount int,
@TotalSalesVatAmountPlusVatAmount int,
@CustomerId int
as
insert into HeadDetail (InvoiceNumber , InvoiceDate , Remarks , TotalSalesInvoiceAmount , TotalVatAmount ,
TotalSalesVatAmountPlusVatAmount , CustomerId)
values (@InvoiceNumber , @InvoiceDate , @Remarks , @TotalSalesInvoiceAmount , @TotalVatAmount , @TotalSalesVatAmountPlusVatAmount , @CustomerId )


exec sp_AddHeadDetails @InvoiceNumber=2 , @InvoiceDate='2023-02-06' , @Remarks='Good' , @TotalSalesInvoiceAmount=10000 , @TotalVatAmount=5 , @TotalSalesVatAmountPlusVatAmount=110000 , @CustomerId=2
exec sp_AddHeadDetails @InvoiceNumber=3 , @InvoiceDate='2023-02-06' , @Remarks='Good' , @TotalSalesInvoiceAmount=11000 , @TotalVatAmount=5 , @TotalSalesVatAmountPlusVatAmount=120000 , @CustomerId=3
exec sp_AddHeadDetails @InvoiceNumber=4 , @InvoiceDate='2023-02-06' , @Remarks='Good' , @TotalSalesInvoiceAmount=14000 , @TotalVatAmount=5 , @TotalSalesVatAmountPlusVatAmount=150000 , @CustomerId=4
exec sp_AddHeadDetails @InvoiceNumber=5 , @InvoiceDate='2023-02-06' , @Remarks='Good' , @TotalSalesInvoiceAmount=16000 , @TotalVatAmount=5 , @TotalSalesVatAmountPlusVatAmount=170000 , @CustomerId=5
exec sp_AddHeadDetails @InvoiceNumber=6 , @InvoiceDate='2023-02-06' , @Remarks='Good' , @TotalSalesInvoiceAmount=15000 , @TotalVatAmount=5 , @TotalSalesVatAmountPlusVatAmount=160000 , @CustomerId=6



create procedure sp_displayHeadDetails
as
select a.Id , a.InvoiceNumber , a.InvoiceDate , b.CustomerCode , b.CustomerEnglishName , b.CustomerArabicName, a.Remarks , 
a.TotalSalesInvoiceAmount , a.TotalVatAmount , a.TotalSalesVatAmountPlusVatAmount 
from HeadDetail a join Customers b on a.Id = b.Id


create procedure sp_updateHeadDetails
@Id int,
@HeadDetails int,
@InvoiceNumber int,
@InvoiceDate datetime2(7),
@Remarks varchar(20),
@TotalSalesInvoiceAmount int,
@TotalVatAmount int,
@TotalSalesVatAmountPlusVatAmount int,
@CustomerId int
as
update HeadDetail set InvoiceNumber=@InvoiceNumber , InvoiceDate=@InvoiceDate , Remarks=@Remarks , TotalSalesInvoiceAmount=@TotalSalesInvoiceAmount , TotalVatAmount = @TotalVatAmount ,
TotalSalesVatAmountPlusVatAmount = @TotalSalesVatAmountPlusVatAmount , CustomerId = @CustomerId
where id = @id



create procedure sp_deleteheaddetails
@id int
as
delete from HeadDetail where Id = @Id

create procedure sp_getheaddetails
@id int
as
select *from HeadDetail where id = @id



alter procedure sp_AddDetails
@Price int,
@Qty int,
@TotalAmount int,
@Vat int,
@TotalAmountPlusVat int,
@ItemId int
as
insert into Detail 
(Price , Qty , TotalAmount , Vat , TotalAmountPlusVat , ItemId)
values (@Price , @Qty , @TotalAmount , @Vat , @TotalAmountPlusVat , @ItemId)

exec sp_updatedetails @id = 1 , @Price=600 , @Qty=4 , @TotalAmount=650 , @Vat=5 , @TotalAmountPlusVat=700 , @ItemId=1
exec sp_updatedetails @id = 2 , @Price=800 , @Qty=4 , @TotalAmount=850 , @Vat=5 , @TotalAmountPlusVat=900 , @ItemId=2
exec sp_updatedetails  @id = 3 , @Price=900 , @Qty=4 , @TotalAmount=950 , @Vat=5 , @TotalAmountPlusVat=1000 , @ItemId=3
exec sp_updatedetails  @id = 4  , @Price=1000 , @Qty=4 , @TotalAmount=1050 , @Vat=5 , @TotalAmountPlusVat=1100 , @ItemId=4
exec sp_updatedetails  @id = 5 , @Price=1100 , @Qty=4 , @TotalAmount=1150 , @Vat=5 , @TotalAmountPlusVat=1150 , @ItemId=5
exec sp_updatedetails @id = 6 , @Price=1200 , @Qty=4 , @TotalAmount=1250 , @Vat=5 , @TotalAmountPlusVat=1250 , @ItemId=6
exec sp_updatedetails  @id = 7 , @Price=1300 , @Qty=4 , @TotalAmount=1350 , @Vat=5 , @TotalAmountPlusVat=1350 , @ItemId=7
exec sp_updatedetails @id = 8 , @Price=1400 , @Qty=4 , @TotalAmount=1450 , @Vat=5 , @TotalAmountPlusVat=1450 , @ItemId=8


create procedure sp_updatedetails
@Id int,
@Price int,
@Qty int,
@TotalAmount int,
@Vat int,
@TotalAmountPlusVat int,
@ItemId int
as
update detail set  price=@price , qty=@qty , totalamount=@totalamount , vat = @vat , TotalAmountPlusVat = @TotalAmountPlusVat
, ItemId = @ItemId where id = @id

create procedure sp_displaydetails
as
select a.Id , b.ItemCode , b.ItemEnglishName , ItemArabicName  , a.Price , a.Qty , a.TotalAmount , a.vat , a.totalamountplusvat
from detail a join Item b on a.id = b.id

create procedure sp_deletedetails
@id int
as delete from detail where id = @id

create procedure sp_detailsgetbyid
@id int
as select *from detail where id = @id

