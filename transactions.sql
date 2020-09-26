-- select * from users;

Start Transaction;

Insert Users (username, password, firstname, lastname, phonenumber, email)
	values ('xx', 'xx', 'xx', 'xx', 'xx', 'xx');

select * from users;
ROLLBACK;

select * from users;
