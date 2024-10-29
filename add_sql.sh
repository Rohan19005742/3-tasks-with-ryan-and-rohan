#!/bin/bash

# Set up MySQL credentials and database name
MYSQL_USER="root"
MYSQL_PASSWORD="root"
DATABASE_NAME="LibraryDB"

# Create the SQL setup file
SQL_FILE="setup_library.sql"
cat <<EOF > $SQL_FILE
-- Create database
CREATE DATABASE IF NOT EXISTS $DATABASE_NAME;
USE $DATABASE_NAME;

-- Create table for Authors
CREATE TABLE IF NOT EXISTS Authors (
    author_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL
);

-- Create table for Books
CREATE TABLE IF NOT EXISTS Books (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    author_id INT,
    published_year INT,
    genre VARCHAR(50),
    copies_available INT DEFAULT 1,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

-- Create table for Members
CREATE TABLE IF NOT EXISTS Members (
    member_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE,
    email VARCHAR(100),
    phone_number VARCHAR(15)
);

-- Create table for Loans
CREATE TABLE IF NOT EXISTS Loans (
    loan_id INT PRIMARY KEY AUTO_INCREMENT,
    book_id INT,
    member_id INT,
    loan_date DATE NOT NULL,
    return_date DATE,
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (member_id) REFERENCES Members(member_id)
);

-- Insert authors
INSERT INTO Authors (first_name, last_name) VALUES
('George', 'Orwell'),
('Harper', 'Lee'),
('J.K.', 'Rowling');

-- Insert books
INSERT INTO Books (title, author_id, published_year, genre, copies_available) VALUES
('1984', 1, 1949, 'Dystopian', 3),
('Animal Farm', 1, 1945, 'Allegory', 5),
('To Kill a Mockingbird', 2, 1960, 'Fiction', 2),
('Harry Potter and the Philosopher\'s Stone', 3, 1997, 'Fantasy', 7);

-- Insert members
INSERT INTO Members (first_name, last_name, date_of_birth, email, phone_number) VALUES
('John', 'Doe', '1988-06-15', 'john.doe@example.com', '555-1234'),
('Jane', 'Smith', '1992-08-20', 'jane.smith@example.com', '555-5678'),
('Bob', 'Johnson', '1975-12-05', 'bob.johnson@example.com', '555-9876');

-- Insert loans
INSERT INTO Loans (book_id, member_id, loan_date, return_date) VALUES
(1, 1, '2024-10-01', '2024-10-15'),
(2, 1, '2024-10-10', NULL),
(4, 2, '2024-09-20', '2024-10-05');
EOF

# Run the SQL file to set up the database and tables
echo "Setting up database and tables..."
mysql -u $MYSQL_USER -p$MYSQL_PASSWORD < $SQL_FILE

# Check if the setup was successful
if [ $? -eq 0 ]; then
    echo "Database setup completed successfully."
else
    echo "Database setup failed. Please check the MySQL credentials and try again."
fi
