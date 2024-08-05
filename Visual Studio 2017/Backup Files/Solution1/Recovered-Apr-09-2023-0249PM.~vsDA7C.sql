create database practice

create table Employee
(
	ID int identity not null primary key,
	[Name] nvarchar(20),
	Age int,
	DepartmentID int
)

create table Department
(
	EmployeeID int identity not null primary key,
	DepartmentName nvarchar(20) not null
)

alter table Employee add constraint employee_departmentid_fk foreign key (DepartmentID) references Department(EmployeeID)

insert into Employee values ('Tahir',23,1) , ('Durefishan',27,2)

select *from Employee

insert into Department values ('IT') , ('Sales')

alter table Employee add constraint employee_departmentid_df default 3 for DepartmentID

alter table Employee add salary int 


select age , SUM(salary) from Employee group by age

select [Name] , Age , DepartmentName from Employee join Department ON Employee.DepartmentID = Department.EmployeeID