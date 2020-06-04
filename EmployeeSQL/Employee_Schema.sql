-- Create tables
-- TIP: When importing csv data, import NON dependent tables first

CREATE TABLE IF NOT EXISTS Employees
(
    emp_no INTEGER NOT NULL,
    birth_date DATE NOT NULL,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    gender VARCHAR(5) NOT NULL,
    hire_date DATE NOT NULL,
    PRIMARY KEY(emp_no)
);

CREATE TABLE IF NOT EXISTS Departments
(
    dept_no VARCHAR(10) NOT NULL,
    dept_name VARCHAR(30) NOT NULL,
    PRIMARY KEY(dept_no)
);

CREATE TABLE IF NOT EXISTS Salaries
(
    emp_no INTEGER NOT NULL,
    salary INTEGER NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
    PRIMARY KEY(emp_no),
	FOREIGN KEY(emp_no) REFERENCES Employees(emp_no)
);

-- Note, when importing titles.csv into Titles table using pgAdmin, you will need
-- to UNSELECT the id (primary key) column in the columns tab.  Not doing so
-- will cause an error
CREATE TABLE IF NOT EXISTS Titles
(
    id SERIAL PRIMARY KEY,
    emp_no INTEGER NOT NULL,
    title VARCHAR(30) NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE,
    FOREIGN KEY(emp_no) REFERENCES Employees(emp_no)
);


CREATE TABLE IF NOT EXISTS dept_emp
(
    emp_no INTEGER NOT NULL,
    dept_no VARCHAR(10) NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES Employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES Departments(dept_no),
	PRIMARY KEY(emp_no, dept_no)
);

CREATE TABLE IF NOT EXISTS dept_manager
(
    dept_no VARCHAR(10) NOT NULL,
    emp_no INTEGER NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES Departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES Employees(emp_no),
    PRIMARY KEY(emp_no, dept_no)
);
