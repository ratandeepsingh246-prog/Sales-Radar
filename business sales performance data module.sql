use business_sales_performance_data_module;

-- Calendar Table
CREATE TABLE Calendar (
    Date DATE PRIMARY KEY
);

-- Customer Table
CREATE TABLE Customer (
    CustomerKey INT PRIMARY KEY,
    Prefix VARCHAR(10),
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    BirthDate DATE,
    MaritalStatus CHAR(1),
    Gender CHAR(1),
    EmailAddress VARCHAR(100),
    AnnualIncome DECIMAL(12,2),
    TotalChildren INT,
    EducationLevel VARCHAR(50),
    Occupation VARCHAR(50),
    HomeOwner CHAR(1)
);
CREATE TABLE customers (
    CustomerKey INT PRIMARY KEY,
    Prefix VARCHAR(10),
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    BirthDate DATE,
    MaritalStatus VARCHAR(10),
    Gender VARCHAR(10),
    EmailAddress VARCHAR(100),
    AnnualIncome DECIMAL(15,2),
    TotalChildren INT,
    EducationLevel VARCHAR(50),
    Occupation VARCHAR(50),
    HomeOwner VARCHAR(10)
);

-- Product Categories
CREATE TABLE Product_Categories (
    ProductCategoryKey INT PRIMARY KEY,
    CategoryName VARCHAR(100)
);

-- Product Subcategories
CREATE TABLE Product_Subcategories (
    ProductSubcategoryKey INT PRIMARY KEY,
    SubcategoryName VARCHAR(100),
    ProductCategoryKey INT,
    FOREIGN KEY (ProductCategoryKey) REFERENCES Product_Categories(ProductCategoryKey)
);

-- Products
CREATE TABLE Products (
    ProductKey INT PRIMARY KEY,
    ProductSubcategoryKey INT,
    ProductSKU VARCHAR(50),
    ProductName VARCHAR(100),
    ModelName VARCHAR(50),
    ProductColor VARCHAR(30),
    ProductSize VARCHAR(10),
    ProductStyle VARCHAR(30),
    ProductCost DECIMAL(12,2),
    ProductPrice DECIMAL(12,2),
    FOREIGN KEY (ProductSubcategoryKey) REFERENCES Product_Subcategories(ProductSubcategoryKey)
);

-- Territories
CREATE TABLE Territories (
    SalesTerritoryKey INT PRIMARY KEY,
    Region VARCHAR(50),
    Country VARCHAR(50),
    Continent VARCHAR(50)
);

-- Sales
CREATE TABLE Sales (
    OrderDate DATE,
    StockDate DATE,
    OrderNumber INT,
    ProductKey INT,
    CustomerKey INT,
    TerritoryKey INT,
    OrderLineItem INT,
    OrderQuantity INT,
    FOREIGN KEY (ProductKey) REFERENCES Products(ProductKey),
    FOREIGN KEY (CustomerKey) REFERENCES Customer(CustomerKey),
    FOREIGN KEY (TerritoryKey) REFERENCES Territories(SalesTerritoryKey)
);
 ALTER TABLE sales ADD INDEX (CustomerKey);

alter table sales
modify column ordernumber varchar(50);
 
 
-- Returns
CREATE TABLE Returns (
    ReturnDate DATE,
    TerritoryKey INT,
    ProductKey INT,
    ReturnQuantity INT,
    FOREIGN KEY (ProductKey) REFERENCES Products(ProductKey),
    FOREIGN KEY (TerritoryKey) REFERENCES Territories(SalesTerritoryKey)
);

-- Superstore (independent dataset)
CREATE TABLE Superstore (
    Row_ID INT PRIMARY KEY,
    Order_ID VARCHAR(50),
    Order_Date DATE,
    Ship_Date DATE,
    Ship_Mode VARCHAR(50),
    Customer_ID VARCHAR(50),
    Customer_Name VARCHAR(100),
    Segment VARCHAR(50),
    Country VARCHAR(50),
    City VARCHAR(50),
    State VARCHAR(50),
    Postal_Code VARCHAR(20),
    Region VARCHAR(50),
    Product_ID VARCHAR(50),
    Category VARCHAR(50),
    Sub_Category VARCHAR(50),
    Product_Name VARCHAR(150),
    Sales DECIMAL(12,2),
    Quantity INT,
    Discount DECIMAL(5,2),
    Profit DECIMAL(12,2)
);

describe customer;

drop table customer;