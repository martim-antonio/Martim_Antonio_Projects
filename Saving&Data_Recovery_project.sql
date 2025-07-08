DROP DATABASE IF EXISTS OnlineBookstore;
CREATE DATABASE OnlineBookstore;
USE OnlineBookstore;

CREATE TABLE Customers (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    PhoneNumber VARCHAR(15),
    Address TEXT,
    JoinDate DATE NOT NULL
);

CREATE TABLE Categories (
    CategoryID INT AUTO_INCREMENT PRIMARY KEY,
    CategoryName VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE Books (
    BookID INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(200) NOT NULL,
    Author VARCHAR(100),
    CategoryID INT NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    ISBN VARCHAR(13) UNIQUE,
    PublicationYear YEAR,
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

CREATE TABLE Orders (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT NOT NULL,
    OrderDate DATE NOT NULL,
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE OrderDetails (
    OrderDetailID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT NOT NULL,
    BookID INT NOT NULL,
    Quantity INT NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);

CREATE TABLE ShopRatings (
    ShopRatingID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT NOT NULL,
    Rating INT CHECK (Rating BETWEEN 1 AND 5),
    Review TEXT,
    RatingDate DATE NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE BookRatings (
    BookRatingID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT NOT NULL,
    BookID INT NOT NULL,
    Rating INT CHECK (Rating BETWEEN 1 AND 5),
    Review TEXT,
    RatingDate DATE NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);

CREATE TABLE Stock (
    BookID INT NOT NULL,
    Quantity INT NOT NULL,
    LastUpdated TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);

CREATE TABLE Log (
    LogID INT AUTO_INCREMENT PRIMARY KEY,
    Action VARCHAR(255) NOT NULL,
    ActionTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO Customers (Name, Email, PhoneNumber, Address, JoinDate)
VALUES
    ('John Doe', 'johndoe@gmail.com', '1234567890', '123 Main St, Springfield', '2022-01-01'),
    ('Jane Smith', 'janesmith@gmail.com', '0987654321', '456 Elm St, Springfield', '2022-02-15'),
    ('Alice Johnson', 'alicej@gmail.com', '1112223333', '789 Maple Ave, Springfield', '2023-03-10'),
    ('Sophia Martin', 'david53@gmail.com', '5037060249', '601 Pine Rd, Springfield, CA', '2022-08-16'),
    ('Chloe Jones', 'emily64@gmail.com', '4319577740', '141 Oak Ave, Greenville, PA', '2022-03-26'),
    ('Chris Smith', 'ella11@gmail.com', '4594400776', '264 Maple Blvd, Greenville, IL', '2022-02-07'),
    ('Michael Jones', 'olivia88@gmail.com', '5067772159', '11 Cherry Rd, Lexington, IL', '2022-09-28'),
    ('Matthew Miller', 'emma80@gmail.com', '7490949378', '183 Ash Way, Clinton, NY', '2022-10-18'),
    ('Liam Lopez', 'john62@gmail.com', '9150721424', '452 Cedar Ln, Riverside, NC', '2022-08-28'),
    ('Daniel Williams', 'sophia15@gmail.com', '7219847650', '940 Main St, Riverside, TX', '2022-10-11'),
    ('Chloe Brown', 'liam48@gmail.com', '4440950238', '316 Pine Rd, Lexington, CA', '2022-09-24'),
    ('Olivia White', 'matthew14@gmail.com', '2534509023', '417 Oak Ave, Georgetown, FL', '2023-07-21'),
    ('David Thomas', 'ella71@gmail.com', '5113252731', '539 Oak Ave, Greenville, TX', '2023-06-17'),
    ('Olivia Martinez', 'nathan57@gmail.com', '9654584053', '862 Spruce St, Springfield, TX', '2023-07-05'),
    ('Daniel Williams', 'emma63@gmail.com', '3876798696', '390 Oak Ave, Clinton, CA', '2023-05-04'),
    ('Sarah White', 'chris92@gmail.com', '8943417254', '726 Cherry Rd, Franklin, CA', '2022-09-07'),
    ('Sarah Garcia', 'ella86@gmail.com', '7651907597', '570 Spruce St, Springfield, IL', '2023-04-22'),
    ('Michael Taylor', 'john76@gmail.com', '8808362260', '617 Cedar Ln, Franklin, CA', '2024-03-19'),
    ('Emma Miller', 'daniel37@gmail.com', '4320096544', '219 Pine Rd, Madison, PA', '2024-05-11'),
    ('Emma Williams', 'grace31@gmail.com', '4063286577', '464 Cedar Ln, Clinton, NY', '2024-07-01'),
    ('Grace Jackson', 'matthew67@gmail.com', '6059635900', '533 Maple Blvd, Franklin, TX', '2024-07-26'),
    ('Liam Brown', 'hannah2@gmail.com', '3975838428', '153 Maple Blvd, Springfield, NY', '2024-10-09'),
    ('Chloe Hernandez', 'emily93@gmail.com', '6611934469', '523 Cedar Ln, Georgetown, NC', '2024-12-01');
    
INSERT INTO Categories (CategoryName)
VALUES
	("Fiction"),
    ("Non-Fiction"),
    ("Science Fiction"),
    ("Fantasy"),
    ("Mystery"),
    ("Thriller"),
    ("Romance"),
    ("Historical Fiction"),
    ("Biography"),
    ("Self-Help"),
    ("Horror"),
    ("Poetry"),
    ("Children's Literature"),
    ("Crime"),
    ("Classics");
    
INSERT INTO Books (Title, Author, CategoryID, Price, ISBN, PublicationYear)
VALUES
    ('The Great Gatsby', 'F. Scott Fitzgerald', 1, 10.99, '9780743273565', 1925),
    ('1984', 'George Orwell', 3, 8.99, '9780451524935', 1949),
    ('A Brief History of Time', 'Stephen Hawking', 2, 15.99, '9780553380163', 1988),
    ('The Hobbit', 'J.R.R. Tolkien', 4, 12.49, '9780547928227', 1937),
    ("The Silent Ocean", "Emily Hart", 9, 21.49, "9786918081655", 2011),
    ("Echoes of Eternity", "Jonathan Reed", 4, 9.15, "9782910304202", 1991),
    ("Shadows of the Past", "Sophia Lane", 9, 34.40, "9782237153422", 2008),
    ("A Whisper of Time", "Ethan Cross", 2, 5.38, "9785277031382", 1975),
    ("The Forgotten Star", "Olivia Stone", 11, 5.56, "9781064400581", 1954),
    ("Beneath the Iron Sky", "Liam Archer", 3, 22.22, "9781281709004", 2014),
    ("Dreams of Tomorrow", "Mia Rivers", 5, 39.20, "9788587024319", 1958),
    ("The Crimson Pact", "Benjamin Frost", 10, 11.12, "9789875803704", 1993),
    ("Winds of the North", "Amelia Cole", 7, 6.87, "9789075071349", 1953),
    ("The Sapphire Horizon", "William Vale", 15, 39.78, "9787243007612", 1990),
    ("A Journey Within", "Isabella Gray", 5, 44.42, "9788489624991", 1962),
    ("The Golden Thread", "James Harper", 6, 29.86, "9782231325730", 1992),
    ("When the Night Falls", "Charlotte Moon", 13, 34.79, "9786082345707", 2014),
    ("Dancing with Fire", "Daniel Blake", 1, 39.38, "9782058687591", 1960),
    ("The Ivory Tower", "Grace Holloway", 8, 26.04, "9786657787955", 1970),
    ("Beyond the Veil", "Michael Stone", 9, 33.34, "9789938077254", 1978),
    ("Fragments of Light", "Abigail West", 12, 5.41, "9784141592816", 1989),
    ("The Midnight Song", "Samuel Chase", 13, 33.00, "9787587249939", 2006),
    ("The Final Descent", "Luna Winters", 10, 14.46, "9781203686185", 1954),
    ("The Lost Chronicles", "Victor Knight", 14, 47.27, "9785501857024", 1983);
    
INSERT INTO Orders (CustomerID, OrderDate, TotalAmount)
VALUES
    (1, '2023-09-18', 23.98),
    (1, '2024-01-11', 10.99),
    (1, '2024-07-22', 11.99),
    (2, '2022-09-29', 55.98),
    (3, '2023-05-16', 100.98),
    (4, '2024-03-14', 78.99),
    (4, '2023-09-14', 5.99),
    (5, '2022-07-29', 1.99),
    (6, '2023-05-29', 90.99),
    (7, '2024-09-10', 45.99),
    (8, '2023-07-10', 23.99),
    (9, '2024-01-05', 9.99),
    (10, '2023-08-22', 9.99),
    (11, '2024-07-27', 99.99),
    (12, '2022-12-08', 10.98),
    (13, '2024-03-18', 66.98),
    (14, '2022-05-09', 221.98),
    (15, '2024-05-09', 77.5),
    (16, '2023-09-11', 101.98),
    (17, '2023-11-13', 44.98),
    (18, '2024-06-19', 141.6),
    (19, '2024-01-27', 243.99),
    (20, '2024-3-08', 11.45),
    (21, '2024-8-16', 12),
    (22, '2024-11-02', 37.1),
    (23, '2024-10-17', 55);
    
INSERT INTO OrderDetails (OrderID, BookID, Quantity, Price)
VALUES
    (1, 1, 1, 10.99),
    (1, 2, 1, 8.99),
    (2, 3, 1, 15.99),
    (3, 4, 2, 12.49);
    
INSERT INTO ShopRatings (CustomerID, Rating, Review, RatingDate)
VALUES
    (1, 5, 'Great experience!', '2022-04-15'),
    (2, 4, 'Good service but a bit slow.', '2023-04-20'),
    (3, 3, 'Average, but prices were good.', '2024-04-25');
    
INSERT INTO BookRatings (CustomerID, BookID, Rating, Review, RatingDate)
VALUES
    (1, 1, 5, 'A timeless classic!', '2023-04-02'),
    (2, 3, 4, 'Very informative.', '2023-04-06'),
    (3, 4, 3, 'A good read, but not great.', '2023-04-12');
    
INSERT INTO Stock (BookID, Quantity)
VALUES
    (1, 32),
    (2, 20),
    (3, 19),
    (4, 3),
    (5, 50),
    (6, 11),
    (7, 7),
    (8, 2),
    (9, 5),
    (10, 25),
    (11, 34),
    (12, 15),
    (13, 11),
    (14, 32),
    (15, 8),
    (16, 6),
    (17, 10),
    (18, 3),
    (19, 1),
    (20, 8),
    (21, 41),
    (22, 20),
    (23, 6),
    (24, 3);

