-- format tables, arguments, default, etc...

-- For see describe of table purchases:
sp_help purchases;

-- 1.
INSERT INTO purchases (value, purchase_date, received)
VALUES (300, '2009-10-12', 1);

SELECT * FROM purchases;

-- ops, was inserted one purchase with observations equals null. We need to change this!
-- first
DELETE FROM purchases WHERE observations IS NULL;

-- after
ALTER TABLE purchases ALTER COLUMN observations NVARCHAR(400) NOT NULL;

-- Now, this code return one error
INSERT INTO purchases (value, purchase_date, received)
VALUES (300, '2009-10-12', 1);

/*
    Mensagem 515, Nível 16, Estado 2, Linha 5
    Não é possível inserir o valor NULL na coluna 'observations', tabela 'purchasing_control.dbo.purchases'; a coluna não permite nulos. Falha em INSERT.
*/

-- So, insert with observations
INSERT INTO purchases (value, purchase_date, observations, received)
VALUES (300, '2009-10-12', 'Compra do dia das crianças', 1);

-- 2. set default 0 in received
ALTER TABLE purchases ADD DEFAULT '0' FOR received;

INSERT INTO purchases (value, purchase_date, observations)
VALUES (450.0, '2010-12-01', 'COMPRA DO MÊS');