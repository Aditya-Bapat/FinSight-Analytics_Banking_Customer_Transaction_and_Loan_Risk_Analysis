# FinSight Analytics

FinSight Analytics is a finance and banking analytics project designed to grow into an end-to-end analytics portfolio across SQL, Python, Power BI, and Excel.

The current phase focuses on SQL database design and analysis queries. Future phases will expand the same project with Python-based analysis, Power BI dashboards, and Excel reporting.

## Project Overview

This project uses a sample banking dataset to analyze customer accounts, transactions, loans, loan payments, branch performance, and customer value.

The goal is to build a practical analytics workflow that starts with structured database design and SQL analysis, then grows into deeper data analysis, dashboarding, and business reporting.

## Current Project Scope

- Design a relational banking database.
- Create tables for customers, branches, accounts, transactions, loans, loan payments, and employees.
- Insert sample data for analysis.
- Write SQL queries to answer business questions.
- Prepare the project for future Python, Power BI, and Excel additions.

## Tools and Technologies

| Area | Tools |
| --- | --- |
| Database | PostgreSQL |
| Querying | SQL |
| Data Analysis | Python, planned |
| Dashboards | Power BI, planned |
| Reporting | Excel, planned |
| Version Control | Git and GitHub |

## Repository Structure

```text
FinSight_Analytics/
+-- tables_sql.sql        # Database schema and sample data
+-- analysis_sql.sql      # SQL analysis queries
+-- SQL_Queries.docx      # SQL query documentation/export
+-- draft_of_project.docx # Project draft document
+-- README.md             # Project documentation
```

## Database Design

The SQL database is built around a retail banking structure.

### Tables

- `customers`: Customer profile, location, income, and occupation details.
- `branches`: Bank branch information.
- `accounts`: Customer account details, account type, balance, and status.
- `transactions`: Debit and credit transaction records.
- `loans`: Customer loan details, interest rate, dates, and loan status.
- `loan_payments`: Loan repayment status and payment history.
- `employees`: Employee and branch assignment details.

### Relationships

- One customer can have one or more accounts.
- One branch can manage multiple accounts and employees.
- One account can have multiple transactions.
- One customer can have one or more loans.
- One loan can have multiple loan payment records.

## SQL Files

### `tables_sql.sql`

This file contains:

- Database setup notes for `FinSight_Analytics_DB`.
- Table creation scripts.
- Primary key and foreign key relationships.
- Sample insert statements for customers, branches, accounts, transactions, loans, loan payments, and employees.

### `analysis_sql.sql`

This file contains business analysis queries for:

- Total balance per customer.
- Top customers by account balance.
- Monthly transaction volume.
- Debit vs credit transaction analysis.
- Top spending customers.
- Defaulted loan identification.
- Total loan amount per customer.
- Missed loan payment tracking.
- Branch account and balance performance.
- Customer ranking using SQL window functions.
- High-value customer analysis using a CTE.

## Key Business Questions

The SQL layer currently answers questions such as:

- Which customers hold the highest balances?
- What is the monthly transaction volume?
- How many debit and credit transactions are present?
- Which customers spend the most?
- Which loans are defaulted?
- Which customers have the highest total loan exposure?
- Which loans have missed payments?
- How are branches performing by accounts and balances?
- How can customers be ranked by total balance?

## How to Use the SQL Files

1. Create a PostgreSQL database named `FinSight_Analytics_DB`.
2. Run `tables_sql.sql` to create tables and insert sample data.
3. Run `analysis_sql.sql` to execute the analysis queries.
4. Review and expand the queries based on additional business questions.

## Future Expansion Plan

### Python

Planned Python work may include:

- Connecting to the PostgreSQL database.
- Loading SQL query outputs into pandas.
- Performing exploratory data analysis.
- Creating charts and summary metrics.
- Building reusable analysis scripts or notebooks.

### Power BI

Planned Power BI work may include:

- Importing SQL or cleaned Python outputs.
- Creating dashboards for customer behavior, transactions, loans, and branch performance.
- Designing KPI cards, filters, and drill-down views.
- Publishing an interactive finance analytics dashboard.

### Excel

Planned Excel work may include:

- Creating summary reports.
- Building pivot tables and charts.
- Preparing finance KPI sheets.
- Comparing SQL query outputs with spreadsheet-based analysis.

## Project Status

| Phase | Status |
| --- | --- |
| SQL schema design | Completed |
| SQL sample data | Completed |
| SQL analysis queries | Completed |
| Python analysis | Planned |
| Power BI dashboard | Planned |
| Excel reporting | Planned |

## Author

Aditya Bapat
