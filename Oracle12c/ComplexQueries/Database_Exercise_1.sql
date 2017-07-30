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
    salary NUMBER NOT NULL
);

CREATE TABLE employees (
    id NUMBER PRIMARY KEY,
    name VARCHAR2(70) DEFAULT '' NOT NULL,
    age NUMBER NOT NULL,
    role_id NUMBER NOT NULL,
    department_id NUMBER NOT NULL
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
ALTER TABLE employees ADD FOREIGN KEY (department_id) REFERENCES departments(id);
ALTER TABLE employees_benefits ADD FOREIGN KEY (employee_id) REFERENCES employees(id);
ALTER TABLE employees_benefits ADD FOREIGN KEY (benefit_id) REFERENCES benefits(id);

