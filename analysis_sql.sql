-- Analysis

-- Total Balance per Customer and Top 3 Customers
select c.customer_id, c.full_name, sum(a.balance) as Total_Balance
from customers c
join accounts a on a.customer_id = c.customer_id
group by c.customer_id, c.full_name
order by Total_Balance desc
limit 3;

-- Montly Transaction Volume
select 
date_trunc('month',transaction_date) as month,
count(*) as total_transaction,
sum(amount) as total_amount
from transactions 
group by month
order by month;

-- Debit vs Credit Analysis
select transaction_type, count(*) as total_spent
from transactions
group by transaction_type;

-- Top Spending Customers
select c.full_name, sum(t.amount) as total_spent
from customers c
join accounts a on c.customer_id = a.customer_id
join transactions t on a.account_id = t.account_id
where t.transaction_type = 'debit'
group by c.full_name
order by total_spent desc;

-- Loan and Risk Analysis
-- Defaulted Loan
select c.full_name, l.loan_amount, l.loan_status 
from customers c
join loans l on c.customer_id = l.customer_id
where l.loan_status = 'defaulted';

-- Total Loan amount per customer
select c.full_name, sum(l.loan_amount) as total_loan
from customers c 
join loans l on c.customer_id = l.customer_id
group by c.full_name;

-- Missed Payments
select l.loan_id, count(*) as missed_payments
from loan_payments as lp
join loans l on lp.loan_id = l.loan_id
where lp.payment_status = 'missed'
group by l.loan_id;

-- Branch Performance
-- Total Accounts per branch
select b.branch_name, count(a.account_id) as Total_Accounts
from branches b
join accounts a on a.account_id = b.branch_id
group by b.branch_name;

-- Total Balance per Branch
select b.branch_name, sum(a.balance) as Total_Balance
from branches b 
join accounts a on b.branch_id = a.branch_id
group by b.branch_name;

-- Rank Customers by Balance using Rank
select c.full_name, sum(a.balance) as Total_Balance,
	   rank() over(order by sum(a.balance) desc) as Rank
from customers c
join accounts a on c.customer_id = a.customer_id
group by c.full_name;

-- High-Value Customers using CTE (Common Table Expression)
with customer_balance as (
	select c.customer_id, c.full_name, sum(a.balance) as Total_Balance
	from customers c
	join accounts a on c.customer_id = a.customer_id
	group by c.customer_id, c.full_name
)
select * from customer_balance order by total_balance desc;

