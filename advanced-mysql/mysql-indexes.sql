/*MySQL Indexes*/
SELECT 
    employeeNumber, 
    lastName, 
    firstName
FROM
    employees
WHERE
    jobTitle = 'Sales Rep';

CREATE INDEX jobTitle ON employees(jobTitle);

EXPLAIN SELECT 
    employeeNumber, 
    lastName, 
    firstName
FROM
    employees
WHERE
    jobTitle = 'Sales Rep';
    
SHOW INDEXES FROM employees;

CREATE TABLE leads(
    lead_id INT AUTO_INCREMENT,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(255) NOT NULL,
    information_source VARCHAR(255),
    INDEX name(first_name,last_name),
    UNIQUE email(email),
    PRIMARY KEY(lead_id)
);

DROP INDEX name ON leads;

DROP INDEX email ON leads
ALGORITHM = INPLACE 
LOCK = DEFAULT;

CREATE TABLE contacts(
    contact_id INT AUTO_INCREMENT,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    phone VARCHAR(20),
    PRIMARY KEY(contact_id),
    UNIQUE(email),
    INDEX phone(phone) INVISIBLE,
    INDEX name(first_name, last_name) comment 'By first name and/or last name'
);

SHOW INDEXES FROM contacts;

SHOW INDEXES FROM contacts
WHERE visible = 'NO';

SELECT 
    productName, 
    buyPrice, 
    msrp
FROM
    products
WHERE
    productName LIKE '1970%';
    
EXPLAIN SELECT 
    productName, 
    buyPrice, 
    msrp
FROM
    products
WHERE
    productName LIKE '1970%';
    
SELECT
   COUNT(*)
FROM
   products;
   
SELECT
   COUNT(DISTINCT LEFT(productName, 20)) unique_rows
FROM
   products;
   
CREATE INDEX idx_productname 
ON products(productName(20));

EXPLAIN SELECT 
    productName, 
    buyPrice, 
    msrp
FROM
    products
WHERE
    productName LIKE '1970%';
    
CREATE TABLE IF NOT EXISTS contacts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    phone VARCHAR(15) NOT NULL,
    email VARCHAR(100) NOT NULL,
    UNIQUE KEY unique_email (email)
);

SHOW INDEXES FROM contacts;

INSERT INTO contacts(first_name,last_name,phone,email)
VALUES('John','Doe','(408)-999-9765','john.doe@mysqltutorial.org');

INSERT INTO contacts(first_name,last_name,phone,email)
VALUES('Johny','Doe','(408)-999-4321','john.doe@mysqltutorial.org');

CREATE UNIQUE INDEX idx_name_phone
ON contacts(first_name,last_name,phone);

INSERT INTO contacts(first_name,last_name,phone,email)
VALUES('john','doe','(408)-999-9765','john.d@mysqltutorial.org');

CREATE INDEX name 
ON employees(lastName, firstName);

SELECT 
    firstName, 
    lastName, 
    email
FROM
    employees
WHERE
    lastName = 'Patterson';
    
EXPLAIN SELECT 
    firstName, 
    lastName, 
    email
FROM
    employees
WHERE
    lastName = 'Patterson';
    
SELECT 
    firstName, 
    lastName, 
    email
FROM
    employees
WHERE
    lastName = 'Patterson' AND
    firstName = 'Steve';
    
EXPLAIN SELECT 
    firstName, 
    lastName, 
    email
FROM
    employees
WHERE
    lastName = 'Patterson' AND
    firstName = 'Steve';
    
SELECT 
    firstName, 
    lastName, 
    email
FROM
    employees
WHERE
    lastName = 'Patterson' AND
    (firstName = 'Steve' OR 
    firstName = 'Mary');
    
EXPLAIN SELECT 
    firstName, 
    lastName, 
    email
FROM
    employees
WHERE
    lastName = 'Patterson' AND
    (firstName = 'Steve' OR 
    firstName = 'Mary');
    
SELECT 
    firstName, 
    lastName, 
    email
FROM
    employees
WHERE
    firstName = 'Leslie';
    
SELECT 
    firstName, 
    lastName, 
    email
FROM
    employees
WHERE
    firstName = 'Anthony' OR
    lastName = 'Steve';
    

CREATE TABLE t (
    a INT,
    b INT,
    INDEX a_asc_b_asc (a ASC , b ASC),
    INDEX a_asc_b_desc (a ASC , b DESC),
    INDEX a_desc_b_asc (a DESC , b ASC),
    INDEX a_desc_b_desc (a DESC , b DESC)
);

CREATE PROCEDURE insertSampleData(
    IN rowCount INT, 
    IN low INT, 
    IN high INT
)
BEGIN
    DECLARE counter INT DEFAULT 0;
    REPEAT
        SET counter := counter + 1;
        -- insert data
        INSERT INTO t(a,b)
        VALUES(
            ROUND((RAND() * (high-low))+high),
            ROUND((RAND() * (high-low))+high)
        );
    UNTIL counter >= rowCount
    END REPEAT;
END$$  

CALL insertSampleData(10000,1,1000);

EXPLAIN SELECT 
    *
FROM
    t
ORDER BY a , b;

EXPLAIN SELECT 
    *
FROM
    t
ORDER BY a , b DESC;

EXPLAIN SELECT 
    *
FROM
    t
ORDER BY a DESC , b;

SHOW INDEXES FROM customers;

CREATE INDEX idx_c_ln  ON customers(contactLastName);
CREATE INDEX idx_c_fn ON customers(contactFirstName);
CREATE INDEX idx_name_fl  ON customers(contactFirstName,contactLastName);
CREATE INDEX idx_name_lf  ON customers(contactLastName,contactFirstName);

EXPLAIN SELECT *
FROM
    customers
WHERE
    contactFirstName LIKE 'A%'
        OR contactLastName LIKE 'A%';
        
EXPLAIN SELECT *
FROM
    customers
USE INDEX (idx_name_fl, idx_name_lf)
WHERE
    contactFirstName LIKE 'A%'
        OR contactLastName LIKE 'A%';
        
SHOW INDEXES FROM products;

SELECT 
    productName, 
    buyPrice
FROM
    products
WHERE
    buyPrice BETWEEN 10 AND 80
ORDER BY buyPrice;

EXPLAIN SELECT 
    productName, 
    buyPrice
FROM
    products
WHERE
    buyPrice BETWEEN 10 AND 80
ORDER BY buyPrice;

CREATE INDEX idx_buyprice ON products(buyPrice); 

EXPLAIN SELECT 
    productName, 
    buyPrice
FROM
    products
WHERE
    buyPrice BETWEEN 10 AND 80
ORDER BY buyPrice;

SELECT 
    productName, buyPrice
FROM
    products 
FORCE INDEX (idx_buyPrice)
WHERE
    buyPrice BETWEEN 10 AND 80
ORDER BY buyPrice;

EXPLAIN SELECT 
    productName, buyPrice
FROM
    products 
FORCE INDEX (idx_buyprice)
WHERE
    buyPrice BETWEEN 10 AND 80
ORDER BY buyPrice;
