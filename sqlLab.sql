create table Towns(
	Id INT PRIMARY KEY IDENTITY,
	[Name] NVARCHAR(50) NOT NULL,
)

create table Minions (
	Id INT PRIMARY KEY IDENTITY,
	[Name] NVARCHAR(50) NOT NULL,
	Age INT NOT NULL,
	TownId	INT FOREIGN KEY REFERENCES Towns(Id) NOT NULL
)

insert into Minions(Id, Name, Age, TownId) values
(1,	'Kevin', 22, 1),
(2,	'Bob', 15, 3),
(3,	'Steward', NULL, 2)

insert into Towns(Id, Name) values
(1, 'Sofia'),
(2,	'Peter'),
(3,	'Victoria')

truncate table Minions;

drop table Minions;
drop table Towns;


create table People (
Id int Primary key identity identity(1, 1),
[Name] nvarchar(200) not null,
Picture varbinary(max),
Height decimal(10,2),
[Weight] decimal(10,2),
Gender nvarchar(2) check (Gender IN ('m', 'f')) not null,
Birthday date not null,
Biography nvarchar(max)
)

create table Users (
Id long Primary key identity(1, 1),
UserName varchar(30) not null,
[Password] varchar(26) not null,
ProfilePicture varbinary(max),
IsDeleted nvarchar(5) check (IsDeleted IN ('true', 'false')) not null,
)


alter table Users drop constraint PK__Users__3214EC075EE3E59A;

alter table Users add primary key(Id, UserName);

ALTER TABLE Users ADD CHECK (datalength([Password])>=5);

ALTER TABLE Users  ADD LastLoginTime  TIMESTAMP;

alter table Users drop constraint PK__Users__5E8BC442ED08F210;

alter table Users add primary key(Id);

ALTER TABLE Users ADD CHECK (datalength([UserName])>=3);


create database Movies

create table Directors (Id int, DirectorName varchar(30), Notes varchar(max))
create table Genres (Id int, GenreName varchar(20), Notes varchar(max))
create table Categories (Id int, CategoryName varchar(30), Notes varchar(max))
create table Movies (Id int, Title varchar(20), DirectorId int, CopyrightYear int, [Length] time, GenreId int , CategoryId int, Rating decimal(10,2), Notes varchar(max))

 create database CarRental 


create table Categories (Id int, CategoryName varchar(50), DailyRate decimal(6,2), WeeklyRate decimal(10,2), MonthlyRate decimal(18,2), WeekendRate decimal(10,2))
create table Cars (Id int, PlateNumber int, Manufacturer varchar(50), Model varchar(50), CarYear int, CategoryId int, Doors int, Picture varbinary(max), Condition text, Available varchar(50))
create table Employees (Id int, FirstName varchar(50), LastName varchar(50), Title varchar(50), Notes text)
create table Customers (Id int, DriverLicenceNumber int, FullName varchar(100), [Address] varchar(30), City varchar(30), ZIPCode int, Notes text)
create table RentalOrders (Id int, EmployeeId int, CustomerId int, CarId int, TankLevel decimal(5,2), KilometrageStart decimal(10,2), KilometrageEnd decimal(10,2), TotalKilometrage decimal(10,2), StartDate date, EndDate date, TotalDays int, RateApplied money, TaxRate decimal(5,2), OrderStatus varchar(30), Notes text)


create database Hotel


create table Employees (Id int, FirstName varchar(50), LastName varchar(50), Title varchar(50), Notes text)
create table Customers (AccountNumber int, FirstName varchar(50), LastName varchar(50), PhoneNumber int, EmergencyName varchar(50), EmergencyNumber int, Notes text)
create table RoomStatus (RoomStatus varchar(50), Notes text)
create table RoomTypes (RoomType varchar(50), Notes text)
create table BedTypes (BedType varchar(50), Notes text)
create table Rooms (RoomNumber int, RoomType varchar(50), BedType varchar(50), Rate money, RoomStatus varchar(50), Notes text)
create table Payments (Id int, EmployeeId int, PaymentDate date, AccountNumber int, FirstDateOccupied date, LastDateOccupied date, TotalDays int, AmountCharged money, TaxRate decimal(5,2), TaxAmount money, PaymentTotal money , Notes text)
create table Occupancies (Id int, EmployeeId int, DateOccupied date, AccountNumber int, RoomNumber int, RateApplied money, PhoneCharge money, Notes text)


create database Lexicon

create table Towns (
Id int primary key identity(1,1), 
[Name] varchar(30)
)
create table Addresses (
Id int primary key identity(1,1),
AddressText varchar(50), 
TownId int foreign key references Towns(Id)
)
create table Departments (
Id int primary key identity(1,1),
[Name] varchar(30)
)
create table Employees (
Id int primary key identity(1,1) ,
FirstName varchar(50), 
MiddleName varchar(50), 
LastName varchar(50), 
JobTitle varchar(50), 
DepartmentId int foreign key references Departments(Id), 
HireDate date, 
Salary money,
AddressId int foreign key references Addresses(Id),
)

USE Lexicon;
GO
BACKUP DATABASE Lexicon
TO DISK = 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\Backup\lexicon-backup.bak'
   WITH FORMAT,
      MEDIANAME = 'SQLServerBackups',
      NAME = 'Full Backup of lexicon';


drop database Lexicon;


RESTORE DATABASE Lexicon
FROM DISK = 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\Backup\lexicon-backup.bak'


insert into Towns([Name]) values
('Sofia'),
('Plovdiv'),
('Varna'),
('Burgas')


insert into Departments([Name]) values
('Engineering'),
('Sales'),
('Marketing'),
('Software Development'),
('Quality Assurance')


insert into Employees(FirstName, MiddleName, LastName, JobTitle, DepartmentId, HireDate, Salary) values
('Mel', 'Gibson', 'Gibson', '.NET Developer', 4, '2013-01-01', 3500.00),
('Chuck', 'Norris', 'Norris', 'Senior Engineer', 1, '2004-03-02', 4000.00),
('Greta', 'Garbo', 'Garbo', 'Intern', 5, '2016-08-28', 525.25),
('Meryl', 'Strep', 'Strep', 'CEO', 2, '2007-12-09', 3000.00),
('Peter', 'Pan', 'Pan', 'Intern', 3, '2016-08-28', 599.88)


select * from Towns;
select * from Departments;
select * from Employees;

select * from Towns
order by [Name] 

select * from Departments
order by [Name]

 select * from Employees
order by Salary desc


select Name from Towns;
select Name from Departments;
select FirstName, LastName, JobTitle, Salary from Employees;

UPDATE Employees
set Salary = Salary * 1.1;







