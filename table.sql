CREATE TABLE employee (
    emp_id INT PRIMARY KEY,
    first_name VARCHAR(40),
    last_name VARCHAR(40),
    birth_day DATE,
    sex VARCHAR(1),
    salary INT,
    super_id INT,
    branch_id INT

);

-- 
CREATE TABLE branch(
    branch_id INT PRIMARY KEY,
    branch_name VARCHAR(40),
    mgr_id INT,
    mgr_start_date DATE,
    FOREIGN KEY(mgr_id) REFERENCES employee(emp_id) ON DELETE SET NULL

);

-- 
ALTER TABLE employee
ADD FOREIGN KEY(branch_id)
REFERENCES branch(branch_id)
ON DELETE SET NULL;

-- 
CREATE TABLE works_with(
    emp_id INT,
    client_id INT,
    total_sales INT,
    PRIMARY KEY(emp_id, client_id),
    FOREIGN KEY (emp_id) REFERENCES employee(emp_id) ON DELETE CASCADE,
    FOREIGN KEY (client_id) REFERENCES client(client_id) ON DELETE CASCADE
);

-- 
CREATE TABLE branch_supplier (
    branch_id INT,
    supplier_name VARCHAR(40),
    supplier_type VARCHAR(40),
    PRIMARY KEY (branch_id, supplier_name),
    FOREIGN KEY (branch_id) REFERENCES branch(branch_id) ON DELETE CASCADE
);

-- 
INSERT INTO employee VALUES (100, 'David', 'Wallace', '1967-11-17', 'M', 250000, NULL, NULL);


-- 
UPDATE employee SET branch_id = 1 WHERE emp_id = 100;

-- 
INSERT INTO employee VALUES (101, 'Jan', 'Levinson', '1961-05-11', 'F', 110000, 100, 1);

-- 
INSERT INTO employee VALUES (102, 'Micheal', 'Scott', '1964-03-15', 'M', 75000, 100, 2);


-- 
INSERT INTO branch VALUES (2, 'Scranton', 102, '1992-04-06');

-- 
INSERT INTO employee VALUES (103, 'Angela', 'Martin', '1971-06-25', 'F', 63000, 102, 2);
INSERT INTO employee VALUES (104, 'Kelly', 'Kapoor', '1980-02-05', 'F', 55000, 102, 2);
INSERT INTO employee VALUES (105, 'Stanley', 'Hudson', '1958-02-19', 'M', 69000, 102, 2);
INSERT INTO employee VALUES (106, 'Josh', 'Porter', '1969-09-05', 'M', 78000, 100, 3);


-- SELECT
SELECT * FROM employee;
SELECT * FROM employee ORDER BY salary;
SELECT * FROM employee ORDER BY salary DESC;
SELECT * FROM employee ORDER BY sex, first_name, last_name DESC;
SELECT * FROM employee ORDER BY sex, first_name, last_name DESC LIMIT 4;
SELECT * FROM employee WHERE sex = 'M' ORDER BY sex, first_name, last_name DESC LIMIT 2 ;
SELECT first_name AS forename, last_name AS surname FROM employee  ;
SELECT DISTINCT sex FROM employee;

