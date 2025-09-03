CREATE SCHEMA IF NOT EXISTS FoodieFiesta;
USE FoodieFiesta;

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    PhoneNumber VARCHAR(20),
    JoinDate DATE NOT NULL
);

CREATE TABLE Restaurants (
    RestaurantID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    CuisineType VARCHAR(50),
    Address VARCHAR(255),
    City VARCHAR(100),
    Rating DECIMAL(3, 2) -- Average rating, e.g., 4.50
);

CREATE TABLE MenuItems (
    MenuItemID INT PRIMARY KEY AUTO_INCREMENT,
    RestaurantID INT NOT NULL,
    Name VARCHAR(100) NOT NULL,
    Description TEXT,
    Price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (RestaurantID) REFERENCES Restaurants(RestaurantID)
);

CREATE TABLE Drivers (
    DriverID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    VehicleType VARCHAR(50)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT NOT NULL,
    RestaurantID INT NOT NULL,
    DriverID INT,
    OrderDate DATETIME NOT NULL,
    DeliveryAddress TEXT NOT NULL,
    Status ENUM('Pending', 'In Progress', 'Delivered', 'Cancelled') NOT NULL,
    FinalAmount DECIMAL(10, 2),
    OrderRating INT CHECK (OrderRating >= 1 AND OrderRating <= 5), -- Customer rating for this specific order
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (RestaurantID) REFERENCES Restaurants(RestaurantID),
    FOREIGN KEY (DriverID) REFERENCES Drivers(DriverID)
);

CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY AUTO_INCREMENT,
    OrderID INT NOT NULL,
    MenuItemID INT NOT NULL,
    Quantity INT NOT NULL,
    PricePerUnit DECIMAL(10, 2) NOT NULL, -- Price at the time of order
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (MenuItemID) REFERENCES MenuItems(MenuItemID)
);
