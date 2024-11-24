-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


-- Departments table
CREATE TABLE "Departments" (
    "dept_no" VARCHAR(255) NOT NULL,
    "dept_name" VARCHAR(255) NOT NULL,
    PRIMARY KEY ("dept_no")
);

-- Titles table
CREATE TABLE "Titles" (
    "title_id" VARCHAR(255) NOT NULL,
    "title" VARCHAR(255) NOT NULL,
    PRIMARY KEY ("title_id")
);

-- Employees table
CREATE TABLE "Employees" (
    "emp_no" INT NOT NULL,
    "emp_title_id" VARCHAR(255) NOT NULL,
    "birth_date" DATE NOT NULL,
    "first_name" VARCHAR(255) NOT NULL,
    "last_name" VARCHAR(255) NOT NULL,
    "sex" VARCHAR(255) NOT NULL,
    "hire_date" DATE NOT NULL,
    PRIMARY KEY ("emp_no"),
    FOREIGN KEY ("emp_title_id") REFERENCES "Titles"("title_id")
);

-- Dept_Employee table
CREATE TABLE "Dept_Employee" (
    "emp_no" INT NOT NULL,
    "dept_no" VARCHAR(255) NOT NULL,
    PRIMARY KEY ("emp_no", "dept_no"),
    FOREIGN KEY ("emp_no") REFERENCES "Employees"("emp_no"),
    FOREIGN KEY ("dept_no") REFERENCES "Departments"("dept_no")
);

-- Dept_Manager table
CREATE TABLE "Dept_Manager" (
    "dept_no" VARCHAR(255) NOT NULL,
    "emp_no" INT NOT NULL,
    PRIMARY KEY ("dept_no", "emp_no"),
    FOREIGN KEY ("dept_no") REFERENCES "Departments"("dept_no"),
    FOREIGN KEY ("emp_no") REFERENCES "Employees"("emp_no")
);

-- Salaries table
CREATE TABLE "Salaries" (
    "emp_no" INT NOT NULL,
    "salary" INT NOT NULL,
    PRIMARY KEY ("emp_no"),
    FOREIGN KEY ("emp_no") REFERENCES "Employees"("emp_no")
);

