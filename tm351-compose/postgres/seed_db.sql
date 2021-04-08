-- Demo PostgreSQL Database initialisation

-- Add users
CREATE USER tm351 PASSWORD 'tm351';
CREATE USER tm351_student PASSWORD 'tm351_pwd';
CREATE USER tm351admin PASSWORD 'tm351admin' SUPERUSER;

-- Create databases
CREATE DATABASE tm351 OWNER tm351;
CREATE DATABASE tm351_clean OWNER tm351_student;
CREATE DATABASE tm351_hospital OWNER tm351_student;
 
-- Create and populate test user, db and table
CREATE USER testuser PASSWORD 'testpass';
CREATE DATABASE testdb OWNER testuser;

\connect testdb testuser
DROP TABLE IF EXISTS quickdemo CASCADE;
CREATE TABLE quickdemo(id INT, name VARCHAR(20), value INT);
INSERT INTO quickdemo VALUES(1,'This',12);
INSERT INTO quickdemo VALUES(2,'That',345);
