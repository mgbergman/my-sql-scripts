USE Sys;

Drop DATABASE IF EXISTS BcDb;

Create DATABASE BcDb;

USE BcDb; 

create table Customers (
	Id int not null auto_increment, primary key (Id),
	Code varchar(10) not null unique,
	Name varchar(30) not null,
	Sales decimal(9,2) not null default 0 check (Sales >= 0) ,
	Active bit not null default 1,
    Created Datetime default (current_timestamp())
);



Insert customers (ID,Code,Name,Sales) values (0, 'A', 'amazon echo', 800000);
Insert customers (ID,Code,Name,Sales) values (0, 'B', 'Rolex Watch', 1800000);

Select * from customers;

create table Orders (
	Id int not null auto_increment, primary key (Id),
    Description varchar(30) not null,
    Total decimal (9,2) not null default 0,
	CustomerId int not null,
    foreign key (CustomerId) references Customers(Id)

);

Insert Orders (Description, Total, CustomerID) values ("123", 90000, 1);
Insert Orders (Description, Total, CustomerID) values ("567", 90000, 2);

Select * from orders;