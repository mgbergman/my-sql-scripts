USE Sys;

Drop DATABASE IF EXISTS PRS;

Create DATABASE PRS;

USE PRS; 

create table USER (
	Id int not null auto_increment, primary key (Id),
    UserName varchar(20) not null Unique,
    Password varchar(10) not null,
    FirstName varchar(20) not null,
    LastName varchar(20) not null,
    PhoneNumber varchar(12) not null,
    Email varchar (75) not null,
    IsReviewer bit not null default 0,
    IsAdmin bit not null default 0
	
);



Insert User (Username, Password, FirstName, LastName, PhoneNumber, Email) value ("mgbergman", "bryan1123",  "Marc", "Bergman", "5133287865", "mgbergman@gmail.com");
Insert User (Username, Password, FirstName, LastName, PhoneNumber, Email) value ("katmbergman", "Zoe0508",  "Kat", "Bergman", "5133287865", "katmbergman@gmail.com");
Insert User (Username, Password, FirstName, LastName, PhoneNumber, Email) value ("mg.bergman", "bryan1123",  "Marc", "Bergman", "5133287865", "mgbergman@gmail.com");
Insert User (Username, Password, FirstName, LastName, PhoneNumber, Email) value ("kat.bergman", "Zoe0508",  "Kat", "Bergman", "5133287865", "katmbergman@gmail.com");

Select * from User;

create table Vendor (
	Id int not null auto_increment, primary key (Id),
    Code varchar(10) not null Unique,
    Name varchar(255) not null,
    Address varchar(255) not null,
    City varchar(255) not null,
    State varchar(2) not null,
    Zip varchar (5) not null,
    PhoneNumber varchar (12) not null,
    Email varchar (100) not null
  
);

Insert Vendor (Code, Name, Address, City, State, Zip, PhoneNumber, Email) value ('A', "Amazon", "101 Main Street",  "Dayton", "OH", "45140", "5133287865", "mgbergman@gmail.com");
Insert Vendor (Code, Name, Address, City, State, Zip, PhoneNumber, Email) value ('B', "WalMart", "820 Carrington Place",  "Loveland", "OH", "45140", "5133287865", "katmbergman@gmail.com");

Select * from Vendor;

create table Product (
	Id int not null auto_increment, primary key (Id),
    VendorID int,
    foreign key (VendorID) references Vendor (Id),
    Constraint vendor_part unique(VendorID,PartNumber),
    PartNumber varchar(50) not null,
    Name varchar(150) not null,
    Price decimal(10,2) not null,
    Unit varchar(255) null,
    PhotoPath varchar (255) null
   
  
);

Insert Product (VendorID, PartNumber, Name, Price, Unit) value (2, "1", "Echo",  "49.99", "15");
Insert Product (VendorID, PartNumber, Name, Price, Unit) value (1, "34", "Alexa",  "99.99", "5");
Insert Product (VendorID, PartNumber, Name, Price, Unit) value (1, "186", "Mouse",  "69.99", "35");

Select * from Product;

create table Request (
	Id int not null auto_increment, primary key (Id),
    UserID int,
    foreign key (UserID) references User (Id),
    Description varchar(100) not null,
    Justification varchar(255) not null,
    DateNeeded date not null,
    DeliveryMode varchar(255) not null,
    Status varchar (20) not null Default ("New"),
    Total decimal (10,2),
    SubmittedDate Datetime,
    ReasonForRejection varchar (100) null
   
  
);

Insert Request (UserID, Description, Justification, DateNeeded, DeliveryMode, Total, SubmittedDate) 
	values (1, "12345", "Part 1",  '2020-12-31', "UPS", 10.00, '2020-12-23'),
		   (2, "Alexa", "I need it", '2020-09-10', "FEDEX", 20.00, "2020-09-30");
    
Select * from Request;

create table LineItem (
	Id 				int 		not null auto_increment, primary key (Id),
    RequestID 		int,
    foreign key (RequestID) references Request (Id),
    ProductID		int,
	foreign key (ProductID) references Product (Id),
    Quantity 		Int,
    Constraint req_pdt Unique (RequestID, ProductId)
    
);

Insert LineItem (RequestID, ProductID, Quantity) values (1,1,1), (1,2,1);
    
Select * from LineItem;

DROP USER IF EXISTS prs_user@localhost;
CREATE USER prs_user@localhost IDENTIFIED BY 'sesame';
GRANT SELECT, INSERT, DELETE, UPDATE ON prs.* TO prs_user@localhost;






