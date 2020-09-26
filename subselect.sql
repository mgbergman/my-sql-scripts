select *
	from student
    where SAT < (select avg(SAT) from student)