# Project Report

## Student Information

**Name:** Saba Alduhni

---

## Project Description

In this project, I designed and implemented an E-Commerce Database using PostgreSQL on Neon. The main purpose of the project was to build a database that stores and organizes the information of an online shopping system in a correct and efficient way.

The database consists of six main tables: **Users, Categories, Products, Orders, Order_Items, and Payments**. These tables are connected using primary keys and foreign keys to maintain the relationships between the data. For example, one user can have multiple orders, each order can contain multiple products through the Order_Items table, and every product belongs to one category.

During the implementation, I used different SQL constraints such as **PRIMARY KEY, FOREIGN KEY, UNIQUE, CHECK, NOT NULL, and DEFAULT** to ensure data accuracy and prevent invalid data from being inserted into the database.

After creating the tables, I inserted sample data representing users, products, categories, orders, order items, and payments. I also tested the database by trying to insert invalid data, such as duplicate email addresses, negative prices, and invalid foreign keys. These tests confirmed that the constraints were working correctly.

## Challenges I Faced

While working on the project, I faced several challenges. One of the main challenges was organizing the SQL code in the correct order. At first, I did not create the tables and insert the data in the required sequence, which caused some foreign key errors. After reviewing the relationships between the tables, I reorganized the SQL scripts so that the tables were created first, followed by the sample data in the correct order.

Another challenge was making sure that the values in the Orders table matched the total prices of the products stored in the Order_Items table. After checking the data, I updated the total amounts to ensure consistency between the tables.

I also had to review the relationships several times to avoid duplicate records and make sure that all foreign keys referred to existing records.

## What I Learned

This project helped me understand how relational databases are designed and how different tables are connected. I learned how to use SQL to create tables, define relationships, insert data, and apply constraints to maintain data integrity.

I also gained practical experience using PostgreSQL and Neon, and I became more confident in solving database errors and organizing SQL scripts correctly.

## Conclusion

Overall, this project improved my understanding of relational database design and SQL. It gave me practical experience in building a complete database system, testing its functionality, and ensuring that the stored data is accurate and consistent.
