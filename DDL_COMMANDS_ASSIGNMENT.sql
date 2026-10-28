-- Assignment of DDL Commands:
CREATE DATABASE company_training;
USE company_training;

CREATE TABLE departments (
	department_id INT NOT NULL,
    dept_name VARCHAR(80) NOT NULL,
    city VARCHAR(60)
);
INSERT INTO departments (department_id, dept_name, city) VALUES
	(101,'IT','Noida'),
    (102,'Sales','Delhi'),
    (103,'IT','Noida');
    
CREATE TABLE employees(
	employee_id INT NOT NULL,
    employee_name VARCHAR(100) NOT NULL,
    email VARCHAR(120),
    department_id INT NOT NULL,
    salary DECIMAL(10,2),
    status VARCHAR(20)
);
INSERT INTO employees(employee_id, employee_name, email, department_id, salary, status) VALUES
	(1,'Mani','manibhushan9205@gmail.com',101,40000,'ACTIVE'),
    (2,'Sahil','sahil9205@gmail.com',102,35000,'INACTIVE'),
    (3,'Mohit','Mohit9205@gmail.com',103,38000,'ACTIVE');
    
-- question of alter commands:
-- Add a PRIMARY KEY constraints on departments.department_id:
ALTER TABLE departments ADD PRIMARY KEY (department_id);

-- Add a PRIMARY KEY constraints on employees.employee_id:
ALTER TABLE employees ADD PRIMARY KEY (employee_id);

-- Add a new column name location of type VARCHAR(100) to the department table:
ALTER TABLE departments ADD COLUMN location VARCHAR(100);

-- Rename the column dept_name to department_name in the departments table, keeping its existing data type and NOT NULL REQUIREMENT.
ALTER TABLE departments CHANGE COLUMN dept_name department_name VARCHAR(80) NOT NULL;

-- Modify employees.salary to DECIMAL(12,2) AND ENSURE IT DOESN'T ALLOW NULL VALUES
ALTER TABLE employees MODIFY COLUMN salary DECIMAL(12,2) NOT NULL;

-- Set the default value of employees.status to ACTIVE:
ALTER TABLE employees MODIFY COLUMN status VARCHAR(20) DEFAULT('Active');

-- Add a Unique constraint on employees.email.
ALTER TABLE employees ADD CONSTRAINT unique_email UNIQUE(email);

-- Rename the employees table to staff:
RENAME TABLE employees to staff;

-- Add a FOREIGN KEY constraint on  staff.department_id referencing departments.department_id:
ALTER TABLE staff ADD CONSTRAINT fk_id FOREIGN KEY (department_id) REFERENCES departments(department_id);

-- Drop the Unique constraint added to the staff email:
ALTER TABLE staff DROP CONSTRAINT unique_email;

-- Drop the foreign key constraint created in the question 9:
ALTER TABLE staff DROP FOREIGN KEY fk_id;

-- Drop the PRIMARY KEY constraint from the staff table:
ALTER TABLE staff DROP PRIMARY KEY;

-- Add the PRIMARY KEY constraint back on the staff.employee_id:
ALTER TABLE staff ADD PRIMARY KEY(employee_id);

-- Drop the location column from the departments table:
ALTER TABLE departments DROP COLUMN location;

-- Rename the database from company_training to company_management by the following:
CREATE DATABASE company_management;
USE company_management;

RENAME TABLE company_training.departments TO company_management.departments2;
RENAME TABLE company_training.staff TO company_management.staff2;

DROP DATABASE IF EXISTS company_training;


