create database complex

create proc LoanStatement
(
	@LoanAmount money = 1000000,
	@ROI tinyint=14,
	@Tenureinyear tinyint=2
)
as
begin

	--Declare a variable for loan date
declare @LoanDate datetime
set @LoanDate = GETDATE()

	--Calculate Interest
	--Formula = PNR/100
	declare @Interest money
	set @Interest = (@LoanAmount * @Tenureinyear * @ROI)/100

	--Calculate TotalAmount
	declare @TotalAmount money
	set @TotalAmount = @LoanAmount + @Interest

	--Calculate EMI Amount
	declare @EmiAmount money
	set @EmiAmount = @TotalAmount/(@Tenureinyear*12)

	--Display the EMI Table
	print '-------------------------------------------------------------------'
	print 'SL NO' + space(10) + 'EMI Date Date' + space(10) + 'EMI Amount in USD'
	print '-------------------------------------------------------------------'


	--Loop (while loop)
	declare @incr int
set @incr = 1


while(@incr <= @Tenureinyear*12)
	begin
		print cast(@incr as varchar) + space(10) + cast(dateadd(mm , 1, @LoanDate) as varchar) + space(10) + cast(@EMIAMOUNT as varchar)
		set @incr = @incr + 1
	end



	print '-------------------------------------------------------------------'
	print ' Grand Total: ' + CAST(@TotalAmount as varchar)
	print '-------------------------------------------------------------------'


end
go

exec LoanStatement