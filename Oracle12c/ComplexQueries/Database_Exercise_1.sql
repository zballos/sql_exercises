-- Delete all tables, if exists
DROP TABLE companies_departments;
DROP TABLE employees_benefits;
DROP TABLE companies;
DROP TABLE employees;
DROP TABLE roles;
DROP TABLE departments;
DROP TABLE benefits;

-- Create tables
CREATE TABLE companies (
    id NUMBER PRIMARY KEY,
    name VARCHAR2(30) DEFAULT '' NOT NULL
);

CREATE TABLE departments (
    id NUMBER PRIMARY KEY,
    name VARCHAR2(20) DEFAULT '' NOT NULL
);

CREATE TABLE companies_departments (
    id NUMBER PRIMARY KEY,
    company_id NUMBER NOT NULL,
    department_id NUMBER NOT NULL,
    active CHAR DEFAULT '1' CHECK (active in ('0', '1'))
);

CREATE TABLE roles (
    id NUMBER PRIMARY KEY,
    name VARCHAR2(30) NOT NULL,
    salary NUMBER NOT NULL,
    department_id NUMBER NOT NULL
);

CREATE TABLE employees (
    id NUMBER PRIMARY KEY,
    name VARCHAR2(70) DEFAULT '' NOT NULL,
    age NUMBER NOT NULL,
    role_id NUMBER NOT NULL,
    company_id NUMBER NOT NULL
);

CREATE TABLE benefits (
    id NUMBER PRIMARY KEY,
    name VARCHAR2(70) DEFAULT '' NOT NULL
);

CREATE TABLE employees_benefits (
    id NUMBER PRIMARY KEY,
    employee_id NUMBER NOT NULL,
    benefit_id NUMBER NOT NULL,
    benefit_value NUMBER NOT NULL,
    received_date DATE NULL
);

-- Create all sequence of ids
CREATE SEQUENCE id_company_seq;
CREATE SEQUENCE id_departments_seq;
CREATE SEQUENCE id_companies_departments_seq;
CREATE SEQUENCE id_roles_seq;
CREATE SEQUENCE id_employees_seq;
CREATE SEQUENCE id_benefits_seq;
CREATE SEQUENCE id_employees_benefits_seq;

-- Create all foreign keys
ALTER TABLE companies_departments ADD FOREIGN KEY (company_id) REFERENCES companies(id);
ALTER TABLE companies_departments ADD FOREIGN KEY (department_id) REFERENCES departments(id);
ALTER TABLE employees ADD FOREIGN KEY (role_id) REFERENCES roles(id);
ALTER TABLE employees ADD FOREIGN KEY (company_id) REFERENCES companies(id);
ALTER TABLE roles ADD FOREIGN KEY (department_id) REFERENCES departments(id);
ALTER TABLE employees_benefits ADD FOREIGN KEY (employee_id) REFERENCES employees(id);
ALTER TABLE employees_benefits ADD FOREIGN KEY (benefit_id) REFERENCES benefits(id);

-- Insert all values:
-- Departments
insert into departments (id, name) values (1, 'Financial');
insert into departments (id, name) values (2, 'TI');
insert into departments (id, name) values (3, 'Human Resources');

-- roles
insert into roles (id, name, salary, department_id) values (1, 'System Analist', 4000.0, 2);
insert into roles (id, name, salary, department_id) values (2, 'Software Developer', 2300.0, 2);
insert into roles (id, name, salary, department_id) values (3, 'Software Engeneer', 4500.0, 2);
insert into roles (id, name, salary, department_id) values (4, 'Administrative Assistant', 1800.0, 1);
insert into roles (id, name, salary, department_id) values (5, 'IT Manager', 5200.0, 2);
insert into roles (id, name, salary, department_id) values (6, 'Project Manager', 5000.0, 2);
insert into roles (id, name, salary, department_id) values (7, 'Financial Manager', 4800.0, 1);
insert into roles (id, name, salary, department_id) values (8, 'Accountant', 7500.0, 1);
insert into roles (id, name, salary, department_id) values (9, 'Human Resources Analyst', 3900.0, 3);
insert into roles (id, name, salary, department_id) values (10, 'Intern', 900.0, 2);

-- benefits
insert into benefits (id, name) values (1, 'Overtime');
insert into benefits (id, name) values (2, 'Food stamps');
insert into benefits (id, name) values (3, 'Transportation Vouchers');
insert into benefits (id, name) values (4, 'Health Insurence');
insert into benefits (id, name) values (5, 'Trainings, courses or congresses');

