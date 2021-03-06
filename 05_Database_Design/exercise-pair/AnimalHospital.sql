USE master;
GO

DROP DATABASE IF EXISTS AnimalHospital;
GO


CREATE DATABASE AnimalHospital;
GO

USE AnimalHospital;
GO

BEGIN TRANSACTION;

CREATE TABLE Customer (
CustomerId int IDENTITY(1,1) PRIMARY KEY,
Name nvarchar(64) NOT NULL,
AddressId int,
);

CREATE TABLE Pet (
PetId int IDENTITY(1,1) PRIMARY KEY, 
Name nvarchar(64) NOT NULL,
Type nvarchar(64) NOT NULL,
Age int NOT NULL,
Breed nvarchar(64),
CustomerId int
);


CREATE TABLE ProcedureList (
ProcedureId int IDENTITY(1,1) PRIMARY KEY,
Name nvarchar(64) NOT NULL, 
Cost int NOT NULL,
);

CREATE TABLE ProcedureTable (
ProcedureId int NOT NULL,
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
Date smalldatetime NOT NULL
);

INSERT INTO Customer (Name, AddressId) VALUES ('Amanda Cuskelly', 1);
INSERT INTO Customer (Name, AddressId) VALUES ('Samantha Griffith', 2);
INSERT INTO Customer (Name, AddressId) VALUES ('Will Whipple', 1);



INSERT INTO Pet (Name, Type, Age, Breed, CustomerId) VALUES ('Vantablack', 'Cat', 4, 'Bombay', 2);
INSERT INTO Pet (Name, Type, Age, Breed, CustomerId) VALUES ('Ellie', 'Dog', 5, 'Greyhound', 1);
INSERT INTO Pet (Name, Type, Age, Breed, CustomerId) VALUES ('Oliva', 'Dog', 10, 'Jack Russel', 3);
INSERT INTO Pet (Name, Type, Age, Breed, CustomerId) VALUES ('Malik', 'Dog', 2, 'Siberian Husky', 3);



INSERT INTO ProcedureList (Name, Cost) VALUES ('Check up', 55)
INSERT INTO ProcedureList (Name, Cost) VALUES ('Repair broken leg', 2000)
INSERT INTO ProcedureList (Name, Cost) VALUES ('Vaccinate', 55)


INSERT INTO ProcedureTable (ProcedureId, PetId, DateId) VALUES ( 1, 1, 3)
INSERT INTO ProcedureTable (ProcedureId, PetId, DateId) VALUES ( 2, 2, 6);
INSERT INTO ProcedureTable (ProcedureId, PetId, DateId) VALUES ( 3, 1, 3)



INSERT INTO Visit (PetId, AdmissionDateId, DischargeDateId) VALUES (1, 1, 2);
INSERT INTO Visit (PetId, AdmissionDateId, DischargeDateId) VALUES (2, 4, 5);



INSERT INTO Address (CustomerId, StreetAdress, City, State, Zipcode) VALUES (1, '123 Any Street', 'Columbus', 'Ohio', 43215);
INSERT INTO Address (CustomerId, StreetAdress, City, State, Zipcode) VALUES (2, '321 Every Street', 'Columbus', 'Ohio', 43201);



INSERT INTO Billing (CustomerId, ProcedureId) VALUES (1, 1);
INSERT INTO Billing (CustomerId, ProcedureId) VALUES (2, 2);



INSERT INTO Date (Date) VALUES ('2016-02-12 15:03:12');
INSERT INTO Date (Date) VALUES ('2016-02-12 16:30:43');
INSERT INTO Date (Date) VALUES ('2016-02-12 15:10:55');
INSERT INTO Date (Date) VALUES ('2018-07-02 07:02:34');
INSERT INTO Date (Date) VALUES ('2018-07-03 12:23:07');
INSERT INTO Date (Date) VALUES ('2018-07-02 07:35:23');



ALTER TABLE Customer
WITH CHECK ADD CONSTRAINT FK_PetCustomer
FOREIGN KEY (PetId) REFERENCES Pet(PetId);

ALTER TABLE Customer
WITH CHECK ADD CONSTRAINT FK_CustomerAddress
FOREIGN KEY (AddressId) REFERENCES Address(AddressId);

ALTER TABLE ProcedureTable
WITH CHECK ADD CONSTRAINT FK_ProcedureId
FOREIGN KEY (ProcedureId) REFERENCES ProcedureList(ProcedureId);

ALTER TABLE ProcedureTable
WITH CHECK ADD CONSTRAINT FK_ProcedureDate
FOREIGN KEY (DateId) REFERENCES Date(DateId);

ALTER TABLE ProcedureTable
WITH CHECK ADD CONSTRAINT FK_ProcedurePet
FOREIGN KEY (PetId) REFERENCES Pet(PetId);

ALTER TABLE Visit
WITH CHECK ADD CONSTRAINT FK_VisitPet
FOREIGN KEY (PetId) REFERENCES Pet(PetId);

ALTER TABLE Visit
WITH CHECK ADD CONSTRAINT FK_VisitAdmission
FOREIGN KEY (AdmissionDateId) REFERENCES Date(DateId);

ALTER TABLE Visit
WITH CHECK ADD CONSTRAINT FK_VisitDischarge
FOREIGN KEY (DischargeDateId) REFERENCES Date(DateId);

ALTER TABLE Billing
WITH CHECK ADD CONSTRAINT FK_BillingCustomer
FOREIGN KEY (CustomerId) REFERENCES Customer(CustomerId);

ALTER TABLE Billing
WITH CHECK ADD CONSTRAINT FK_BillingCost
FOREIGN KEY (ProcedureId) REFERENCES ProcedureList(ProcedureId);

COMMIT TRANSACTION;