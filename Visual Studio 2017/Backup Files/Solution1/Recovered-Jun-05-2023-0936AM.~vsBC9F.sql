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


create procedure sp_UpdateCountries
@Id int,
@CountryCode int,
@CountryEnglishName varchar(20),
@CountryArabicName varchar(20)
as
update Countries set CountryCode=@CountryCode , CountryEnglishName = @CountryEnglishName ,
CountryArabicName = @CountryArabicName where Id = @Id

exec sp_UpdateCountries @Id=8 , @CountryCode=8 , @CountryEnglishName = 'Romania' ,
@CountryArabicName = 'Romania'


create procedure sp_DeleteCountry
@Id int
as
delete Countries where Id = @Id

exec sp_DeleteCountry @Id=9
exec sp_DeleteCountry @Id=10
exec sp_DeleteCountry @Id=11
exec sp_DeleteCountry @Id=12
exec sp_DeleteCountry @Id=13
exec sp_DeleteCountry @Id=14
exec sp_DeleteCountry @Id=15
exec sp_DeleteCountry @Id=16

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



exec sp_AddCities @CityCode = 1 , @CountryId=1 , @CityEnglishName='San Fransisco' ,
@CityArabicName='San Fransisco'

exec sp_AddCities @CityCode = 2 , @CountryId=2 , @CityEnglishName='Dubai' ,
@CityArabicName='Dubai'

exec sp_AddCities @CityCode = 3 , @CountryId=3 , @CityEnglishName='Melbourne' ,
@CityArabicName='Melbourne'

exec sp_AddCities @CityCode = 4 , @CountryId=4 , @CityEnglishName='Jeddah' ,
@CityArabicName='Jeddah'

exec sp_AddCities @CityCode = 5 , @CountryId=5 , @CityEnglishName='Muscat' ,
@CityArabicName='Muscat'

exec sp_AddCities @CityCode = 6 , @CountryId=6 , @CityEnglishName='Karachi' ,
@CityArabicName='Karachi'

exec sp_AddCities @CityCode = 7 , @CountryId=7 , @CityEnglishName='Hyderabad Deccan' ,
@CityArabicName='Hyderabad Deccan'


create procedure sp_DisplayCities
as
select c.Id , c.CityCode , c.CityEnglishName , d.CountryCode , c.CityArabicName from cities
c join Countries d on c.id = d.id

select id , cities.CityEnglishName from cities


sp_displayCountries

create procedure sp_UpdateCities
@Id int,
@CityCode int,
@CountryId int,
@CityEnglishName varchar(20),
@CityArabicName varchar(20)
as 
update Cities set  CityCode = @CityCode , CountryId = @CountryId
, CityEnglishName = @CityEnglishName , CityArabicName = @CityArabicName
where Id = @id

exec sp_UpdateCities @Id=65 , @CityCode=65 , @CountryId=1 , @CityEnglishName = 'Karachi'  
, @CityArabicName='Karachi' 

exec sp_UpdateCities @Id=7 , @CityCode=7 , @CountryId=7 , @CityEnglishName = 'Delhi'  
, @CityArabicName='Delhi'

sp_DisplayCities


exec sp_UpdateCities @Id=1 , @CityCode = 1 , @CountryId=1 , @CityEnglishName='San Fransisco' ,
@CityArabicName='San Fransisco'

exec sp_UpdateCities @Id=2 , @CityCode = 2 , @CountryId=2 , @CityEnglishName='Dubai' ,
@CityArabicName='Dubai'

exec sp_UpdateCities @Id=3 , @CityCode = 3 , @CountryId=3 , @CityEnglishName='Melbourne' ,
@CityArabicName='Melbourne'

exec sp_UpdateCities  @Id=4 ,@CityCode = 4 , @CountryId=4 , @CityEnglishName='Jeddah' ,
@CityArabicName='Jeddah'

exec sp_UpdateCities @Id=5 , @CityCode = 5 , @CountryId=5 , @CityEnglishName='Muscat' ,
@CityArabicName='Muscat'

exec sp_UpdateCities @Id=6 , @CityCode = 6 , @CountryId=6 , @CityEnglishName='Karachi' ,
@CityArabicName='Karachi'

exec sp_UpdateCities @Id=7 , @CityCode = 7 , @CountryId=7 , @CityEnglishName='Hyderabad Deccan' ,
@CityArabicName='Hyderabad Deccan'


alter procedure sp_DeleteCities
@Id int
as
delete from Cities where id = @id

exec sp_DeleteCities @Id = 7

create procedure sp_GetCitiesById
@Id int
as
select *from cities where Id = @Id

sp_GetCitiesById @Id=6


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


