create database crudoperations

use crudoperations
go

create table Employees
(
	ID int identity(1,1) not null primary key,
	Name varchar(20),
	Gender varchar(20),
	Region varchar(20),
	Department varchar(20),
	Salary int
)

select *from Employee