-- companies
INSERT INTO companies (id,name) VALUES (1,'Mauris Sapien Cursus Limited');
INSERT INTO companies (id,name) VALUES (2,'Risus Limited');
INSERT INTO companies (id,name) VALUES (3,'Sociis Natoque Penatibus PC');
INSERT INTO companies (id,name) VALUES (4,'Diam At Pretium Ltd');
INSERT INTO companies (id,name) VALUES (5,'Lacus Pede Incorporated');
INSERT INTO companies (id,name) VALUES (6,'Imperdiet Corporation');
INSERT INTO companies (id,name) VALUES (7,'Nec LLC');
INSERT INTO companies (id,name) VALUES (8,'Congue A LLP');
INSERT INTO companies (id,name) VALUES (9,'Posuere Industries');
INSERT INTO companies (id,name) VALUES (10,'Augue Limited');

-- companies_departments
INSERT INTO companies_departments (id,company_id,department_id,active) VALUES (1,1,1,1);
INSERT INTO companies_departments (id,company_id,department_id,active) VALUES (2,1,2,1);
INSERT INTO companies_departments (id,company_id,department_id,active) VALUES (3,1,3,1);
INSERT INTO companies_departments (id,company_id,department_id,active) VALUES (4,2,1,1);
INSERT INTO companies_departments (id,company_id,department_id,active) VALUES (5,2,2,1);
INSERT INTO companies_departments (id,company_id,department_id,active) VALUES (6,2,3,1);
INSERT INTO companies_departments (id,company_id,department_id,active) VALUES (7,3,1,1);
INSERT INTO companies_departments (id,company_id,department_id,active) VALUES (8,3,2,0);
INSERT INTO companies_departments (id,company_id,department_id,active) VALUES (9,3,3,1);
INSERT INTO companies_departments (id,company_id,department_id,active) VALUES (10,4,1,1);
INSERT INTO companies_departments (id,company_id,department_id,active) VALUES (11,4,2,1);
INSERT INTO companies_departments (id,company_id,department_id,active) VALUES (12,4,3,1);
INSERT INTO companies_departments (id,company_id,department_id,active) VALUES (13,5,1,1);
INSERT INTO companies_departments (id,company_id,department_id,active) VALUES (14,5,2,1);
INSERT INTO companies_departments (id,company_id,department_id,active) VALUES (15,5,3,1);
INSERT INTO companies_departments (id,company_id,department_id,active) VALUES (16,6,1,1);
INSERT INTO companies_departments (id,company_id,department_id,active) VALUES (17,6,2,1);
INSERT INTO companies_departments (id,company_id,department_id,active) VALUES (18,6,3,1);
INSERT INTO companies_departments (id,company_id,department_id,active) VALUES (19,7,1,1);
INSERT INTO companies_departments (id,company_id,department_id,active) VALUES (20,7,2,1);
INSERT INTO companies_departments (id,company_id,department_id,active) VALUES (21,7,3,1);
INSERT INTO companies_departments (id,company_id,department_id,active) VALUES (22,8,1,1);
INSERT INTO companies_departments (id,company_id,department_id,active) VALUES (23,8,2,1);
INSERT INTO companies_departments (id,company_id,department_id,active) VALUES (24,8,3,1);
INSERT INTO companies_departments (id,company_id,department_id,active) VALUES (25,9,1,1);
INSERT INTO companies_departments (id,company_id,department_id,active) VALUES (26,9,2,1);
INSERT INTO companies_departments (id,company_id,department_id,active) VALUES (27,9,3,1);
INSERT INTO companies_departments (id,company_id,department_id,active) VALUES (28,10,1,1);
INSERT INTO companies_departments (id,company_id,department_id,active) VALUES (29,10,2,1);
INSERT INTO companies_departments (id,company_id,department_id,active) VALUES (30,10,3,1);

