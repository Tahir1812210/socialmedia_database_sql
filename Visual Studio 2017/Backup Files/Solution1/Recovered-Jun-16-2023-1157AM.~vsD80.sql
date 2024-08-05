

create procedure sp_updatecountries
@Id int,
@CountryEnglishName varchar(max),
@CountryArabicName varchar(max),
@CountryCode varchar(max)
as
update countries set countryenglishname=@countryenglishname , countryarabicname=@countryarabicname ,
countrycode = @countrycode where id = @id


alter procedure sp_addcountry
@CountryEnglishName varchar(max),
@CountryArabicName varchar(max),
@CountryCode varchar(max)
as
insert into countries (countryenglishname , CountryArabicName , countrycode) values (@CountryEnglishName ,
@CountryArabicName , @CountryCode)

exec sp_addcountry @CountryEnglishName='USA' ,
@CountryArabicName='USA' , @CountryCode='USA111'

exec sp_addcountry @CountryEnglishName='UK' ,
@CountryArabicName='UK' , @CountryCode='UK222'

exec sp_addcountry @CountryEnglishName='UAE' ,
@CountryArabicName='UAE' , @CountryCode='UK333'

select *from countries


create procedure sp_updatecity
@Id int,
@CityEnglishName varchar(max),
@CityArabicName varchar(max),
@CityCode varchar(max),
@CountryId int
as
update Cities set cityenglishname = @cityenglishname , cityarabicname = @cityarabicname 
, citycode = @citycode where id = @id


alter procedure sp_AddCity
@CityEnglishName varchar(max),
@CityArabicName varchar(max),
@CityCode varchar(max),
@CountryId int
as
insert into cities (cityenglishname , CityArabicName , CityCode , CountryId) values (@CityEnglishName ,
@CityArabicName , @CityCode , @CountryId)

select *from countries

exec sp_AddCity @CityEnglishName='San Fransisco' ,
@CityArabicName='San Fransisco' , @CityCode='SanFransisco111' , @CountryId=33

exec sp_AddCity @CityEnglishName = 'Chicago' , @CityArabicName='Chicago' , @CityCode='Chicago111' , @CountryId=33

exec sp_AddCity @CityEnglishName='London' ,
@CityArabicName='London' , @CityCode='London222' , @CountryId=34

exec sp_AddCity @CityEnglishName = 'Manchester' , @CityArabicName='Manchester' , @CityCode='Manchester222' , @CountryId=34

exec sp_AddCity @CityEnglishName = 'LiverPool' , @CityArabicName='LiverPool' , @CityCode='LiverPool333' , @CountryId=34



select *from countries
select *from cities

update countries set countrycode='UK333' where id=3

select *from countries

delete from countries

create procedure updatecustomers
@id int,
@customercode varchar(max),
@englishname varchar(max),
@arabicname varchar(max),
@mobilenumber varchar(max),
@email varchar(max),
@addressline1 varchar(max),
@addressline2 varchar(max),
@addressline3 varchar(max),
@countryid int,
@cityid int
as 
update customers set customercode = @customercode , englishname = @englishname , arabicname = @arabicname ,
mobilenumber = @mobilenumber , email = @email , addressline1 = @addressline1 , addressline2 = @addressline2 ,
addressline3 = @addressline3 , countryid = @countryid , cityid = @cityid where id = @id



alter procedure sp_addcustomers
@customercode varchar(max),
@englishname varchar(max),
@arabicname varchar(max),
@mobilenumber varchar(max),
@email varchar(max),
@addressline1 varchar(max),
@addressline2 varchar(max),
@addressline3 varchar(max),
@countryid int,
@cityid int
as
insert into customers (customercode ,
englishname ,
arabicname ,
mobilenumber ,
email,
addressline1 ,
addressline2 ,
addressline3 ,
countryid, 
cityid)  values (@customercode ,
@englishname ,
@arabicname ,
@mobilenumber ,
@email ,
@addressline1 ,
@addressline2 ,
@addressline3 ,
@countryid ,
@cityid )




exec sp_addcustomers 
@customercode = 'Ali111',
@englishname = 'Ali',
@arabicname = 'Ali',
@mobilenumber= '22334411',
@email='ali1@gmail.com',
@addressline1 = 'AN Street',
@addressline2 = 'BR Building',
@addressline3 = 'HM Flat',
@countryid = 33,
@cityid= 2

exec sp_addcustomers 
@customercode = 'Faizan222',
@englishname = 'Faizan',
@arabicname = 'Faizan',
@mobilenumber= '22664411' ,
@email = 'faizan1@gmail.com',
@addressline1 = 'AG Street',
@addressline2 = 'RB Building',
@addressline3 = 'MT Flat',
@countryid = 33,
@cityid= 3

exec sp_addcustomers 
@customercode = 'Rashid444',
@englishname = 'Rashid',
@arabicname = 'Rashid',
@mobilenumber= '22884411' ,
@email='rashid1@gmail.com',
@addressline1 = 'GA Street',
@addressline2 = 'BK Building',
@addressline3 = 'ML Flat',
@countryid = 34,
@cityid= 4


