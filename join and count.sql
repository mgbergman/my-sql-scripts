select m.Description as "major" , count(*)
	from major m
		join majorclassrel mc
        on mc.MajorId = m.id
    join class c
		on c.Id = mc.ClassId
   group by (m.Description)
	having count(*) > 10