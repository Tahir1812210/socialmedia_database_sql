create database Employee

create Table Employees
(
  id int identity not null primary key,
  [Name] varchar(20) not null,
  Gender varchar(20) not null,
  Region varchar(20) not null,
  Department varchar(20),
  Salary int not null
)