-- employees
INSERT INTO employees (id, name, age, role_id, company_id) VALUES (1,'Devin B. Morrow',27,1, 1);
INSERT INTO employees (id, name, age, role_id, company_id) VALUES (2,'Clark G. Barlow',37,1, 2);
INSERT INTO employees (id, name, age, role_id, company_id) VALUES (3,'Cameron V. Wade',21,1, 3);
INSERT INTO employees (id, name, age, role_id, company_id) VALUES (4,'Mannix O. Wheeler',28,1, 4);
INSERT INTO employees (id, name, age, role_id, company_id) VALUES (5,'Hyacinth Q. Moses',36,1, 5);
INSERT INTO employees (id, name, age, role_id, company_id) VALUES (6,'Kristen X. Petersen',21,1, 6);
INSERT INTO employees (id, name, age, role_id, company_id) VALUES (7,'Dana R. Skinner',19,3, 7);
INSERT INTO employees (id, name, age, role_id, company_id) VALUES (8,'Chancellor T. Camacho',23,3, 8);
INSERT INTO employees (id, name, age, role_id, company_id) VALUES (9,'Britanney E. Callahan',30,3, 9);
INSERT INTO employees (id, name, age, role_id, company_id) VALUES (10,'Ryan M. Wilkinson',39,5, 10);
INSERT INTO employees (id, name, age, role_id, company_id) VALUES (11,'Cody D. Graham',39,5, 1);
INSERT INTO employees (id, name, age, role_id, company_id) VALUES (12,'Veronica T. Hancock',26,5, 2);
INSERT INTO employees (id, name, age, role_id, company_id) VALUES (13,'Carson C. Elliott',25,6, 3);
INSERT INTO employees (id, name, age, role_id, company_id) VALUES (14,'Justin U. Ward',23,6, 4);
INSERT INTO employees (id, name, age, role_id, company_id) VALUES (15,'Russell V. Banks',29,6, 5);
INSERT INTO employees (id, name, age, role_id, company_id) VALUES (16,'Mari R. English',36,10, 6);
INSERT INTO employees (id, name, age, role_id, company_id) VALUES (17,'Giacomo G. Padilla',41,10, 7);
INSERT INTO employees (id, name, age, role_id, company_id) VALUES (18,'Andrew L. Kennedy',24,4, 8);
INSERT INTO employees (id, name, age, role_id, company_id) VALUES (19,'Tamara N. Gates',24,4, 9);
INSERT INTO employees (id, name, age, role_id, company_id) VALUES (20,'Risa W. Jenkins',30,4, 10);
INSERT INTO employees (id, name, age, role_id, company_id) VALUES (21,'Leigh C. Pitts',30,7, 1);
INSERT INTO employees (id, name, age, role_id, company_id) VALUES (22,'Jonas O. Mcpherson',28,7, 2);
INSERT INTO employees (id, name, age, role_id, company_id) VALUES (23,'Charity J. Wall',29,7, 3);
INSERT INTO employees (id, name, age, role_id, company_id) VALUES (24,'Abigail O. Atkins',40,8, 4);
INSERT INTO employees (id, name, age, role_id, company_id) VALUES (25,'Lilah D. Taylor',19,8, 5);
INSERT INTO employees (id, name, age, role_id, company_id) VALUES (26,'Peter N. Sheppard',26,8, 6);
INSERT INTO employees (id, name, age, role_id, company_id) VALUES (27,'Randall T. Graham',42,4, 7);
INSERT INTO employees (id, name, age, role_id, company_id) VALUES (28,'Maxwell E. Moon',33,4, 8);
INSERT INTO employees (id, name, age, role_id, company_id) VALUES (29,'Zephania H. Owens',31,4, 9);
INSERT INTO employees (id, name, age, role_id, company_id) VALUES (30,'Leilani J. Shields',42,9, 10);
INSERT INTO employees (id, name, age, role_id, company_id) VALUES (31,'Karina D. Fowler',34,9, 1);
INSERT INTO employees (id, name, age, role_id, company_id) VALUES (32,'Miriam V. Bryant',38,9, 2);
INSERT INTO employees (id, name, age, role_id, company_id) VALUES (33,'Lois I. Cruz',19,10, 3);
INSERT INTO employees (id, name, age, role_id, company_id) VALUES (34,'Paki I. Duke',24,10, 4);
INSERT INTO employees (id, name, age, role_id, company_id) VALUES (35,'Buckminster E. Jarvis',23,10, 5);

