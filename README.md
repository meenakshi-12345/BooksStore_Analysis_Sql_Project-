📚 BookStore Database Project

A relational SQL database designed for managing a bookstore's inventory, customers, and orders. This project includes table creation scripts, sample queries, and analytical SQL operations ranging from basic to advanced.

🚀 Project Overview

This project demonstrates how a bookstore's data can be organized and analyzed using SQL. It covers:

Creating relational tables with foreign key constraints

Running CRUD-style queries

Writing analytical SQL for insights such as revenue, customer behavior, inventory management, etc.

It’s designed as a learning-friendly SQL project for practicing database design and querying skills.

🧱 Database Structure

The project consists of three main tables:

1. Books

Stores information about each book available.
Columns:

Book_ID (Primary Key)

Title

Author

Genre

Published_Year

Price

Stock

2. Customers

Contains customer details.
Columns:

Customer_ID (Primary Key)

Name

Email

Phone

City

Country

3. Orders

Records book orders placed by customers.
Columns:

Order_ID (Primary Key)

Customer_ID (FK → Customers)

Book_ID (FK → Books)

Order_Date

Quantity

Total_Amount

📝 Features & Queries Included
🔹 Basic Queries

The SQL file includes beginner-friendly queries such as:

Fetching all fiction books

Finding books published after a specific year

Listing customers from a particular country

Calculating total stock

Finding the most expensive or lowest-stock book

Viewing orders within a date range

🔹 Intermediate Queries

Distinct genres available

Orders with total amount above a threshold

Books with low inventory

🔹 Advanced Analytical Queries

This project also demonstrates deeper SQL analysis:

Total books sold by genre

Average price of books for a specific genre

Customers who placed multiple orders

Most frequently ordered book (with title)

Total revenue generated

Remaining stock after fulfilling all orders

Cities of high-spending customers

Authors with highest sales

📂 File Included

BookStore_final_Project.sql — Full SQL script containing:
✔ Table creation
✔ Sample SELECT queries
✔ Joins, aggregations, analytical SQL

▶️ How to Use

Open MySQL Workbench, pgAdmin, or any SQL client.

Create a new database (e.g., BookStoreDB).

Import / run the provided SQL file.

Execute queries individually to explore the dataset and results.

🎯 Learning Outcomes

By working with this project, you will learn:

How to design normalized relational database tables

How to use JOIN, GROUP BY, HAVING, ORDER BY

Writing analytical SQL queries

Calculating insights such as revenue, best-selling books, customer behavior, etc.

🤝 Contributing

Feel free to:

Add more tables (e.g., Publishers, Categories)

Insert real sample data

Build dashboards in Power BI/Tableau using this dataset

Extend queries with window functions

📧 Contact
✍️ Author

Meenakshi Rajpurohit

SQL & Data Analytics Enthusiast

Passionate about database design, data cleaning, and real-world problem-solving

Always exploring new ways to turn raw data into meaningful insights

If you use or extend this project, giving credit is appreciated!

If you want help expanding this project or turning it into a full SQL case study or portfolio project, feel free to reach out!

