create database WorkTask

use WorkTask
go



create table countries
(
	countrycode int identity primary key not null,
	countryenglishname varchar(20) not null,
	countryarabicname varchar(20) not null
)

create table cities 
(
	citycode int identity primary key not null,
	countrycode int not null,
	cityenglishname varchar(20) not null,
	cityarabicname varchar(20) not null
)


create table customers 
(
	customercode int identity primary key not null,
	englishname varchar(20) not null,
	arabicname varchar(20) not null,
	mobileno int not null,
	email varchar(20),
	country int not null,
	city int not null,
	addressline1 varchar(20),
	addressline2 varchar(20),
	addressline3 varchar(20)
)

create table items 
(
	itemcode int identity primary key not null,
	itemenglishname varchar(20) not null,
	itemarabicname varchar(20) not null,
	price int not null,
	vat int not null
)

create table headdetails
(
	invoicenumber int identity primary key not null,
	invoicedate datetime2(7) not null,
	customercode int not null,
	customername int not null,
	remarks varchar(20),
	totalsalesinvoiceamount int not null,
	totalvatamount int not null,
	totalsalesamountplusvatamount int not null
)

select *from countries

create table details 
(
	itemcode int identity primary key not null,
	itemname int,
	price int not null,
	qty int not null,
	totalamount int not null,
	vat int not null,
	totalamountplusvat int not null
)

alter table cities add constraint fk_cities_countries foreign key (countrycode) references countries(countrycode)

alter table customers add constraint fk_customer_countries foreign key (country) references countries(countrycode)

alter table customers add constraint fk_customer_cities foreign key (city) references cities(citycode)

alter table headdetails add constraint fk_headdetails_customers_code foreign key (customercode) references customers(customercode)

alter table headdetails add constraint fk_headdetails_customers_name foreign key (customername) references customers(customercode)

alter table details add constraint fk_details_items_itemcode foreign key (itemcode) references items(itemcode)
alter table details add constraint fk_details_items_itemname foreign key (itemname) references items(itemcode)



select *from items
select *from countries
select *from customers

delete from cities where citycode=3

select customercode , englishname , arabicname , mobileno , email , countryenglishname , cityenglishname
from customers c 
join countries d on d.countrycode = c.country
join cities e on e.citycode = c.city
order by customercode

select *from customers
select *from headdetails

select invoicenumber , invoicedate , d.customercode ,englishname , remarks , totalsalesinvoiceamount ,
 totalvatamount , totalsalesamountplusvatamount 
from headdetails c 
join customers d on c.invoicenumber = d.customercode

select *from details