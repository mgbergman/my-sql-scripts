set @lowsat = 1000;
set @highsat = 1200;

select *
	from student
    where sat > @lowsat and sat < @highsat