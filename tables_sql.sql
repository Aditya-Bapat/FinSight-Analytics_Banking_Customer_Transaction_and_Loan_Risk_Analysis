-- Database: FinSight_Analytics_DB

-- DROP DATABASE IF EXISTS "FinSight_Analytics_DB";

-- CREATE DATABASE "FinSight_Analytics_DB"
--     WITH
--     OWNER = postgres
--     ENCODING = 'UTF8'
--     LC_COLLATE = 'en-US'
--     LC_CTYPE = 'en-US'
--     LOCALE_PROVIDER = 'libc'
--     TABLESPACE = pg_default
--     CONNECTION LIMIT = -1
--     IS_TEMPLATE = False;

CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    date_of_birth DATE,
    gender VARCHAR(10),
    phone VARCHAR(15),
    email VARCHAR(100),
    address TEXT,
    city VARCHAR(50),
    state VARCHAR(50),
    income NUMERIC(12,2),
    occupation VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE branches (
    branch_id SERIAL PRIMARY KEY,
    branch_name VARCHAR(100),
    city VARCHAR(50),
    state VARCHAR(50)
);

CREATE TABLE accounts (
    account_id SERIAL PRIMARY KEY,
    customer_id INT,
    branch_id INT,
    account_type VARCHAR(20),
    balance NUMERIC(12,2),
    account_status VARCHAR(20),
    opened_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (branch_id) REFERENCES branches(branch_id)
);

CREATE TABLE transactions (
    transaction_id SERIAL PRIMARY KEY,
    account_id INT,
    transaction_date TIMESTAMP,
    amount NUMERIC(12,2),
    transaction_type VARCHAR(10),
    transaction_mode VARCHAR(20),
    merchant_name VARCHAR(100),
    description TEXT,
    FOREIGN KEY (account_id) REFERENCES accounts(account_id)
);

CREATE TABLE loans (
    loan_id SERIAL PRIMARY KEY,
    customer_id INT,
    loan_type VARCHAR(50),
    loan_amount NUMERIC(12,2),
    interest_rate NUMERIC(5,2),
    start_date DATE,
    end_date DATE,
    loan_status VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE loan_payments (
    payment_id SERIAL PRIMARY KEY,
    loan_id INT,
    payment_date DATE,
    amount_paid NUMERIC(12,2),
    payment_status VARCHAR(20),
    FOREIGN KEY (loan_id) REFERENCES loans(loan_id)
);

CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    full_name VARCHAR(100),
    role VARCHAR(50),
    branch_id INT,
    hire_date DATE,
    FOREIGN KEY (branch_id) REFERENCES branches(branch_id)
);

INSERT INTO customers (full_name, date_of_birth, gender, phone, email, address, city, state, income, occupation)
VALUES
('Aditya Bapat', '1998-03-24', 'Male', '9136506882', 'aditya@gmail.com', 'Kalyan West', 'Mumbai', 'Maharashtra', 800000, 'Analyst'),
('Rohit Sharma', '1990-05-10', 'Male', '9876543210', 'rohit@gmail.com', 'Andheri East', 'Mumbai', 'Maharashtra', 1200000, 'Manager'),
('Sneha Patil', '1995-08-15', 'Female', '9123456780', 'sneha@gmail.com', 'Baner', 'Pune', 'Maharashtra', 600000, 'Engineer'),
('Amit Verma', '1988-11-20', 'Male', '9988776655', 'amit@gmail.com', 'Indiranagar', 'Bangalore', 'Karnataka', 1500000, 'Consultant'),
('Priya Nair', '1992-02-05', 'Female', '9090909090', 'priya@gmail.com', 'Kochi Central', 'Kochi', 'Kerala', 700000, 'Teacher');

select * from customers limit(5);

INSERT INTO branches (branch_name, city, state)
VALUES
('Mumbai Main Branch', 'Mumbai', 'Maharashtra'),
('Pune Branch', 'Pune', 'Maharashtra'),
('Bangalore Branch', 'Bangalore', 'Karnataka'),
('Kochi Branch', 'Kochi', 'Kerala');

INSERT INTO accounts (customer_id, branch_id, account_type, balance, account_status, opened_date)
VALUES
(1, 1, 'savings', 50000.75, 'active', '2022-01-10'),
(2, 1, 'current', 150000.00, 'active', '2021-06-15'),
(3, 2, 'savings', 30000.50, 'dormant', '2020-03-20'),
(4, 3, 'current', 250000.00, 'active', '2023-02-11'),
(5, 4, 'savings', 45000.00, 'active', '2022-09-05');

INSERT INTO transactions (account_id, transaction_date, amount, transaction_type, transaction_mode, merchant_name, description)
VALUES
(1, '2024-01-10 10:00:00', 5000.00, 'debit', 'UPI', 'Amazon', 'Shopping'),
(1, '2024-01-15 12:30:00', 10000.00, 'credit', 'NEFT', 'Salary', 'Monthly salary'),
(2, '2024-02-01 09:00:00', 20000.00, 'debit', 'Card', 'Flipkart', 'Electronics'),
(3, '2024-02-05 14:20:00', 3000.00, 'debit', 'UPI', 'Swiggy', 'Food'),
(4, '2024-02-10 16:45:00', 50000.00, 'credit', 'RTGS', 'Client Payment', 'Project payment');

INSERT INTO loans (customer_id, loan_type, loan_amount, interest_rate, start_date, end_date, loan_status)
VALUES
(1, 'personal', 200000, 12.5, '2023-01-01', '2026-01-01', 'active'),
(2, 'home', 5000000, 8.5, '2020-05-10', '2035-05-10', 'active'),
(3, 'car', 800000, 9.0, '2021-07-15', '2026-07-15', 'defaulted'),
(4, 'personal', 300000, 13.0, '2022-03-01', '2025-03-01', 'active'),
(5, 'education', 1000000, 10.0, '2019-09-01', '2029-09-01', 'active');

INSERT INTO loan_payments (loan_id, payment_date, amount_paid, payment_status)
VALUES
(1, '2024-01-05', 10000, 'paid'),
(1, '2024-02-05', 10000, 'paid'),
(3, '2024-01-10', 0, 'missed'),
(2, '2024-01-15', 50000, 'paid'),
(4, '2024-02-01', 15000, 'late');

INSERT INTO employees (full_name, role, branch_id, hire_date)
VALUES
('Raj Mehta', 'Manager', 1, '2018-06-01'),
('Neha Singh', 'Clerk', 2, '2020-09-15'),
('Arjun Rao', 'Analyst', 3, '2021-11-20'),
('Meera Iyer', 'Manager', 4, '2019-04-10');

