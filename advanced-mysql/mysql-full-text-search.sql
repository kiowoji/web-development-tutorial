/*Creating FULLTEXT Indexes for Full-Text Search*/
CREATE TABLE posts (
  id INT NOT NULL AUTO_INCREMENT,
  title VARCHAR(255) NOT NULL,
  body TEXT,
  PRIMARY KEY (id),
  FULLTEXT KEY (body )
);

ALTER TABLE products  
ADD FULLTEXT(productDescription,productLine)

CREATE FULLTEXT INDEX address
ON offices(addressLine1,addressLine2)

ALTER TABLE offices
DROP INDEX address;

/*MySQL Natural Language Full-Text Searches*/
ALTER TABLE products 
ADD FULLTEXT(productline);

SELECT 
    productName, 
    productLine 
FROM products 
WHERE 
    MATCH(productLine) 
    AGAINST('Classic');
    
SELECT 
	productName, 
    productLine 
FROM products 
WHERE 
	MATCH(productline) 
    AGAINST('Classic,Vintage')
ORDER BY productName;

SELECT 
	productName, 
    productLine 
FROM products 
WHERE 
	MATCH(productline) 
	AGAINST('Classic,Vintage' IN NATURAL LANGUAGE MODE)
    
ALTER TABLE products 
ADD FULLTEXT(productName);

SELECT 
	productName, 
    productLine 
FROM products 
WHERE 
	MATCH(productName) 
    AGAINST('1932,Ford');
    
/*MySQL Boolean Full-Text Searches*/
SELECT productName, productline
FROM products
WHERE MATCH(productName) 
      AGAINST('Truck' IN BOOLEAN MODE )
      
SELECT productName, productline
FROM products
WHERE MATCH(productName) AGAINST('Truck -Pickup' IN BOOLEAN MODE )

/*MySQL Query Expansion*/
ALTER TABLE products 
ADD FULLTEXT(productName);

SELECT 
    productName
FROM
    products
WHERE
    MATCH (productName) 
    AGAINST ('1992' );
    
SELECT 
	productName 
FROM 
	products 
WHERE 
	MATCH(productName) 
    AGAINST('1992' WITH QUERY EXPANSION);

/*MySQL ngram Full-Text Parser*/
DROP TABLE IF EXISTS posts;

CREATE TABLE posts (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255),
    body TEXT,
    FULLTEXT ( title , body ) WITH PARSER NGRAM
)  ENGINE=INNODB CHARACTER SET UTF8MB4;

SET NAMES utf8mb4;

INSERT INTO posts(title,body)
VALUES('MySQL全文搜索','MySQL提供了具有许多好的功能的内置全文搜索'),
      ('MySQL教程','学习MySQL快速，简单和有趣');
      
SET GLOBAL innodb_ft_aux_table="test/posts";

SELECT 
    * 
FROM 
    information_schema.innodb_ft_index_cache
ORDER BY 
    doc_id , 
    position;
    
SELECT 
    id, title, body
FROM
    posts
WHERE
    MATCH (title , body) AGAINST ('搜索' );
    
SELECT 
    *
FROM
    posts
WHERE
    MATCH (title , body)  
    AGAINST ('简单和有趣' IN natural language MODE);
    
SELECT 
    *
FROM
    posts
WHERE
    MATCH (title , body) 
    AGAINST ('简单和有趣' IN BOOLEAN MODE);
    
SELECT 
    id, 
    title, 
    body
FROM
    posts
WHERE
    MATCH (title , body) 
    AGAINST ('my*' );
    
SELECT 
    id, 
    title, 
    body
FROM
    posts
WHERE
    MATCH (title , body) 
    AGAINST ('mysqld*' );
