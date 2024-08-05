--create country 
create procedure sp_insertcountries
@countryenglishname varchar(20),
@countryarabicname varchar(20)
as
insert into countries (countryenglishname , countryarabicname) values (@countryenglishname , @countryarabicname)


exec sp_insertcountries @countryenglishname='Austrailia' , @countryarabicname='Austrailia'
exec sp_insertcountries @countryenglishname='India' , @countryarabicname='India'


--read country
create procedure sp_displaycountries
as
select countryenglishname , countryarabicname from countries

exec sp_displaycountries

--delete country
create procedure sp_deletecountries
@countrycode int
as
delete from countries where countrycode = @countrycode

exec sp_deletecountries @countrycode = 1


--update country
create procedure sp_updatecountries
@countrycode int,
@countryenglishname varchar(20),
@countryarabicname varchar(20)
as
update countries set countryenglishname=@countryenglishname , countryarabicname=@countryarabicname
where countrycode = @countrycode

exec sp_updatecountries @countrycode=2 , @countryenglishname='England', @countryarabicname='England'


---create cities
create procedure sp_insertcities 
@countrycode int,
@cityenglishname varchar(20),
@cityarabicname varchar(20)
as
insert into cities (countrycode, cityenglishname, cityarabicname) values
(@countrycode, @cityenglishname, @cityarabicname)

exec sp_insertcities @countrycode=2 , @cityenglishname='Toronto' , @cityarabicname='Toronto'
exec sp_insertcities @countrycode=3 , @cityenglishname='London' , @cityarabicname='London'
exec sp_insertcities @countrycode=4 , @cityenglishname='Karachi' , @cityarabicname='Karachi'
exec sp_insertcities @countrycode=5 , @cityenglishname='Durban' , @cityarabicname='Durban'
exec sp_insertcities @countrycode=6 , @cityenglishname='Sydney' , @cityarabicname='Sydney'
---display cities
create procedure sp_displaycities
as 
Select citycode, countrycode, cityenglishname, cityarabicname
from cities

exec sp_displaycities


---delete cities
create procedure sp_deletecities
@citycode int
as
delete from cities where citycode = @citycode

exec sp_deletecities @citycode=2

---update cities
create procedure sp_updatecities
@citycode int,
@countrycode int,
@cityenglishname varchar(20),
@cityarabicname varchar(20)
as
update cities set countrycode = @countrycode , cityenglishname = @cityenglishname , cityarabicname = @cityarabicname
where citycode = @citycode

exec sp_updatecities @citycode=1, @countrycode=2, @cityenglishname='Nova Scotia' , @cityarabicname='Nova Scotia'



---insert customers
create procedure sp_insertcustomers
@englishname varchar(20),
@arabicname varchar(20),
@mobileno int,
@email varchar(20),
@country int,
@city int,
@addressline1 varchar(20),
@addressline2 varchar(20),
@addressline3 varchar(20)
as
insert into customers (englishname, arabicname, mobileno, email, country, city, addressline1, addressline2,
addressline3) values ( @englishname, @arabicname, @mobileno, @email, @country, @city, @addressline1, @addressline2,
@addressline3)

exec sp_insertcustomers  @englishname='Ali' , @arabicname='Ali', @mobileno=66889922, 
@email='ali1@gmail.com' , @country=2 , @city=1, @addressline1='Hamra' , @addressline2='Jeddah' , @addressline3='SaudiArabia'

exec sp_insertcustomers @englishname='Wasif' , @arabicname='Wasif' , @mobileno=66889900,
@email='wasif1@gmail.com' , @country=4 , @city=5, @addressline1=' a street' , @addressline2='b buliding', @addressline3='c house'

exec sp_insertcustomers @englishname='Rafay' , @arabicname='Rafay' , @mobileno=66889900,
@email='rafay1@gmail.com' , @country=5 , @city=6, @addressline1=' x street' , @addressline2='c buliding', @addressline3='h house'

exec sp_insertcustomers @englishname='Wasif' , @arabicname='Wasif' , @mobileno=66889900,
@email='wasif1@gmail.com' , @country=6 , @city=7, @addressline1=' l street' , @addressline2='p buliding', @addressline3='q house'

exec sp_insertcustomers @englishname='Nadeem' , @arabicname='Nadeem' , @mobileno=66889900,
@email='nadeem1@gmail.com' , @country=3 , @city=4, @addressline1=' o street' , @addressline2='p buliding', @addressline3='m house'