exec sp_addcustomers 
@customercode = 'Waheed666',
@englishname = 'Waheed',
@arabicname = 'Waheed',
@mobilenumber= '22884411' ,
@email='waheed1@gmail.com',
@addressline1 = 'GA Street',
@addressline2 = 'BK Building',
@addressline3 = 'ML Flat',
@countryid = 34,
@cityid= 5



update Customers set mobilenumber='22994411' where id=4

create procedure sp_updateitems
@Id int,
@ItemCode varchar(max),
@ItemEnglishName varchar(max),
@ItemArabicName varchar(max),
@Price int, 
@Vat int
as
update items set itemcode=@itemcode , itemenglishname=@itemenglishname , itemarabicname = @itemarabicname ,
price = @price , vat = @vat where id = @id

create procedure sp_AddItems
@ItemCode varchar(max),
@ItemEnglishName varchar(max),
@ItemArabicName varchar(max),
@Price int, 
@Vat int
as
insert into items (itemcode , itemenglishname , itemarabicname , price , vat)
values (@itemcode , @itemenglishname , @itemarabicname , @price , @vat)

sp_additems @itemcode='desktop111' , @itemenglishname='desktop' , @itemarabicname='desktop' , @price=200 , @vat=5
sp_additems @itemcode='printer333' , @itemenglishname='printer' , @itemarabicname='printer' , @price=200 , @vat=5
sp_additems @itemcode='monitor444' ,  @itemenglishname='monitor' , @itemarabicname='monitor' , @price=300 , @vat=5
sp_additems @itemcode='mouse888' , @itemenglishname='mouse' , @itemarabicname='mouse' , @price=100 , @vat=5

create procedure sp_updateheaddetails 
@Id int,
@invoicenumber int,
@invoicedate datetime2(7),
@customerid int,
@remarks varchar(max),
@totalsalesinvoiceamount varchar(max),
@totalvatamount varchar(max),
@totalsalesinvoiceamountplusvatamount int
as
update headdetails set  invoicenumber = @invoicenumber , invoicedate = @invoicedate ,
customerid = @customerid , remarks = @remarks , totalsalesinvoiceamount = @totalsalesinvoiceamount ,
totalvatamount = @totalvatamount , totalsalesinvoiceamountplusvatamount = @totalsalesinvoiceamountplusvatamount
where id = @id

create procedure sp_addheaddetails
@invoicenumber int,
@invoicedate datetime2(7),
@customerid int,
@remarks varchar(max),
@totalsalesinvoiceamount varchar(max),
@totalvatamount varchar(max),
@totalsalesinvoiceamountplusvatamount int
as
insert into HeadDetails (InvoiceNumber , invoicedate, customerid , remarks , totalsalesinvoiceamount , totalvatamount 
, totalsalesinvoiceamountplusvatamount) values (@invoicenumber ,
@invoicedate ,
@customerid ,
@remarks ,
@totalsalesinvoiceamount ,
@totalvatamount ,
@totalsalesinvoiceamountplusvatamount)



exec sp_addheaddetails @invoicenumber=214786 , @invoicedate='2023-02-01' , @customerid=2 ,
@remarks='Good' , @totalsalesinvoiceamount=7000 , @totalvatamount=5 , @totalsalesinvoiceamountplusvatamount=8000

exec sp_addheaddetails @invoicenumber=214616 , @invoicedate='2023-02-01' , @customerid=5 ,
@remarks='Good' , @totalsalesinvoiceamount=5000 , @totalvatamount=5 , @totalsalesinvoiceamountplusvatamount=6000

exec sp_addheaddetails @invoicenumber=214796 , @invoicedate='2023-03-01' , @customerid=3 ,
@remarks='Good' , @totalsalesinvoiceamount=6000 , @totalvatamount=5 , @totalsalesinvoiceamountplusvatamount=7000

exec sp_addheaddetails @invoicenumber=214786 , @invoicedate='2023-04-01' , @customerid=4 ,
@remarks='Good' , @totalsalesinvoiceamount=8000 , @totalvatamount=5 , @totalsalesinvoiceamountplusvatamount=9000

exec sp_addheaddetails @invoicenumber=214796 , @invoicedate='2023-03-01' , @customerid=3 ,
@remarks='Good' , @totalsalesinvoiceamount=6000 , @totalvatamount=5 , @totalsalesinvoiceamountplusvatamount=7000

exec sp_addheaddetails @invoicenumber=213786 , @invoicedate='2023-01-02' , @customerid=2 ,
@remarks='Good' , @totalsalesinvoiceamount=1000 , @totalvatamount=5 , @totalsalesinvoiceamountplusvatamount=2000


create procedure sp_updatedetails
@Id int,
@itemid int,
@price int,
@qty int,
@totalamount int,
@vat int,
@totalamountplusvat int
as
update details set itemid = @itemid , price = @price , qty = @qty , totalamount = @totalamount ,
vat = @vat , totalamountplusvat = @totalamountplusvat where id = @id


alter procedure sp_adddetails
@itemid int,
@price int,
@qty int,
@totalamount int,
@vat int,
@totalamountplusvat int
as
insert into Details (itemid  , qty , totalamount , price ,vat , totalamountplusvat)
values (@itemid  , @qty , @totalamount , @price , @vat , @totalamountplusvat)

