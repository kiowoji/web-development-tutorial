/*MySQL Compare Two Tables*/
CREATE TABLE t1(
	id int auto_increment primary key,
    title varchar(255)	
);

CREATE TABLE t2(
	id int auto_increment primary key,
    title varchar(255),
    note varchar(255)
);

INSERT INTO t1(title)
VALUES('row 1'),('row 2'),('row 3');

INSERT INTO t2(title,note)
SELECT title, 'data migration'
FROM t1;

SELECT id,title
FROM (
SELECT id, title FROM t1
UNION ALL
SELECT id,title FROM t2
) tbl
GROUP BY id, title
HAVING count(*) = 1
ORDER BY id;

INSERT INTO t2(title,note)
VALUES('new row 4','new');