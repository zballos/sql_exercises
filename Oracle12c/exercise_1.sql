# Oracle 12c
# Before all, initialize with the command 'sqlplus' for entry in Oracle Database.

# Exercises about install oracle database 12c, connect with new user, creating table and executing selects in table created.

# Create a table 'finances' with attributes: value, my_date, observation and received.
CREATE TABLE finances (value, my_date, observation, received);

# But they need the respective types.
CREATE TABLE finances (value number, my_date date, observation varchar2(30), received char);

# The attribute received needs a verification because he receive a boolean value (0 or 1), so:
CREATE TABLE finances (value number, my_date date, observation varchar2(30), received char check (received in (0, 1)));

# Now, we need inform a unique key, that will be receive sequencial numbers:
CREATE TABLE finances (
	id number primary key,
	value number,
	my_date date,
	observation varchar2(30),
	received char check (received in (0, 1))
);

# For create sequence numbers, we need execute the command below (default value is 0):
CREATE SEQUENCE id_seq;

# When create new values in table finances, insert the value id_seq.nextval. 

# Before intert, verify the configuration of the date in the Oracle, execute the command:
show parameter nls_lang;	 

# Inserting one register
INSERT INTO finances (id, value, my_date, observation, received) VALUES (id_seq.nextval, 45.90, '01-MAI-2017', 'Potato Fritz', '1');

# select all values and observations with date equal or greater than 30/04/2016:
SELECT value, observation FROM finances WHERE my_date >= '30-ABR-2016';

# select all values and observations with date equal or greater than 30/04/2016 and less or equal 30/12/2016:
SELECT value, observation FROM finances WHERE my_date >= '30-ABR-2016' AND my_date <= '30-DEZ-2016';

# Others consults:
SELECT * FROM finances WHERE value >= 25 AND value <= 50 AND observation LIKE 'RESTAURANT%'; 
SELECT * FROM finances WHERE received = '1';
SELECT * FROM finances WHERE received = '0';

# ATTEMPTION! Oracle database not accept boolean type values. 

# Operator OR examples:
SELECT * FROM finances WHERE value > 5000 OR received = '1';
SELECT * FROM finances WHERE (value >= 1000 AND value <= 3000) OR value > 5000;  
SELECT * FROM finances WHERE (value > 400 AND value < 2000) OR value > 8000; 