-- employees_benefits
insert into employees_benefits (id, employee_id, benefit_id, benefit_value, received_date) values (1, 10, 1, 400.0, '05-JAN-2017');
insert into employees_benefits (id, employee_id, benefit_id, benefit_value, received_date) values (2, 10, 1, 200.0, '05-FEV-2017');
insert into employees_benefits (id, employee_id, benefit_id, benefit_value, received_date) values (3, 10, 1, 320.0, '05-MAR-2017');
insert into employees_benefits (id, employee_id, benefit_id, benefit_value, received_date) values (4, 10, 1, 10.0, '05-ABR-2017');
insert into employees_benefits (id, employee_id, benefit_id, benefit_value, received_date) values (5, 16, 1, 210.0, '05-JAN-2017');
insert into employees_benefits (id, employee_id, benefit_id, benefit_value, received_date) values (6, 17, 1, 100.0, '05-FEV-2017');
insert into employees_benefits (id, employee_id, benefit_id, benefit_value, received_date) values (7, 15, 1, 120.0, '05-MAR-2017');
insert into employees_benefits (id, employee_id, benefit_id, benefit_value, received_date) values (8, 11, 1, 150.0, '05-ABR-2017');
insert into employees_benefits (id, employee_id, benefit_id, benefit_value, received_date) values (9, 21, 1, 400.0, '05-JAN-2017');
insert into employees_benefits (id, employee_id, benefit_id, benefit_value, received_date) values (10, 19, 1, 200.0, '05-FEV-2017');
insert into employees_benefits (id, employee_id, benefit_id, benefit_value, received_date) values (11, 1, 1, 320.0, '05-MAR-2017');
insert into employees_benefits (id, employee_id, benefit_id, benefit_value, received_date) values (12, 2, 1, 10.0, '05-ABR-2017');
insert into employees_benefits (id, employee_id, benefit_id, benefit_value, received_date) values (13, 4, 1, 210.0, '05-JAN-2017');
insert into employees_benefits (id, employee_id, benefit_id, benefit_value, received_date) values (14, 23, 1, 100.0, '05-FEV-2017');
insert into employees_benefits (id, employee_id, benefit_id, benefit_value, received_date) values (15, 34, 1, 120.0, '05-MAR-2017');
insert into employees_benefits (id, employee_id, benefit_id, benefit_value, received_date) values (16, 32, 1, 150.0, '05-ABR-2017');
INSERT INTO employees_benefits (id, employee_id, benefit_id, benefit_value, received_date) VALUES (17,14,2,271.24,'25-FEV-17');
INSERT INTO employees_benefits (id, employee_id, benefit_id, benefit_value, received_date) VALUES (18,28,4,193.45,'28-NOV-16');
INSERT INTO employees_benefits (id, employee_id, benefit_id, benefit_value, received_date) VALUES (19,23,4,38.17,'03-AGO-16');
INSERT INTO employees_benefits (id, employee_id, benefit_id, benefit_value, received_date) VALUES (20,32,4,441.49,'12-DEZ-16');
INSERT INTO employees_benefits (id, employee_id, benefit_id, benefit_value, received_date) VALUES (21,3,2,427.89,'25-JUL-17');
INSERT INTO employees_benefits (id, employee_id, benefit_id, benefit_value, received_date) VALUES (22,3,1,322.12,'18-FEV-17');
INSERT INTO employees_benefits (id, employee_id, benefit_id, benefit_value, received_date) VALUES (23,11,2,411.46,'24-NOV-16');
INSERT INTO employees_benefits (id, employee_id, benefit_id, benefit_value, received_date) VALUES (24,35,4,438.30,'23-OUT-16');
INSERT INTO employees_benefits (id, employee_id, benefit_id, benefit_value, received_date) VALUES (25,24,5,443.80,'15-DEZ-16');
INSERT INTO employees_benefits (id, employee_id, benefit_id, benefit_value, received_date) VALUES (26,23,4,181.27,'09-MAI-17');
INSERT INTO employees_benefits (id, employee_id, benefit_id, benefit_value, received_date) VALUES (27,29,4,232.24,'06-DEZ-16');
INSERT INTO employees_benefits (id, employee_id, benefit_id, benefit_value, received_date) VALUES (28,13,3,490.96,'10-JUL-17');
INSERT INTO employees_benefits (id, employee_id, benefit_id, benefit_value, received_date) VALUES (29,6,2,121.79,'02-DEZ-16');
INSERT INTO employees_benefits (id, employee_id, benefit_id, benefit_value, received_date) VALUES (30,18,4,485.01,'03-NOV-16');
INSERT INTO employees_benefits (id, employee_id, benefit_id, benefit_value, received_date) VALUES (31,22,4,122.69,'03-OUT-16');
INSERT INTO employees_benefits (id, employee_id, benefit_id, benefit_value, received_date) VALUES (32,29,5,120.40,'05-AGO-16');
INSERT INTO employees_benefits (id, employee_id, benefit_id, benefit_value, received_date) VALUES (33,1,3,243.97,'17-JUN-17');
INSERT INTO employees_benefits (id, employee_id, benefit_id, benefit_value, received_date) VALUES (34,16,2,457.00,'05-MAI-17');
INSERT INTO employees_benefits (id, employee_id, benefit_id, benefit_value, received_date) VALUES (35,8,5,106.53,'30-JUL-16');
INSERT INTO employees_benefits (id, employee_id, benefit_id, benefit_value, received_date) VALUES (36,17,3,124.99,'30-AGO-16');
INSERT INTO employees_benefits (id, employee_id, benefit_id, benefit_value, received_date) VALUES (37,21,3,367.34,'25-NOV-16');
INSERT INTO employees_benefits (id, employee_id, benefit_id, benefit_value, received_date) VALUES (38,7,3,330.74,'08-ABR-17');
INSERT INTO employees_benefits (id, employee_id, benefit_id, benefit_value, received_date) VALUES (39,4,4,111.73,'31-DEZ-16');
INSERT INTO employees_benefits (id, employee_id, benefit_id, benefit_value, received_date) VALUES (40,19,4,496.80,'13-DEZ-16');
INSERT INTO employees_benefits (id, employee_id, benefit_id, benefit_value, received_date) VALUES (41,23,5,181.53,'12-MAR-17');
INSERT INTO employees_benefits (id, employee_id, benefit_id, benefit_value, received_date) VALUES (42,29,5,295.05,'16-FEV-17');
INSERT INTO employees_benefits (id, employee_id, benefit_id, benefit_value, received_date) VALUES (43,13,3,80.00,'24-JAN-17');
INSERT INTO employees_benefits (id, employee_id, benefit_id, benefit_value, received_date) VALUES (44,16,3,364.12,'10-DEZ-16');
INSERT INTO employees_benefits (id, employee_id, benefit_id, benefit_value, received_date) VALUES (45,29,5,81.31,'09-DEZ-16');
INSERT INTO employees_benefits (id, employee_id, benefit_id, benefit_value, received_date) VALUES (46,32,2,417.62,'03-NOV-16');
INSERT INTO employees_benefits (id, employee_id, benefit_id, benefit_value, received_date) VALUES (47,10,1,301.66,'15-MAI-17');
INSERT INTO employees_benefits (id, employee_id, benefit_id, benefit_value, received_date) VALUES (48,32,5,153.22,'16-JUL-17');
INSERT INTO employees_benefits (id, employee_id, benefit_id, benefit_value, received_date) VALUES (49,6,3,418.06,'24-AGO-16');
INSERT INTO employees_benefits (id, employee_id, benefit_id, benefit_value, received_date) VALUES (50,28,4,111.41,'14-JUN-17');
INSERT INTO employees_benefits (id, employee_id, benefit_id, benefit_value, received_date) VALUES (51,30,4,339.70,'28-MAR-17');
INSERT INTO employees_benefits (id, employee_id, benefit_id, benefit_value, received_date) VALUES (52,22,1,370.99,'13-ABR-17');
INSERT INTO employees_benefits (id, employee_id, benefit_id, benefit_value, received_date) VALUES (53,34,1,200.14,'12-ABR-17');
INSERT INTO employees_benefits (id, employee_id, benefit_id, benefit_value, received_date) VALUES (54,22,3,365.07,'08-DEZ-16');
INSERT INTO employees_benefits (id, employee_id, benefit_id, benefit_value, received_date) VALUES (55,17,4,39.53,'20-ABR-17');
INSERT INTO employees_benefits (id, employee_id, benefit_id, benefit_value, received_date) VALUES (56,29,1,70.96,'06-SET-16');
INSERT INTO employees_benefits (id, employee_id, benefit_id, benefit_value, received_date) VALUES (57,19,5,166.02,'13-OUT-16');
INSERT INTO employees_benefits (id, employee_id, benefit_id, benefit_value, received_date) VALUES (58,31,3,253.22,'03-MAI-17');
INSERT INTO employees_benefits (id, employee_id, benefit_id, benefit_value, received_date) VALUES (59,14,5,88.41,'27-SET-16');
INSERT INTO employees_benefits (id, employee_id, benefit_id, benefit_value, received_date) VALUES (60,15,4,439.69,'26-FEV-17');
INSERT INTO employees_benefits (id, employee_id, benefit_id, benefit_value, received_date) VALUES (61,22,3,206.62,'19-NOV-16');
INSERT INTO employees_benefits (id, employee_id, benefit_id, benefit_value, received_date) VALUES (62,5,1,433.22,'26-SET-16');
INSERT INTO employees_benefits (id, employee_id, benefit_id, benefit_value, received_date) VALUES (63,13,1,439.29,'15-JAN-17');
INSERT INTO employees_benefits (id, employee_id, benefit_id, benefit_value, received_date) VALUES (64,32,1,82.87,'01-JUL-17');
INSERT INTO employees_benefits (id, employee_id, benefit_id, benefit_value, received_date) VALUES (65,3,5,70.58,'28-JUL-17');
INSERT INTO employees_benefits (id, employee_id, benefit_id, benefit_value, received_date) VALUES (66,7,5,390.31,'02-AGO-16');
INSERT INTO employees_benefits (id, employee_id, benefit_id, benefit_value, received_date) VALUES (67,18,3,86.21,'08-SET-16');
INSERT INTO employees_benefits (id, employee_id, benefit_id, benefit_value, received_date) VALUES (68,27,3,450.78,'14-JAN-17');
INSERT INTO employees_benefits (id, employee_id, benefit_id, benefit_value, received_date) VALUES (69,13,4,21.30,'13-ABR-17');
INSERT INTO employees_benefits (id, employee_id, benefit_id, benefit_value, received_date) VALUES (70,28,5,184.48,'09-DEZ-16');
INSERT INTO employees_benefits (id, employee_id, benefit_id, benefit_value, received_date) VALUES (71,3,2,354.95,'15-DEZ-16');
INSERT INTO employees_benefits (id, employee_id, benefit_id, benefit_value, received_date) VALUES (72,11,3,423.72,'31-JAN-17');
INSERT INTO employees_benefits (id, employee_id, benefit_id, benefit_value, received_date) VALUES (73,26,5,303.40,'14-JUN-17');
INSERT INTO employees_benefits (id, employee_id, benefit_id, benefit_value, received_date) VALUES (74,24,2,17.97,'31-OUT-16');
INSERT INTO employees_benefits (id, employee_id, benefit_id, benefit_value, received_date) VALUES (75,8,2,455.41,'09-SET-16');
INSERT INTO employees_benefits (id, employee_id, benefit_id, benefit_value, received_date) VALUES (76,19,5,313.39,'04-MAR-17');
INSERT INTO employees_benefits (id, employee_id, benefit_id, benefit_value, received_date) VALUES (77,9,5,307.80,'13-FEV-17');
INSERT INTO employees_benefits (id, employee_id, benefit_id, benefit_value, received_date) VALUES (78,17,4,417.71,'30-DEZ-16');
INSERT INTO employees_benefits (id, employee_id, benefit_id, benefit_value, received_date) VALUES (79,7,1,257.65,'31-OUT-16');
INSERT INTO employees_benefits (id, employee_id, benefit_id, benefit_value, received_date) VALUES (80,18,2,229.62,'23-NOV-16');
INSERT INTO employees_benefits (id, employee_id, benefit_id, benefit_value, received_date) VALUES (81,24,1,447.18,'05-DEZ-16');
INSERT INTO employees_benefits (id, employee_id, benefit_id, benefit_value, received_date) VALUES (82,11,1,112.70,'07-AGO-16');
INSERT INTO employees_benefits (id, employee_id, benefit_id, benefit_value, received_date) VALUES (83,16,4,439.89,'03-FEV-17');
INSERT INTO employees_benefits (id, employee_id, benefit_id, benefit_value, received_date) VALUES (84,26,1,434.17,'04-JUN-17');
INSERT INTO employees_benefits (id, employee_id, benefit_id, benefit_value, received_date) VALUES (85,20,3,231.31,'15-DEZ-16');
INSERT INTO employees_benefits (id, employee_id, benefit_id, benefit_value, received_date) VALUES (86,13,4,389.34,'08-JUL-17');
INSERT INTO employees_benefits (id, employee_id, benefit_id, benefit_value, received_date) VALUES (87,25,3,110.84,'18-FEV-17');
INSERT INTO employees_benefits (id, employee_id, benefit_id, benefit_value, received_date) VALUES (88,9,2,276.23,'22-AGO-16');
INSERT INTO employees_benefits (id, employee_id, benefit_id, benefit_value, received_date) VALUES (89,24,5,239.09,'21-MAI-17');
INSERT INTO employees_benefits (id, employee_id, benefit_id, benefit_value, received_date) VALUES (90,12,1,333.97,'13-SET-16');
INSERT INTO employees_benefits (id, employee_id, benefit_id, benefit_value, received_date) VALUES (91,7,3,184.12,'25-FEV-17');
INSERT INTO employees_benefits (id, employee_id, benefit_id, benefit_value, received_date) VALUES (92,25,2,420.00,'26-DEZ-16');
INSERT INTO employees_benefits (id, employee_id, benefit_id, benefit_value, received_date) VALUES (93,11,4,409.95,'21-NOV-16');
INSERT INTO employees_benefits (id, employee_id, benefit_id, benefit_value, received_date) VALUES (94,11,5,181.72,'07-SET-16');
INSERT INTO employees_benefits (id, employee_id, benefit_id, benefit_value, received_date) VALUES (95,15,2,48.31,'12-MAR-17');
INSERT INTO employees_benefits (id, employee_id, benefit_id, benefit_value, received_date) VALUES (96,11,5,294.31,'17-SET-16');
INSERT INTO employees_benefits (id, employee_id, benefit_id, benefit_value, received_date) VALUES (97,27,2,212.37,'10-NOV-16');
INSERT INTO employees_benefits (id, employee_id, benefit_id, benefit_value, received_date) VALUES (98,4,5,402.09,'29-ABR-17');
INSERT INTO employees_benefits (id, employee_id, benefit_id, benefit_value, received_date) VALUES (99,7,4,295.97,'18-DEZ-16');
INSERT INTO employees_benefits (id, employee_id, benefit_id, benefit_value, received_date) VALUES (100,20,4,434.70,'11-JAN-17');
INSERT INTO employees_benefits (id, employee_id, benefit_id, benefit_value, received_date) VALUES (101,10,1,236.47,'29-OUT-16');
INSERT INTO employees_benefits (id, employee_id, benefit_id, benefit_value, received_date) VALUES (102,24,3,171.03,'19-AGO-16');
INSERT INTO employees_benefits (id, employee_id, benefit_id, benefit_value, received_date) VALUES (103,9,1,175.88,'12-NOV-16');
INSERT INTO employees_benefits (id, employee_id, benefit_id, benefit_value, received_date) VALUES (104,2,3,320.40,'05-SET-16');
INSERT INTO employees_benefits (id, employee_id, benefit_id, benefit_value, received_date) VALUES (105,15,1,196.37,'15-SET-16');
INSERT INTO employees_benefits (id, employee_id, benefit_id, benefit_value, received_date) VALUES (106,1,1,467.16,'23-ABR-17');
INSERT INTO employees_benefits (id, employee_id, benefit_id, benefit_value, received_date) VALUES (107,12,2,125.01,'08-JAN-17');
INSERT INTO employees_benefits (id, employee_id, benefit_id, benefit_value, received_date) VALUES (108,35,2,360.57,'13-MAR-17');
INSERT INTO employees_benefits (id, employee_id, benefit_id, benefit_value, received_date) VALUES (109,8,4,159.39,'24-SET-16');
INSERT INTO employees_benefits (id, employee_id, benefit_id, benefit_value, received_date) VALUES (110,12,1,417.28,'10-JUL-17');
INSERT INTO employees_benefits (id, employee_id, benefit_id, benefit_value, received_date) VALUES (111,31,4,441.92,'15-OUT-16');
INSERT INTO employees_benefits (id, employee_id, benefit_id, benefit_value, received_date) VALUES (112,18,4,321.79,'06-MAI-17');
INSERT INTO employees_benefits (id, employee_id, benefit_id, benefit_value, received_date) VALUES (113,32,2,285.48,'31-JAN-17');
INSERT INTO employees_benefits (id, employee_id, benefit_id, benefit_value, received_date) VALUES (114,2,4,251.62,'04-JAN-17');
INSERT INTO employees_benefits (id, employee_id, benefit_id, benefit_value, received_date) VALUES (115,19,1,291.54,'01-MAI-17');
INSERT INTO employees_benefits (id, employee_id, benefit_id, benefit_value, received_date) VALUES (116,10,1,495.94,'22-JUL-17');
