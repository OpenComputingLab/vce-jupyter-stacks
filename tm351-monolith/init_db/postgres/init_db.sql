-- Demo PostgreSQL Database initialisation
CREATE USER testuser PASSWORD 'testpass';
CREATE USER tm351 PASSWORD 'tm351';
CREATE USER tm351_student PASSWORD 'tm351_pwd';
CREATE USER tm351admin PASSWORD 'tm351admin' SUPERUSER;


DROP TABLE IF EXISTS quickdemo CASCADE;
CREATE TABLE quickdemo(id INT, name VARCHAR(20), value INT);
INSERT INTO quickdemo VALUES(1,'This',12);
INSERT INTO quickdemo VALUES(2,'That',345);

ALTER TABLE quickdemo OWNER TO testuser;

