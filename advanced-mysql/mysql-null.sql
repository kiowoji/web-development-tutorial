/*MySQL NULL*/
DROP TABLE IF EXISTS leads;

CREATE TABLE leads (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    source VARCHAR(255) NOT NULL,
    email VARCHAR(100),
    phone VARCHAR(25)
);

INSERT INTO leads(first_name,last_name,source,email,phone)
VALUE('John','Doe','Web Search','john.doe@acme.com',NULL);

INSERT INTO leads(first_name,last_name,source,phone)
VALUES
    ('Lily','Bush','Cold Calling','(408)-555-1234'),
    ('David','William','Web Search','(408)-888-6789');
    
UPDATE leads 
SET 
    phone = NULL
WHERE
    id = 3;
    
SELECT 
    *
FROM
    leads
ORDER BY phone;

SELECT 
    *
FROM
    leads
ORDER BY phone DESC;

SELECT 
    *
FROM
    leads
WHERE
    phone IS NULL;
    
SELECT 
    *
FROM
    leads
WHERE
    email IS NOT NULL;
    
CREATE UNIQUE INDEX idx_phone ON leads(phone);

SELECT 
    id, 
    first_name, 
    last_name, 
    IFNULL(phone, 'N/A') phone
FROM
    leads;
    
SELECT 
    id,
    first_name,
    last_name,
    COALESCE(phone, email, 'N/A') contact
FROM
    leads;
    
INSERT INTO leads(first_name,last_name,source,email,phone)
VALUE('Thierry','Henry','Web Search','thierry.henry@example.com','');

SELECT 
    id,
    first_name,
    last_name,
    COALESCE(phone, email, 'N/A') contact
FROM
    leads;
    
SELECT 
    id,
    first_name,
    last_name,
    COALESCE(NULLIF(phone, ''), email, 'N/A') contact
FROM
    leads;
    
    


