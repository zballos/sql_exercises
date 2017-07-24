# Oracle 12c
# Before all, initialize with the command 'sqlplus' for entry in Oracle Database.

# Create a table 'finances' with attributes: value, my_date, observation and received.
create table finances (value, my_date, observation, received);

# But they need the respective types.
create table finances (value number, my_date date, observation varchar2(30), received char);

# The attribute received needs a verification because he receive a boolean value (0 or 1), so:
create table finances (value number, my_date date, observation varchar2(30), received char check (received in (0, 1)));

# Now, we need inform a unique key, that will be receive sequencial numbers:
create table finances (
	id number primary key,
	value number,
	my_date date,
	observation varchar2(30),
	received char check (received in (0, 1))
);

# For create sequence numbers, we need execute the command below (default value is 0):
create sequence id_seq;

# When create new values in table finances, insert the value id_seq.nextval. 