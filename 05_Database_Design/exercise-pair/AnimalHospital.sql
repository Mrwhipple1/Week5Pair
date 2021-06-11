USE master;
GO

DROP DATABASE IF EXISTS AnimalHospital;
GO


CREATE DATABASE AnimalHospital;
GO

USE AnimalHospital;
GO

BEGIN TRANSACTION;

CREATE TABLE Pet (
PetId int IDENTITY(1,1) PRIMARY KEY, 
Name nvarchar(64) NOT NULL,
Type nvarchar(64) NOT NULL,
Age int NOT NULL,
Breed nvarchar(64)
);

CREATE TABLE Customer (
CustomerId int IDENTITY(1,1) PRIMARY KEY,
Name nvarchar(64) NOT NULL,
AddressId int,
PetId int NOT NULL
);

CREATE TABLE ProcedureTable (
ProcedureId int IDENTITY(1,1) PRIMARY KEY,
Name nvarchar(64) NOT NULL, 
Cost int NOT NULL,
PetId int NOT NULL, 
DateId int NOT NULL
);

CREATE TABLE Visit (
VisitId int IDENTITY(1,1) PRIMARY KEY, 
PetId int NOT NULL, 
AdmissionDateId int NOT NULL,
DischargeDateId int NOT NULL
);

CREATE TABLE Address (
AddressId int IDENTITY(1,1) PRIMARY KEY,
CustomerId int NOT NULL,
StreetAdress nvarchar(64),
City nvarchar(64),
State nvarchar(64),
Zipcode int
);

CREATE TABLE Billing(
BillingId int IDENTITY(1,1) PRIMARY KEY,
CustomerId int NOT NULL,
ProcedureID int NOT NULL
);

CREATE TABLE Date(
DateId int IDENTITY(1,1) PRIMARY KEY,
Date datetime NOT NULL
);

COMMIT TRANSACTION;