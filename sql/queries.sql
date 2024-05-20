USE Bookstore;

-- Total sales by book with author information
SELECT b.title, a.name AS author, SUM(s.quantity) AS total_sales
FROM Books b
JOIN Sales s ON b.id = s.books_id
JOIN Authors a ON b.author = a.name
GROUP BY b.title, a.name;

-- Average price of books by genre using wndow functions
SELECT genre, AVG(price) OVER (PARTITION BY genre) AS average_price
FROM Books;

--Books published in the last two years with subqueries
SELECT title, author, published_year
FROM Books
WHere published_year >= (SELECT YEAR(CURDATE()) - 2);

-- Total sales per author
SELECT a.name AS author, SUM(s.quantity) AS total_sales
FROM Authors a
JOIN Books b ON a.name = b.author
JOIN Sales s ON b.id = s.books_id
GROUP BY a.name

-- Detailed sales report with subqueries and window functions
SELECT b.title, b.genre, b.price, a.name AS author, s.quantity, s.sale_date,
    SUM(s.quantity) OVER (PARTITION BY b.id) AS total_sales_per_book,
    ROW_NUMBER() OVER (PARTITION BY b.genre ORDER BY s.sale_date) AS sales_rank
FROM Books b
JOIN Sales s ON b.id = s.book_id
JOIN Authors a ON b.author = a.name;