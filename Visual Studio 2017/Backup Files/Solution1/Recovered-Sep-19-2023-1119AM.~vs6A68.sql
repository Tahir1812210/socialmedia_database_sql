select R.ID, R.EngName, R.moule_id, M.EngName  from sys_Regions R join sys_moules M on R.moule_id = M.id

select *from sys_moules

update sys_moules set EngName='mouleB_eng' , ArbName='mouleB_arb' where id = 2


select *from sys_Regions

create table sys_project
(
	ID int identity(1,1) primary key not null,
	Code varchar(50),
	Customer_ID int,
	Country_ID int,
	City_ID int,
	BusinessActivity_ID int,
	Owner_ID int,
	Status_ID int,
	StartDate smalldatetime,
	EndDate smalldatetime,
	ExpectedProjectDurationDays int,
	Types_ID int,
	Priority_ID int,
	Moules_ID int,
	ContractNO int,
	ContractValueWithoutVAT int,
	VATPercent int,
	VATValue int,
	TotalContractValue int,
	SalesPerson_ID int,
	TeamViewerDetails varchar(max),
	AnyDeskDetails varchar(max),
	SQLDetails varchar(max),
	ServerConnectionDetails varchar(max),
	ERPApplicationURL varchar(max),
	HRApplicationURL varchar(max),
	HMSApplicationURL varchar(max),
	OtherField varchar(20),
	Notes varchar(50)
)


select *from fcs_Customers


--#1
alter table sys_project ADD CONSTRAINT FK_sys_project_fcs_Customers FOREIGN KEY (Customer_ID) REFERENCES fcs_Customers(ID)
ON DELETE CASCADE ON UPDATE CASCADE

--#2
alter table sys_project ADD CONSTRAINT FK_sys_project_sys_Countries FOREIGN KEY (Country_ID) REFERENCES sys_Countries(ID)
ON DELETE CASCADE ON UPDATE CASCADE

select *from sys_Countries

select *from sys_Cities

--#3
alter table sys_project ADD CONSTRAINT FK_sys_project_sys_Cities FOREIGN KEY (City_ID) REFERENCES sys_Cities(ID)
ON DELETE CASCADE ON UPDATE CASCADE

select *from sys_owners

--#4
alter table sys_project ADD CONSTRAINT FK_sys_project_sys_owners FOREIGN KEY (Owner_ID) REFERENCES sys_status(ID)
ON DELETE CASCADE ON UPDATE CASCADE



update sys_owners set ArbName='????' where ID=1

update sys_owners set ArbName='?????' where ID=2

select *from sys_status

update sys_status set ArbName='???????? ' where id = 1
update sys_status set ArbName='??? ???????? ' where id = 2
update sys_status set ArbName='???????' where id = 3

--#5

alter table sys_project ADD CONSTRAINT FK_sys_project_sys_status FOREIGN KEY (Status_ID) REFERENCES sys_status(ID)
ON DELETE CASCADE ON UPDATE CASCADE

--#6
select *from sys_types

alter table sys_project ADD CONSTRAINT FK_sys_project_sys_types FOREIGN KEY (Moules_ID) REFERENCES sys_types(ID)
ON DELETE CASCADE ON UPDATE CASCADE


create table sys_projectpriority
(
	ID int identity(1,1) primary key not null,
	EngName varchar(50),
	ArbName varchar(50),
)



insert into sys_projectpriority (EngName , ArbName) values ('Functionality Priority','?????? ???????') , ('Timeline Priority','????? ?????? ??????') , ('Cost Priority','?????? ???????')


--#6

select *from sys_projectpriority

alter table sys_project ADD CONSTRAINT FK_sys_project_sys_projectpriority FOREIGN KEY (Priority_ID) REFERENCES sys_projectpriority(ID)
ON DELETE CASCADE ON UPDATE CASCADE

--#7
select *from sys_moules

insert into sys_moules (EngName , ArbName) values ('E','A')

UPDATE sys_moules
SET EngName = 
    CASE 
        WHEN ID = 1 THEN 'Financial'
        WHEN ID = 2 THEN 'SupplyChain'
        WHEN ID = 3 THEN 'HumanResources'
        ELSE EngName  -- Keep existing values for other rows
    END,
	ArbName = 
    CASE 
        WHEN ID = 1 THEN '???????'
        WHEN ID = 2 THEN '????? ???????'
        WHEN ID = 3 THEN '??????? ???????'
        ELSE ArbName  -- Keep existing values for other rows
    END
WHERE ID IN (1, 2, 3);

select *from sys_moules

alter table sys_project ADD CONSTRAINT FK_sys_project_sys_moules FOREIGN KEY (Moules_ID) REFERENCES sys_moules(ID)
ON DELETE CASCADE ON UPDATE CASCADE

select *from sys_salesperson

UPDATE sys_salesperson
SET EngName =
CASE
When ID=1 then 'Nahdi'
When ID=2 then 'Raya'
else EngName
End,
ArbName =
CASE 
When ID=1 then '????'
When ID=2 then '???'
else ArbName
End

select *from sys_salesperson

alter table sys_project ADD CONSTRAINT FK_sys_project_sys_salesperson FOREIGN KEY (SalesPerson_ID) REFERENCES sys_salesperson(ID)
ON DELETE CASCADE ON UPDATE CASCADE


select *from sys_MenusNew