---display customers
create procedure sp_displaythecustomers
as
select customercode , englishname , arabicname , mobileno , email , countryenglishname , cityenglishname
from customers c 
join countries d on d.countrycode = c.country
join cities e on e.citycode = c.city
order by customercode

exec sp_displaythecustomers 


create procedure sp_deletecustomers
@customercode int
as
delete from customers where customercode = @customercode

exec sp_deletecustomers @customercode=8

---update customers
create procedure sp_updatecustomers
@customercode int,
@englishname varchar(20),
@arabicname varchar(20),
@mobileno int,
@email varchar(20),
@country int,
@city int,
@addressline1 varchar(20),
@addressline2 varchar(20),
@addressline3 varchar(20)
as
update customers set englishname=@englishname , arabicname = @arabicname ,
mobileno = @mobileno , email = @email , country=@country , city=@city , addressline1 = @addressline1 ,
addressline2 = @addressline2 , addressline3 = @addressline3 where customercode = @customercode


exec sp_updatecustomers @customercode = 4 , @englishname='Hesham' , @arabicname='Hesham' , @mobileno=66889900,
@email='hesham1@gmail.com' , @country=4 , @city=5, @addressline1=' x street' , @addressline2='c buliding', @addressline3='h house'


--- create items
alter procedure sp_insertitems
@itemenglishname varchar(20),
@itemarabicname varchar(20),
@price int,
@vat int
as
insert into items (itemenglishname , itemarabicname , price , vat) values 
(@itemenglishname , @itemarabicname , @price, @vat)

exec sp_insertitems @itemenglishname = 'Printer' , @itemarabicname = 'Printer' , @price = 200 , @vat = 5
exec sp_insertitems @itemenglishname = 'Laptop' , @itemarabicname = 'Laptop' , @price = 200 , @vat = 5
exec sp_insertitems @itemenglishname = 'Desktop' , @itemarabicname = 'Desktop' , @price = 200 , @vat = 5
exec sp_insertitems @itemenglishname = 'Keyboard' , @itemarabicname = 'Keyboard' , @price = 200 , @vat = 5

---display items
create procedure sp_displayitems
as
select itemenglishname , itemarabicname , price , vat from items

exec sp_displayitems


---delete items
create procedure sp_deleteitems
@itemcode int
as
delete from items where itemcode = @itemcode

exec sp_deleteitems @itemcode=4

---update items
create procedure sp_updateitems
@itemcode int,
@itemenglishname varchar(20),
@itemarabicname varchar(20),
@price int,
@vat int
as
update items set itemenglishname=@itemenglishname , itemarabicname=@itemarabicname ,
price = @price , vat = @vat where itemcode = @itemcode

exec sp_updateitems @itemcode = 3 , @itemenglishname='Keyboard' , @itemarabicname='Keyboard' , @price=200 , @vat=5

---insert head details
create procedure sp_insertheaddetails
	@invoicedate datetime2(7),
	@customercode int,
	@customername int,
	@remarks varchar(20),
	@totalsalesinvoiceamount int,
	@totalvatamount int,
	@totalsalesamountplusvatamount int
as
insert into headdetails (invoicedate , customercode , customername , remarks , totalsalesinvoiceamount,
totalvatamount , totalsalesamountplusvatamount) values 
(@invoicedate , @customercode , @customername , @remarks , @totalsalesinvoiceamount , 
@totalvatamount , @totalsalesamountplusvatamount)

exec sp_insertheaddetails @invoicedate = '2023-05-31' , @customercode = 3 , @customername = 3 , @remarks='Good'
, @totalsalesinvoiceamount = 4000 , @totalvatamount = 5 , @totalsalesamountplusvatamount=6000

exec sp_insertheaddetails @invoicedate = '2023-04-22' , @customercode = 4 , @customername = 4 , @remarks='Good'
, @totalsalesinvoiceamount = 4000 , @totalvatamount = 5 , @totalsalesamountplusvatamount=6000

exec sp_insertheaddetails @invoicedate = '2023-03-11' , @customercode = 6 , @customername = 6 , @remarks='Good'
, @totalsalesinvoiceamount = 4000 , @totalvatamount = 5 , @totalsalesamountplusvatamount=6000

exec sp_insertheaddetails @invoicedate = '2023-03-12' , @customercode = 8 , @customername = 8 , @remarks='Good'
, @totalsalesinvoiceamount = 4000 , @totalvatamount = 5 , @totalsalesamountplusvatamount=6000


