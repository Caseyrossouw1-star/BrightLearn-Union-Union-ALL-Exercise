-- Databricks notebook source
CREATE OR REPLACE TABLE branch_rosebank_accounts ( -- Table 1
    account_id STRING,
    account_holder STRING
);

INSERT INTO branch_rosebank_accounts VALUES
('A003','Lerato Sithole'),
('A004','Peter Nkosi'),
('A005','Zanele Khumalo'),
('A006','Thabo Motha');


CREATE OR REPLACE TABLE savings_products ( -- Table 2
    product_code STRING,
    product_name STRING
);

INSERT INTO savings_products VALUES
('SV01','Basic Savings'),
('SV02','Premium Savings'),
('SV03','Youth Savings'),
('SV04','Business Savings');

CREATE OR REPLACE TABLE current_products (
    product_code STRING,
    product_name STRING
);

INSERT INTO current_products VALUES
('CR01','Standard Current'),
('CR02','Gold Current'),
('SV03','Youth Savings'),
('CR03','Business Current');


CREATE OR REPLACE TABLE retail_banking_staff ( -- Table 3
    staff_id STRING,
    staff_name STRING
);

INSERT INTO retail_banking_staff VALUES
('S001','Mpho Radebe'),
('S002','Brian Tshabalala'),
('S003','Aisha Patel'),
('S004','Kabelo Moabelo');

CREATE OR REPLACE TABLE corporate_banking_staff (
    staff_id STRING,
    staff_name STRING
);

INSERT INTO corporate_banking_staff VALUES
('S003','Aisha Patel'),
('S005','Nandi Dube'),
('S006','Sipho Khumalo'),
('S004','Kabelo Moabelo');


CREATE OR REPLACE TABLE mobile_branch_cities ( -- Table 4
    city_code STRING,
    city_name STRING
);

INSERT INTO mobile_branch_cities VALUES
('C01','Johannesburg'),
('C02','Pretoria'),
('C03','Cape Town'),
('C04','Durban');

CREATE OR REPLACE TABLE digital_branch_cities (
    city_code STRING,
    city_name STRING
);

INSERT INTO digital_branch_cities VALUES
('C03','Cape Town'),
('C05','Polokwane'),
('C06','Port Elizabeth'),
('C01','Johannesburg');


CREATE OR REPLACE TABLE push_notification_targets ( -- Table 5
    customer_id STRING,
    customer_name STRING
);

INSERT INTO push_notification_targets VALUES
('C1001','Nomsa Zwane'),
('C1002','Andile Buthelezi'),
('C1003','Fatima Mahomed'),
('C1004','Ryno van Zyl');

CREATE OR REPLACE TABLE inapp_banner_targets (
    customer_id STRING,
    customer_name STRING
);

INSERT INTO inapp_banner_targets VALUES
('C1003','Fatima Mahomed'),
('C1005','Thandeka Cele'),
('C1006','Samuel Nkosi'),
('C1002','Andile Buthelezi');


CREATE OR REPLACE TABLE atm01_transactions ( -- Table 6
    txn_id STRING,
    account_id STRING,
    amount DECIMAL(10,2)
);

INSERT INTO atm01_transactions VALUES
('T1001','A001',500.00),
('T1002','A002',1200.00),
('T1003','A001',300.00),
('T1004','A003',750.00);

CREATE OR REPLACE TABLE atm02_transactions (
    txn_id STRING,
    account_id STRING,
    amount DECIMAL(10,2)
);

INSERT INTO atm02_transactions VALUES
('T1003','A001',300.00),
('T1005','A004',900.00),
('T1006','A002',450.00),
('T1007','A005',150.00);


CREATE OR REPLACE TABLE gauteng_loan_applications ( -- Table 7
    app_id STRING,
    customer_id STRING,
    loan_type STRING
);

INSERT INTO gauteng_loan_applications VALUES
('LA001','C1001','Home Loan'),
('LA002','C1002','Vehicle Loan'),
('LA003','C1003','Personal'),
('LA004','C1004','Home Loan');

CREATE OR REPLACE TABLE western_cape_loan_applications (
    app_id STRING,
    customer_id STRING,
    loan_type STRING
);

INSERT INTO western_cape_loan_applications VALUES
('LA003','C1003','Personal'),
('LA005','C1005','Vehicle Loan'),
('LA006','C1006','Business'),
('LA007','C1007','Home Loan');


CREATE OR REPLACE TABLE email_complaints ( -- Table 8
    complaint_id STRING,
    customer_id STRING
);

