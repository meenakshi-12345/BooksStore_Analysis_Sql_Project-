

-- Create Tables

DROP TABLE IF EXISTS Books;
CREATE TABLE Books (
    Book_ID SERIAL PRIMARY KEY,
    Title VARCHAR(100),
    Author VARCHAR(100),
    Genre VARCHAR(50),
    Published_Year INT,
    Price NUMERIC(10, 2),
    Stock INT
);
DROP TABLE IF EXISTS customers;
CREATE TABLE Customers (
    Customer_ID SERIAL PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    City VARCHAR(50),
    Country VARCHAR(150)
);
DROP TABLE IF EXISTS orders;
CREATE TABLE Orders (
    Order_ID SERIAL PRIMARY KEY,
    Customer_ID INT REFERENCES Customers(Customer_ID),
    Book_ID INT REFERENCES Books(Book_ID),
    Order_Date DATE,
    Quantity INT,
    Total_Amount NUMERIC(10, 2)
);




SELECT * FROM books;
SELECT * FROM Customers;
SELECT * FROM Orders;



--1) Retrieve all books in the fiction genre:

SELECT * FROM books 
WHERE genre = 'Fiction';


--2) find books published after the year 1950

SELECT * FROM books
WHERE published_year > 1950;

--3) List all the customers from Canada

SELECT * FROM customers 
WHERE country = 'Canada';

--4) show orders placed in november 2023

SELECT * FROM orders
WHERE order_date BETWEEN '2023-11-01' AND '2023-11-30';

--5) Retreive the total stocks of books available

SELECT SUM(stock) AS total_stock FROM books;

--6)find the details of the most expensive book

SELECT * FROM books ORDER BY price DESC LIMIT 1;

--7)Show all the cutomers who ordered more than 1 quantity of book

SELECT * FROM orders
WHERE quantity>1;

--8) Retreive all orders where the total amount exceeds $20

SELECT * FROM orders
WHERE total_amount > 20;

--9) list all genres available in the books table

SELECT DISTINCT genre FROM books;

--10) find the books with the lowest stock

SELECT * FROM books ORDER BY stock ASC LIMIT 1 ;


--11) Calculate the total revenue generated from all the orders

SELECT SUM(total_amount) AS total_revenue FROM orders;

--ADVANCE QUERIES 


--1) Retreive the total number of books sold for each genre


SELECT b.Genre, SUM(o.Quantity) AS total_books_sold

FROM Orders o

JOIN Books b ON o.book_id = b.book_id

GROUP BY b.Genre;


--2) find the average price of books in the fantasy genre


SELECT AVG(price) AS average_price FROM books

WHERE genre = 'Fantasy';



--3) list customers who have placed atleast 2 orders


SELECT customer_id, COUNT(order_id) AS order_count FROM orders

GROUP BY customer_id 

HAVING COUNT(order_id) >=2; 

--when we give condition on col we directly use where command but in case of aggregation we use having


--what if I want names of the cutomers who have placed atleast 2 orders

SELECT o.customer_id, c.name, COUNT(o.Order_id) AS order_count 

FROM orders o

JOIN customers c ON o.customer_id = c.customer_id

GROUP BY o.customer_id, c.name

HAVING COUNT(order_id) >=2;


--4) find the most frequently ordered book

SELECT book_id, COUNT(order_id) AS order_count

FROM orders

GROUP BY book_id

ORDER BY order_count DESC LIMIT(1);

--In order to find the name of the book


SELECT o.book_id, b.title, COUNT(o.order_id) AS order_count

FROM orders o

JOIN books b ON o.book_id = b.book_id

GROUP BY o.book_id, b.title

ORDER BY order_count DESC LIMIT 1;


--5) show the top 3 most expensive books of  'Fantasy' genre

SELECT * FROM books

WHERE genre ='Fantasy'

ORDER BY price DESC LIMIT 3;


--6) retrieve the total quantity of book sold by each author




SELECT b.author, SUM(o.quantity) AS total_books_sold 

FROM orders o

JOIN books b ON o.book_id = b.book_id

GROUP BY b.author;



--7) list the cities where customers who spent over $30 are located



SELECT DISTINCT c.city, o.total_amount  

FROM orders o

JOIN customers c ON o.customer_id = c.customer_id

WHERE o.total_amount > 30;
 


--8) Find the customer who have spent more on orders

SELECT c.customer_id, c.name, SUM(o.total_amount) AS total_spent

FROM orders o

JOIN customers c ON o.customer_id = c.customer_id


GROUP BY c.customer_id, c.name

ORDER BY total_spent DESC LIMIT 1;



--9) Calculate the stock remaining after fulfilling all orders


SELECT b.book_id, b.title, b.stock , COALESCE (SUM(o.quantity),0) AS order_quantity,
b.stock- COALESCE (SUM(o.quantity),0) AS remaining_quantity

FROM books b 

LEFT JOIN orders o ON b.book_id = o.book_id

GROUP BY b.book_id ORDER BY book_id;






