exec sp_adddetails @itemid=1 , @qty=10 , @price=2000 , @totalamount=2200 , @vat=5 , @totalamountplusvat=2300
exec sp_adddetails @itemid=4 , @price=2000 , @qty=10 , @totalamount=2200 , @vat=5 , @totalamountplusvat=2300
exec sp_adddetails @itemid=2 , @price=2000 , @qty=10 , @totalamount=2200 , @vat=5 , @totalamountplusvat=2300
exec sp_adddetails @itemid=3 , @price=3000 , @qty=10 , @totalamount=3300 , @vat=5 , @totalamountplusvat=2300
exec sp_adddetails @itemid=2 , @price=2000 , @qty=10 , @totalamount=2200 , @vat=5 , @totalamountplusvat=2300
exec sp_adddetails @itemid=3 , @price=2000 , @qty=10 , @totalamount=2200 , @vat=5 , @totalamountplusvat=2300




displaycountries 
select *from countries
select *from cities
select *from customers
select *from items
select *from headdetails
select *from details

create procedure displaycountries 
as
select countryenglishname , countryarabicname , countrycode from countries


alter procedure sp_displaycities
as
select a.citycode , a.cityenglishname , a.cityarabicname , b.countrycode 
from Cities a left join Countries b on a.CountryId = b.id


sp_displaycities


select *from countries
select *from cities
select *from customers

create procedure sp_displaycustomers
as
select a.customercode , a.englishname , a.arabicname , a.mobilenumber , a.email , a.addressline1 ,
a.addressline2 , a.addressline3 , b.countryenglishname , b.countryarabicname , b.countrycode ,
c.cityenglishname , c.cityarabicname , c.citycode from Customers a left join Countries b on a.CountryId = b.id
left join Cities c on a.CityId = c.id


create procedure sp_displayitems
as
select itemcode , itemenglishname , itemarabicname , price , vat from Items


create procedure sp_displayheaddetails 
as
select a.invoicenumber , a.invoicedate , b.customercode , b.englishname , b.arabicname , a.remarks ,
a.totalsalesinvoiceamount , a.totalvatamount , a.totalsalesinvoiceamountplusvatamount
from HeadDetails a left join Customers b on a.CustomerId = b.id


create procedure display_details 
as
select b.itemcode , b.itemenglishname , b.itemarabicname , b.price , a.qty , a.totalamount , a.vat , a.totalamountplusvat
from Details a join Items b on a.ItemId = b.Id

select *from Details

update details set totalamountplusvat=3400 where id = 4

select *from countries
select *from cities

create procedure sp_getcountriesbyid
@Id int
as
select *from Countries where id = @id


create procedure sp_getcitiesbyid
@Id int
as
select *from cities where id = @id

sp_getcitiesbyid @id=2

select *from cities

create procedure sp_getcountries
as
select *from countries

create procedure sp_getcountryidforcountrycode
@Id int
as
select *from cities where countryid = @Id

alter procedure sp_getcitiesbyiddowncascade
@Id int 
as
select *from cities where CountryId = @Id

sp_getcitiesbyiddowncascade @Id=33


select *from countries
select *from cities
select *from customers

create procedure sp_getcustomerbyid
@Id int
as
select *from customers where id  = @id

create procedure sp_getcustomer
as
select *from customers

create procedure sp_getitem
as
select *from items

create procedure sp_getitembyid
@Id int
as
select *from items where id = @id

create procedure sp_getheaddetailsbyid
@id int
as
select *from HeadDetails where id = @id

create procedure sp_getheaddetails
as
select *from HeadDetails

create procedure sp_getdetailsbyid
@id int
as
select *from details where id = @id



select *from countries
select *from cities

create procedure sp_getcitiesbyidfordowncascadingcountriesid
@Id int
as
select *from cities where countryid = @Id

select *from customers

create procedure sp_getcustomersbyidfordowncascadingcountryid
@Id int
as
select *from customers where countryid = @Id

create procedure sp_getcustomersbyidfordowncascadingcityid
@Id int
as
select *from customers where cityid = @Id


select *from headdetails

create procedure sp_getheaddetailsbyidfordowncascadingcustomerid
@Id int
as
select *from headdetails where customerid = @Id

select *from details

create procedure sp_detailsbyidfordowncascadingitemid
@Id int
as
select *from details where itemid = @Id

select *from countries

create procedure sp_deletecountry
@Id int
as
delete from countries where id = @Id

sp_deletecountry @Id = 35

sp_displaycountries

select *from cities
sp_displaycities


select *from cities

create procedure sp_deletecities
@Id int
as
delete from cities where id = @id

sp_deletecities @id=6


create procedure sp_deletecustomers
@Id int
as 
delete from customers where id = @id

create procedure sp_deleteitems
@Id int
as
delete from items where id = @id

create procedure sp_deleteheaddetails
@Id int
as
delete from headdetails where id = @id

create procedure sp_deletedetails
@Id int
as
delete from details where id = @id



