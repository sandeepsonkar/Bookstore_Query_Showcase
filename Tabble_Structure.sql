DROP TABLE IF EXISTS Books;
CREATE TABLE Books (
	Book_ID SERIAL PRIMARY KEY,
	Title VARCHAR(100),
	Author VARCHAR(100),
	Genre VARCHAR(100),
	Published_year INT,
	Price NUMERIC(10,2),
	Stock INT
);

DROP TABLE IF EXISTS customers;
CREATE TABLE customers (
	Customer_id SERIAL PRIMARY KEY,
	Name VARCHAR(50),
	Email VARCHAR(50),
	Phone VARCHAR(50),
	City VARCHAR(50),
	Country VARCHAR(100)
);

DROP TABLE IF EXISTS orders;
CREATE TABLE orders (
	Order_id SERIAL PRIMARY KEY,
	Customer_id INT REFERENCES Customers(Customer_id),
	Book_id INT REFERENCES Books(Book_ID),
	Order_Date DATE,
	Quantity INT,
	Total_amount NUMERIC(10,2)	
);