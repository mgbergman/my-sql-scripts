/*
select r.description, r.DeliveryMode, r.Status, r.total,
		l.quantity, (p.price * l.quantity) as "subtotal",
        p.name, p.price, 
        concat(u.firstname, ' ', u.lastname) as 'name', u.PhoneNumber, u.Email
*/        
	Select r.Description, sum(l.quantity * p.price) as 'total'
    from request r
    join lineitem l on l.RequestID = r.id
    join product p on p.id = l.ProductID
    join vendor v on v.id = p.VendorID
    join users u on r.userid = u.id
    group by r.Description