USE Bookstore;

INSERT INTO Books (title, author, genre, price, published_year) VALUES
('Book A', 'Author A', 'Fiction', 19.99, 2020),
('Book B', 'Author B', 'Non-Fiction', 25.00, 2019),
('Book C', 'Author C', 'Science Fiction', 15.50, 2021);

INSERT INTO Sales (book_id, quantity, sale_date) VALUES
(1, 3, '2022-01-10'),
(2, 1, '2022-01-15'),
(3, 5, '2022-01-20');

INSERT INTO Authors (name, birthdate) VALUES
('Author A', '1980-05-15'),
('Author B', '1975-11-30'),
('Author C', '1990-07-22');