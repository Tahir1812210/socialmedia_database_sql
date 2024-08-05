create database practicetask

use practicetask
go

create table Employee(
Employee_ID int primary key identity(1,1),
Employee_Name varchar(20),
Employee_Designation varchar(20)
)

insert into Employee values ('Tahir','ERP Developer')

select *from Employee

create procedure insertemployee
(
	@Employee_Name varchar(20),
	@Employee_Designation varchar(20)
)
as
insert into employee (Employee_Name , Employee_Designation)
values (@Employee_Name , @Employee_Designation)

exec insertemployee 'Tahir' , 'Software Engineer'

select *from employee

alter procedure updaterecord
(
	@Employee_Name varchar(20),
	@Employee_Designation varchar(20),
	@id int
)
as
update Employee set Employee_Name=@Employee_Name , Employee_Designation=@Employee_Designation where Employee_ID=@id

exec updaterecord 'Aqsa Tahir' , 'Software Engineer' , 2

select *from Employee


create procedure deleterecord
(
@id int
)
as
delete from Employee where Employee_ID=@id


exec deleterecord 1

select *from Employee

create table employeesalaryevaluationtable
(
  empid int  primary key  not null,
  employeehourlywage int
)

alter table employeesalaryevaluationtable  add FirstName varchar(20)

select *from employeesalaryevaluationtable

update employeesalaryevaluationtable set FirstName='Tahir' where empid =1

update employeesalaryevaluationtable set FirstName='Aqsa' where empid =2


insert into employeesalaryevaluationtable 
values (1,6000) , (2,12000)

select *from employeesalaryevaluationtable

exec raiseemployeesalary 2 , 1000

alter procedure raiseemployeesalary
(
	@empid int,
	@raise int
)
as
begin
	update employeesalaryevaluationtable set employeehourlywage=employeehourlywage + @raise
	where empid=@empid

	if @@rowcount = 1 
	select 'Employee money is raised' + (select FirstName + ' ' + employeehourlywage from employeesalaryevaluationtable
	where empid=@empid
	)
	else
	print 'Invalid Employee' +cast(@empid as varchar(12))

end





