create database socialnetwork

use socialnetwork 
go

create table registration
(
 ID int identity(1,1) primary key,
 [name] varchar(100),
 email varchar(100),
 [password] varchar(100),
 phone varchar(100),
 isActive int,
 isApproved int
)

create table Article
(
 ID int identity(1,1) primary key,
 [Title] varchar(100),
 content varchar(100),
 Email varchar(100),
 [Image] varchar(100),
 isActive int,
 isApproved int
)

drop table News

create Table TheNews
(
ID int identity(1,1) Primary Key,
Title varchar(100),
Content varchar(100),
Email varchar(100),
isActive int,
CreatedOn Datetime
)

create Table TheEvents
(
ID int identity(1,1) Primary Key,
Title varchar(100),
Content varchar(100),
Email varchar(100),
isActive int,
CreatedOn Datetime
)

select *from registration
select *from Article
select *from thenews
select *from TheEvents




