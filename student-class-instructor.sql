select * 
	from student s
    join studentclassrel sc
		on s.id = sc.StudentId
	join class c 
		on c.id = sc.ClassId