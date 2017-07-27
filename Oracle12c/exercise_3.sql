# Exercise 3: Commands with tables

# Obs. A: for descrive a specific table, use the commands desc or describe, for exemple:
DESCRIBE finances;
DESC finances;

# Obs. B: use the command 'IS NULL' to find elements with value is null, for exemple:
SELECT * FROM finances WHERE observation IS NULL;