---display headdetails
alter procedure sp_displayheaddetails
as
select c.invoicenumber , c.invoicedate , d.customercode , d.englishname , c.remarks , c.totalsalesinvoiceamount ,
 c.totalvatamount , c.totalsalesamountplusvatamount 
from headdetails c 
join customers d on c.invoicenumber = d.customercode


exec sp_displayheaddetails


--delete headdetails
create procedure sp_deleteheaddetails
@invoicenumber int
as
delete from headdetails where invoicenumber = @invoicenumber

exec sp_deleteheaddetails @invoicenumber=4


---update headdetails

alter procedure sp_updateheaddetails
@invoicenumber int,
@invoicedate datetime2(7),
	@customercode int,
	@customername int,
	@remarks varchar(20),
	@totalsalesinvoiceamount int,
	@totalvatamount int,
	@totalsalesamountplusvatamount int
as
update headdetails set invoicedate=@invoicedate , customercode=@customercode ,
customername = @customername , remarks = @remarks , totalsalesinvoiceamount=@totalsalesinvoiceamount ,
totalvatamount = @totalvatamount , totalsalesamountplusvatamount = @totalsalesamountplusvatamount
where invoicenumber=@invoicenumber

execute sp_updateheaddetails @invoicenumber=1 ,  @invoicedate = '2023-03-22' , @customercode = 3 , @customername = 3 , @remarks='Good'
, @totalsalesinvoiceamount = 4000 , @totalvatamount = 5 , @totalsalesamountplusvatamount=6000

execute sp_updateheaddetails @invoicenumber=3 ,  @invoicedate = '2023-03-22' , @customercode = 4 , @customername = 4 , @remarks='Good'
, @totalsalesinvoiceamount = 4000 , @totalvatamount = 5 , @totalsalesamountplusvatamount=6000

execute sp_updateheaddetails @invoicenumber=2 ,  @invoicedate = '2023-03-22' , @customercode = 6 , @customername = 6 , @remarks='Good'
, @totalsalesinvoiceamount = 4000 , @totalvatamount = 5 , @totalsalesamountplusvatamount=6000

--- create details
alter procedure sp_createdetails 
@itemname int,
@price int,
@qty int,
@totalamount int,
@vat int,
@totalamountplusvat int
as
insert into details (itemname , price , qty , totalamount , vat , totalamountplusvat)
values ( @itemname , @price , @qty , @totalamount , @vat , @totalamountplusvat)

exec sp_createdetails @itemname=1 , @price=6000 , @qty=4 , @totalamount=6000 , @vat=5 , @totalamountplusvat = 7000
exec sp_createdetails @itemname=2 , @price=8000 , @qty=4 , @totalamount=8000 , @vat=5 , @totalamountplusvat = 9000
exec sp_createdetails @itemname=3 , @price=4000 , @qty=4 , @totalamount=8000 , @vat=5 , @totalamountplusvat = 6000

--displaydetails
create procedure sp_displaydetails
as
select d.itemcode , d.itemenglishname , c.price , c.qty , c.totalamount , c.vat , c.totalamountplusvat
from details c join items d on d.itemcode = c.itemcode

exec sp_displaydetails


--deletedetails
create procedure sp_deletedetails
@itemcode int
as
delete from details where itemcode = @itemcode

exec sp_deletedetails @itemcode = 3


---update details
create procedure sp_updatedetails
@itemcode int,
@itemname int,
@price int,
@qty int,
@totalamount int,
@vat int,
@totalamountplusvat int
as
update details set 
itemname = @itemname , price = @price , qty = @qty , totalamount = @totalamount , vat = @vat
, totalamountplusvat = @totalamountplusvat where itemcode = @itemcode


---countries get by id
create procedure sp_countriesgetbyid
@countrycode int
as
select *from countries where countrycode = @countrycode


exec sp_countriesgetbyid @countrycode = 3


---cities get by id
create procedure sp_citiesgetbyid
@citycode int
as
select *from cities where citycode = @citycode


---customers get by id
create procedure sp_customergetbyid
@customercode int
as
Select *from customers where customercode = @customercode

---items get by id
create procedure sp_itemsgetbyid
@itemcode int
as
Select *from items where itemcode = @itemcode


create procedure sp_headdetailsgetbyid
@Invoicenumber int
as
Select *from headdetails where invoicenumber = @Invoicenumber


create procedure sp_detailsgetbyid
@itemcode int
as
Select *from details where itemcode = @itemcode