INSERT INTO email_complaints VALUES
('EC001','C2001'),
('EC002','C2002'),
('EC003','C2003'),
('EC004','C2004');

CREATE OR REPLACE TABLE app_complaints (
    complaint_id STRING,
    customer_id STRING
);

INSERT INTO app_complaints VALUES
('AC001','C2005'),
('AC002','C2001'),
('AC003','C2006'),
('AC004','C2007');


CREATE OR REPLACE TABLE april_payments ( -- Table 9
    payment_id STRING,
    account_id STRING,
    amount DECIMAL(10,2)
);

INSERT INTO april_payments VALUES
('PAY001','A001',12500.00),
('PAY002','A002',4800.00),
('PAY003','A003',9200.00),
('PAY004','A004',3300.00);

CREATE OR REPLACE TABLE may_payments (
    payment_id STRING,
    account_id STRING,
    amount DECIMAL(10,2)
);

INSERT INTO may_payments VALUES
('PAY005','A001',12500.00),
('PAY006','A005',7600.00),
('PAY007','A002',5100.00),
('PAY008','A006',2800.00);

CREATE OR REPLACE TABLE debit_entries ( -- Table 10
    entry_id STRING,
    account_id STRING,
    entry_type STRING
);

INSERT INTO debit_entries VALUES
('DR001','A001','Debit'),
('DR002','A002','Debit'),
('DR003','A003','Debit'),
('DR004','A004','Debit');

CREATE OR REPLACE TABLE credit_entries (
    entry_id STRING,
    account_id STRING,
    entry_type STRING
);

INSERT INTO credit_entries VALUES
('CR001','A001','Credit'),
('CR002','A005','Credit'),
('CR003','A002','Credit'),
('CR004','A006','Credit');

SELECT                 -- Answer: Question 1
    account_id,
    account_holder,
    'Sandton' AS city
FROM branch_sandton_accounts

UNION

SELECT
    account_id,
    account_holder,
    'Rosebank' AS city
FROM branch_rosebank_accounts;


SELECT product_code, product_name, 'Savings' AS product_type -- Answer: Question 2
FROM savings_products

UNION

SELECT product_code, product_name, 'Current' AS product_type
FROM current_products;


SELECT staff_id, staff_name, 'staff@nexbank.co.za' AS email -- Answer: Question 3
FROM retail_banking_staff

UNION

SELECT staff_id, staff_name, 'staff@nexbank.co.za' AS email
FROM corporate_banking_staff;


SELECT city_code, city_name, 'South Africa' AS region -- Answer: Question 4
FROM mobile_branch_cities

UNION

SELECT city_code, city_name, 'South Africa' AS region
FROM digital_branch_cities;


SELECT customer_id, customer_name, 'Retail Customer' AS segment -- Answer: Question 5
FROM push_notification_targets

UNION

SELECT customer_id, customer_name, 'Retail Customer' AS segment
FROM inapp_banner_targets;


SELECT txn_id AS transaction_id,  -- Answer: Question 6
       account_id,
       amount,
       '2025-01-01' AS transaction_date
FROM atm01_transactions

UNION ALL

SELECT txn_id AS transaction_id,
       account_id,
       amount,
       '2025-01-01' AS transaction_date
FROM atm02_transactions;


SELECT app_id AS application_id, -- Answer: Question 7
       customer_id,
       loan_type,
       0 AS amount_requested
FROM gauteng_loan_applications

UNION ALL

SELECT app_id AS application_id,
       customer_id,
       loan_type,
       0 AS amount_requested
FROM western_cape_loan_applications;


SELECT complaint_id, -- Answer: Question 8
       customer_id,
       'Complaint' AS category,
       '2025-01-01' AS logged_date
FROM email_complaints

UNION ALL

SELECT complaint_id,
       customer_id,
       'Complaint' AS category,
       '2025-01-01' AS logged_date
FROM app_complaints;


SELECT payment_id, -- Answer: Question 9
       account_id,
       amount,
       '2025-04-01' AS payment_date
FROM april_payments

UNION ALL

SELECT payment_id,
       account_id,
       amount,
       '2025-05-01' AS payment_date
FROM may_payments;


SELECT entry_id, -- Answer: Question 10
       account_id,
       entry_type,
       0 AS amount,
       '2025-01-01' AS entry_date
FROM debit_entries

UNION ALL

SELECT entry_id,
       account_id,
       entry_type,
       0 AS amount,
       '2025-01-01' AS entry_date
FROM credit_entries;



-- COMMAND ----------

