CREATE DATABASE WebAutoparkDb

USE WebAutoparkDb

CREATE TABLE [Components]
(
	[ComponentId] INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	[Name] NVARCHAR(50) NOT NULL
)

CREATE TABLE [VehicleTypes]
(
	[VehicleTypeId] INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	[Name] NVARCHAR(50) NOT NULL
)

CREATE TABLE [Vehicles]
(
	[VehicleId] INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	[VehicleTypeId] INT NOT NULL FOREIGN KEY REFERENCES VehicleTypes(VehicleTypeId),
	[Model] NVARCHAR(50) NOT NULL,
	[RegistrationNumber] NVARCHAR(10) NOT NULL,
	[Weight] FLOAT NOT NULL,
	[Year] INT NOT NULL,
	[Mileage] FLOAT NOT NULL,
	[Color] INT NOT NULL
)

CREATE TABLE [Orders]
(
	[OrderId] INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	[VehicleId] INT FOREIGN KEY REFERENCES Vehicles(VehicleId)
)

CREATE TABLE [OrderItems]
(
	[OrderItemId] INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	[OrderId] INT NOT NULL FOREIGN KEY REFERENCES Orders(OrderId),
	[ComponentId] INT NOT NULL FOREIGN KEY REFERENCES Components(ComponentId),
	[Quantity] INT NOT NULL
)