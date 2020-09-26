set @maxsat = 1100;


select *
	from student
    where sat > @maxsat
    order by sat desc