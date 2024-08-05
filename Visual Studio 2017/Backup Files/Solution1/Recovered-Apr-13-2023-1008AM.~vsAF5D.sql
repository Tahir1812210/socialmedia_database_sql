declare @incr int
set @incr = 1


while(@incr <= @Tenureinyear*12)
	begin
		print cast(@inc as varchar) + space(10) + dateadd(mm , 1, @LoanDate) + space(10) + cast(@EMIAMOUNT as varchar)
		set @incr = @incr + 1
	end