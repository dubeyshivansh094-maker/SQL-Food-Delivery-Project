USE FoodieFiesta;

INSERT INTO Customers (FirstName, LastName, Email, PhoneNumber, JoinDate) VALUES
('Priya', 'Sharma', 'priya.sharma@example.com', '9876543210', '2024-01-15'),
('Amit', 'Patel', 'amit.patel@example.com', '8765432109', '2024-02-20'),
('Sneha', 'Reddy', 'sneha.reddy@example.com', '7654321098', '2024-03-10'),
('Rahul', 'Kumar', 'rahul.kumar@example.com', '6543210987', '2024-04-05');

INSERT INTO Restaurants (Name, CuisineType, Address, City, Rating) VALUES
('Pizza Palace', 'Italian', '123 MG Road', 'Kolkata', 4.50),
('Sushi Central', 'Japanese', '456 Park Street', 'Kolkata', 4.80),
('Curry House', 'Indian', '789 Ballygunge Circular Road', 'Kolkata', 4.70),
('Burger Barn', 'American', '101 Camac Street', 'Kolkata', 4.20);

INSERT INTO MenuItems (RestaurantID, Name, Description, Price) VALUES
(1, 'Margherita Pizza', 'Classic cheese and tomato pizza', 350.00),
(1, 'Pepperoni Pizza', 'Pizza with spicy pepperoni', 450.00),
(1, 'Garlic Bread', 'Toasted bread with garlic butter', 150.00);

INSERT INTO MenuItems (RestaurantID, Name, Description, Price) VALUES
(2, 'California Roll', 'Crab, avocado, and cucumber', 550.00),
(2, 'Tuna Nigiri', 'Fresh tuna on rice', 650.00);

INSERT INTO MenuItems (RestaurantID, Name, Description, Price) VALUES
(3, 'Butter Chicken', 'Creamy chicken curry', 480.00),
(3, 'Naan Bread', 'Soft Indian flatbread', 60.00),
(3, 'Paneer Tikka', 'Spiced and grilled cottage cheese', 380.00);

INSERT INTO MenuItems (RestaurantID, Name, Description, Price) VALUES
(4, 'Classic Cheeseburger', 'Beef patty with cheese', 320.00),
(4, 'Fries', 'Salted potato fries', 120.00);

INSERT INTO Drivers (FirstName, LastName, VehicleType) VALUES
('Ramesh', 'Yadav', 'Motorbike'),
('Sita', 'Gupta', 'Scooter'),
('Vikram', 'Singh', 'Motorbike');

INSERT INTO Orders (CustomerID, RestaurantID, DriverID, OrderDate, DeliveryAddress, Status, FinalAmount, OrderRating) VALUES
(1, 1, 1, '2025-08-10 19:30:00', 'Flat 1A, Alipore', 'Delivered', 500.00, 5);
INSERT INTO OrderDetails (OrderID, MenuItemID, Quantity, PricePerUnit) VALUES
(1, 2, 1, 450.00); -- 1 Pepperoni Pizza

INSERT INTO Orders (CustomerID, RestaurantID, DriverID, OrderDate, DeliveryAddress, Status, FinalAmount, OrderRating) VALUES
(2, 3, 2, '2025-08-11 20:00:00', 'B-Block, Salt Lake', 'Delivered', 540.00, 4);
INSERT INTO OrderDetails (OrderID, MenuItemID, Quantity, PricePerUnit) VALUES
(2, 6, 1, 480.00), -- 1 Butter Chicken
(2, 7, 1, 60.00);   -- 1 Naan Bread

INSERT INTO Orders (CustomerID, RestaurantID, DriverID, OrderDate, DeliveryAddress, Status, FinalAmount, OrderRating) VALUES
(1, 2, 3, '2025-08-12 18:45:00', 'Flat 1A, Alipore', 'Delivered', 550.00, 5);
INSERT INTO OrderDetails (OrderID, MenuItemID, Quantity, PricePerUnit) VALUES
(3, 4, 1, 550.00); -- 1 California Roll

INSERT INTO Orders (CustomerID, RestaurantID, DriverID, OrderDate, DeliveryAddress, Status) VALUES
(4, 4, 1, '2025-09-03 21:00:00', 'New Town, Action Area 1', 'In Progress');
INSERT INTO OrderDetails (OrderID, MenuItemID, Quantity, PricePerUnit) VALUES
(4, 9, 2, 320.00), -- 2 Classic Cheeseburgers
(4, 10, 2, 120.00); -- 2 Fries

UPDATE Orders SET FinalAmount = (2 * 320.00 + 2 * 120.00) WHERE OrderID = 4;
