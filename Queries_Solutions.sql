-- Retrieve all books in the fiction genre:
	SELECT * FROM Books
	WHERE genre = 'Fiction'

-- Find books published after the year 1950
	SELECT * FROM Books
	WHERE published_year > 1950

-- List all the custmers from Canada
	SELECT * FROM customers
	WHERE country = 'Canada'

-- Show orders placed in november 2023
	SELECT * FROM orders
	WHERE order_date BETWEEN '2023-11-01' AND '2023-11-30'

-- Retrieve the total stocks of books available 
	SELECT SUM(stock) AS Total_stock
	FROM Books;

-- Find the detail of most expensive book
	SELECT * FROM Books
	ORDER BY price DESC
	LIMIT 1;

-- Show all the customers who ordered more than 1 quantity of a book
	SELECT * FROM orders
	WHERE quantity > 1

-- Retrieve all the orders where the total amount exceeds $20
	SELECT * FROM Books
	WHERE price > 20

-- List all the genres available in the Books table
	SELECT DISTINCT genre FROM Books

-- Find the book with the lowest stock
	SELECT * FROM Books
	ORDER BY STOCK ASC
	LIMIT 1

-- Calculate the total revenue generated from all orders
	SELECT SUM(total_amount) AS Total_Revenue 
	FROM orders

-- Advance Questions

-- Retrieve the total no. of books sold for each genre
	SELECT b.genre, SUM(o.quantity) AS books_sold
	FROM Books b
	INNER JOIN
	orders o
	ON
	b.book_id = o.book_id
	GROUP BY genre

-- Find the avg price of books in the "Fantasy genre"
	SELECT AVG(price) AS Average_price_of_Fantasy_genre
	FROM Books
	WHERE genre = 'Fantasy'

-- List customers who have placed atleast 2 orders
	SELECT c.customer_id, c.name, COUNT(o.order_id) AS Order_count
	FROM customers c INNER JOIN orders o
	ON c.customer_id = o.customer_id
	GROUP BY c.customer_id, c.name
	HAVING COUNT(order_id) > 1
	ORDER BY c.customer_id
	
-- Find the most frequently ordered book:
	SELECT o.book_id, b.title, COUNT(o.order_id) AS order_Count
	FROM orders o 
	JOIN Books b ON b.book_id = o.book_id
	GROUP BY o.book_id, b.title
	ORDER BY order_Count DESC LIMIT 1;

-- Show the top 3 most expensive books of 'Fantasy Genre' :
	SELECT * FROM Books
	WHERE genre = 'Fantasy'
	ORDER BY price DESC LIMIT 3

-- Retrieve the total quantity of books sold by each author :
	SELECT b.author, SUM(o.quantity) AS Total_books_sold
	FROM Books b JOIN orders o
	ON b.book_id = o.book_id
	GROUP BY author

-- List the cities where customers who spent over 30$ are located :
	SELECT DISTINCT c.city, o.total_amount 
	FROM customers c JOIN orders o
	ON c.customer_id = o.customer_id
	WHERE total_amount > 400

-- Find the customer who spent the most on orders :
	SELECT c.customer_id, c.name, SUM(o.total_amount) AS total_Spent
	FROM customers c JOIN orders o
	ON c.customer_id = o.customer_id
	GROUP BY c.customer_id, c.name
	ORDER BY total_Spent DESC LIMIT 1

-- Calculate the stock remaining after fulfilling all orders :
	SELECT b.book_id, b.title, b.stock, COALESCE(SUM(o.quantity),0) AS Sold_quantity,
	b.stock - COALESCE(SUM(o.quantity),0) AS Remaining_Quantity
	FROM Books b LEFT JOIN orders o
	ON b.book_id = o.book_id
	GROUP BY b.book_id
	ORDER BY b.Book_id
	
	