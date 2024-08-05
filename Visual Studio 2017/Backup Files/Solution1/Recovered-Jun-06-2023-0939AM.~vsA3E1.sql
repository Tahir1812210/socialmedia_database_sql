create procedure sp_UpdateCustomers
@Id int,
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
update Customers set CustomerCode = @CustomerCode , CustomerEnglishName = @CustomerEnglishName , 
CustomerArabicName = @CustomerArabicName , MobileNo = @MobileNo , Email = @Email ,
AddressLine1 = @AddressLine1 , AddressLine2 = @AddressLine2 , AddressLine3 = @AddressLine3 ,
CountryId = @CountryId , CityId = @CityId where Id = @Id;