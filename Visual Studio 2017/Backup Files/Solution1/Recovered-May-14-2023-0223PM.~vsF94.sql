create database mytestdb

use mytestdb
go

create table dbo.Department
(
  departmentId int identity(1,1),
  departmentName varchar(500)
)

insert into dbo.Department values ('IT')
insert into dbo.Department values ('Support')

create table dbo.Employees
(
	employeeId int identity(1,1),
	employeeName nvarchar(500),
	Department nvarchar(500),
	DateOfJoining datetime,
	PhotoFileName nvarchar(500)
)

insert into dbo.Employees values ('Bob','IT',getdate(),'anonymous.png')

select *from department
select *from employees




