CREATE TABLE departments (
dept_no varchar(4) PRIMARY KEY,
dept_name varchar(20)
);

SELECT *
FROM departments;

CREATE TABLE titles (
title_id varchar(5) PRIMARY KEY,
title varchar(20)
);

SELECT *
FROM titles;

CREATE TABLE employees (
emp_no int PRIMARY KEY,
emp_title_id varchar(5),
birth_date date,
first_name varchar(50),
last_name varchar(50),
sex char(1),
hire_date date,
FOREIGN KEY (emp_title_id) REFERENCES titles(title_id),
CHECK (sex IN ('M', 'F'))
);

SELECT *
FROM employees
LIMIT 50;

--Each employee works in one or more than one department
CREATE TABLE dept_emp (
emp_no int NOT NULL,
dept_no varchar(4) NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
PRIMARY KEY (emp_no, dept_no)
);

SELECT *
FROM dept_emp
LIMIT 50;

CREATE TABLE dept_manager (
dept_no varchar(4) NOT NULL,
emp_no int NOT NULL,
FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
PRIMARY KEY (dept_no, emp_no)
);

SELECT *
FROM dept_manager
LIMIT 50;

-- I would add 'salary' column to 'employees' table 
-- because the relationship between 'employees' and 'salaries' is 1 to 1
-- But I fallow the instructions and create 'salaries' table separately.

--Each employee gets one salary even if works in more than one department
CREATE TABLE salaries (
emp_no int NOT NULL,
salary int NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
PRIMARY KEY (emp_no, salary)
);

SELECT *
FROM salaries
LIMIT 50;
