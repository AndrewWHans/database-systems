-- Table for the Customers
CREATE TABLE Customers (
  CustomerID INT PRIMARY KEY,
  CustomerName VARCHAR(100),
  Address VARCHAR(100),
  City VARCHAR(50),
  PostalCode VARCHAR(20),
  Country VARCHAR(50)
);

-- Table for the Employees
CREATE TABLE Employees (
  EmployeeID INT PRIMARY KEY,
  LastName VARCHAR(50),
  FirstName VARCHAR(50),
  BirthDate DATE
);

-- Table for the Categories
CREATE TABLE Categories (
  CategoryID INT PRIMARY KEY,
  CategoryName VARCHAR(50),
  Description VARCHAR(255)
);

-- Table for the Products
CREATE TABLE Products (
  ProductID INT PRIMARY KEY,
  ProductName VARCHAR(100),
  CategoryID INT,
  Unit VARCHAR(50),
  Price DECIMAL(10,2)
);

-- Table for the Orders
CREATE TABLE Orders (
  OrderID INT PRIMARY KEY,
  CustomerID INT,
  EmployeeID INT,
  OrderDate DATE
);

-- Table for the OrderDetails
CREATE TABLE OrderDetails (
  OrderID INT,
  ProductID INT,
  Quantity INT
);