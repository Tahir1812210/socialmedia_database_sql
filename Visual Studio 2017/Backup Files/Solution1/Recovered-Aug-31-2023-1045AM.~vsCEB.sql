create database DatabaseFirstDB

USE DatabaseFirstDB

create table clients
(
	ClientId INT PRIMARY KEY IDENTITY(1,1),
	ClientName VARCHAR NOT NULL,
	CustomerAmount Float
);

alter table clients 
add city varchar(50)


alter table clients 
alter column clientname varchar(50)


select *from clients