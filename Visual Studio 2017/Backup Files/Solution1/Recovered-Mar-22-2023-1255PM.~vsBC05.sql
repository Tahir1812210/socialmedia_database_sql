create database EmployeeDB

use EmployeeDB
go

create table dbo.Department
(
	DepartmentID int identity(1,1),
	DepartmentName varchar(500)
)

select *from dbo.Department;

insert into dbo.Department values ('IT') , ('Support')

create table dbo.Employee
(
	EmployeeID int identity(1,1),
	EmployeeName varchar(500),
	Department varchar(500),
	DateOfJoining date,
	PhotoFileName varchar(500)
)

insert into dbo.Employee values ('Sam','IT','2020-06-01','anonymous.png');

select *from dbo.Employee

select DepartmentID, DepartmentName from dbo.Department



