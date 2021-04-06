# Challenge 1 - Design the Database

# Information about database
# database = Seeding
# tables Car, Salespersons, Customer, Invoices
# columns in tables
# car: VIN, Manufacturer, Model, Year, Color 
# salesperson: Staff_ID, Name, Store
# customer: Customer_ID, Name, Phone_Number, Email, City, State/Province, Country, Postal
# invoices: Invoice_Number, Date, Car, Customer, Sales_Person

# Data types for the Database
#table Car
# VIN: int UNIQUE NOT NULL
# Manufacturer: varchar(100) NOT NULL
# Model: varchar(100) NOT NULL
# Year: date
# Color: varchar(50) NOT NULL

#table Salespersons
# Staff_ID: int NOT NULL auto_increment
# Name: varchar(100) NOT NULL
# Store: varchar(255) NOT NULL

#table Customer
# Customer_ID: int NOT NULL auto_increment
# Name: varchar(100) NOT NULL
# Phone_Number: varchar(20)
# Email: text
# City: varchar(100) NOT NULL 
# State/Province: varchar(150) NOT NULL 
# Country: varchar(100) NOT NULL
# Postal: int NOT NULL

#table Invoice
# Invoice_Number: int
# Date: date
# Car: Varchar(50)
# Customer: varchar(50)
# Sales_Person: varchar(50)


# Challenge 2 - Seeding the Database

create database if not exists seeding;
create table seeding.Car(
VIN varchar(100) NOT NULL,
Manufacturer varchar(100) NOT NULL,
Model varchar(100) NOT NULL,
Year date,
Color varchar(50) NOT NULL
);

create table seeding.Salespersons(
Staff_ID int NOT NULL,
Name varchar(100) NOT NULL,
Model varchar(100) NOT NULL,
Store varchar(255) NOT NULL
);

create table seeding.Customer(
Customer_ID int NOT NULL,
Name varchar(100) NOT NULL,
Phone_Number varchar(20),
Email text,
City varchar(100) NOT NULL ,
State_Province varchar(150) NOT NULL ,
Country varchar(100) NOT NULL,
Postal int NOT NULL
);

create table seeding.Invoice(
Invoice_Number int,
Date date,
Car Varchar(50),
Customer varchar(50),
Sales_Person varchar(50)
);

# Change Datatype
ALTER TABLE seeding.Car
Change Year Year year;

# Challenge 3 - Seeding the Database

insert IGNORE into seeding.Car values
("3K096I98581DHSNUP","Volkswagen","Tiguan",2019,"Blue"),("ZM8G7BEUQZ97IH46V","Peugeot","Rifter",2019,"Red"),
("RKXVNNIHLVVZOUB4M","Ford","Fusion",2018,"White"),("HKNDGS7CU31E9Z7JW","Toyota","RAV4",2018,"Silver"),
("DAM41UDN3CHU2WVF6","Volvo","V60",2019,"Gray"),("DAM41UDN3CHU2WVF6","Volvo","V60 CrossCountry",2019,"Gray");
# open challange: The 6th entry is a duplicate -> at the moment, the values ar e not in the table, IGNORE doesn't help

#UPDATE seeding.car
#SET VIN = "DAM41UDN3CHU2WVF6", Manufacturer = "Volvo", Model = "V60", Year = 2019, Color = "Gray"
#WHERE ?

SELECT * From seeding.Car;

insert into seeding.Salespersons values
(0,00001,"Petey Cruiser","Madrid"),(1,00002,"Anna Sthesia","Barcelona"),
(2,00003,"Paul Molive","Berlin"),(3,00004,"Gail Forcewind","Paris"),
(4,00005,"Paige Turner","Mimia"),(5,00006,"Bob Frapples","Mexico City"), 
(6,00007,"Walter Melon","Amsterdam"),(7,00008,"Shonda Leer","São Paulo");

#Additional tasks
SELECT * FROM seeding.customer;
ALTER TABLE seeding.customer ADD ID int;
ALTER TABLE seeding.customer ADD Address varchar(100);

insert into seeding.customer values
(10001,"Pablo Picasso","+34 636 17 63 82","-","Madrid","Madrid","Spain",28045,0,"Paseo de la Chopera,14"),
(20001,"Abraham Lincoln","+1 305 907 7086", "-","Miami","Florida","United States",33130,1,"120 SW 8th St"),
(30001,"Napoléon Bonaparte","+33 1 79 75 40 00","-","Paris","Île-de-France","France",75008,2,"40 Rue du Colisée");

SELECT * FROM seeding.invoice;

insert into seeding.invoice values
(852399038,"2018-08-22",0,1,3),
(731166526,"2018-12-31",3,0,5),
(271135104,"2019-01-22",2,2,7);

#Problems
# Missing Column id, without column id Where for updat function does not work





