select *
from orders o
join orderlines l 
	on o.id = l.OrdersId
join customers c
	on o.CustomerId = c.Id