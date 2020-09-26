select m.Description, c.Subject, c.Section
	from major m
    join majorclassrel mc
    on m.id = mc.MajorId
    join class c 
    on c.id = mc.ClassId
    where m.Description = "General Business"