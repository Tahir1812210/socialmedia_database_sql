
sp_getcountry

select *from item

create procedure sp_getitem
as
select *from item

create procedure sp_getitembyid
@Id int
as
select *from item where id = @Id

sp_getitembyid @Id = 1

select *from headdetail

select *from customer

alter procedure sp_getheaddetails
as
select headdetail.Id , headdetail.InvoiceNumber , headdetail.InvoiceDate , Customer.CustomerEnglishName ,
Customer.CustomerArabicName , Customer.CustomerCode , headdetail.Remarks ,headdetail.TotalSalesInvoiceAmount , 
headdetail.TotalVatAmount , headdetail.TotalSalesInvoicePlusVatAmount , headdetail.CustomerId
from headdetail inner join Customer on headdetail.CustomerId = Customer.Id;

alter procedure sp_getheaddetailsbyid
@Id int
as
select headdetail.Id , headdetail.InvoiceNumber , headdetail.InvoiceDate , Customer.CustomerEnglishName ,
Customer.CustomerArabicName , Customer.CustomerCode , headdetail.Remarks , headdetail.TotalSalesInvoiceAmount , 
headdetail.TotalVatAmount , headdetail.TotalSalesInvoicePlusVatAmount , headdetail.CustomerId
from headdetail inner join Customer on headdetail.CustomerId = Customer.Id
where headdetail.id = @Id;

sp_getheaddetailsbyid @Id = 1

select *from item

select *from detail

create procedure sp_getdetails
as
select detail.id , item.ItemCode , item.ItemArabicName , item.ItemEnglishName ,  detail.price , 
detail.qty , detail.totalamount , detail.vat , detail.totalamountplusvat , detail.itemid 
from detail join item on detail.itemid = item.id


create procedure sp_getdetailsbyid
@Id int
as
select detail.id , item.ItemCode , item.ItemArabicName , item.ItemEnglishName ,  detail.price , 
detail.qty , detail.totalamount , detail.vat , detail.totalamountplusvat , detail.itemid 
from detail join item on detail.itemid = item.id where detail.id = @id

sp_getdetailsbyid @Id = 1

sp_getcity
