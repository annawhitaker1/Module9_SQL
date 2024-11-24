SELECT * FROM "Departments";
SELECT * FROM "Dept_Employee";
SELECT * FROM "Dept_Manager";
SELECT * FROM "Employees";
SELECT * FROM "Salaries";
SELECT * FROM "Titles";

--Salary of employees
SELECT 	"Employees"."emp_no",
		"Employees"."first_name",
		"Employees"."last_name",
		"Employees"."sex",
		"Salaries"."salary"
FROM "Employees"
LEFT JOIN "Salaries"
ON ("Employees"."emp_no" = "Salaries"."emp_no")
ORDER BY "Employees"."emp_no";

--Employees hired in 1986
SELECT "first_name",
		"last_name",
		"hire_date"
FROM "Employees"
WHERE CAST("hire_date" AS DATE) BETWEEN '1986/01/01' AND '1986/12/31';

--Department Managers
SELECT "Dept_Manager"."dept_no",
       "Departments"."dept_name",
       "Dept_Manager"."emp_no",
       "Employees"."last_name",
       "Employees"."first_name"
FROM "Employees"
INNER JOIN "Dept_Manager" 
ON ("Employees"."emp_no" = "Dept_Manager"."emp_no")
INNER JOIN "Departments" 
ON ("Dept_Manager"."dept_no" = "Departments"."dept_no");

--Department number for each employee
SELECT "Employees"."emp_no",
		"Employees"."last_name",
		"Employees"."first_name",
		"Departments"."dept_name",
		"Departments"."dept_no"
FROM "Employees"
	INNER JOIN "Dept_Employee"
	ON ("Employees"."emp_no" = "Dept_Employee"."emp_no")
	INNER JOIN "Departments"
	ON ("Dept_Employee"."dept_no"="Departments"."dept_no")
ORDER BY "Employees"."emp_no";

--Hercules B
SELECT "Employees"."emp_no", 
		"Employees"."last_name",
		"Employees"."first_name",
		"Employees"."sex"
FROM "Employees"
WHERE "Employees"."first_name" = 'Hercules' 
AND "Employees"."last_name" LIKE 'B%'

--Sales Department
SELECT "Employees"."emp_no",
		"Employees"."last_name",
		"Employees"."first_name",
		"Departments"."dept_name"
FROM "Employees"
	INNER JOIN "Dept_Employee"
	ON ("Employees"."emp_no" = "Dept_Employee"."emp_no")
	INNER JOIN "Departments"
	ON ("Dept_Employee"."dept_no"="Departments"."dept_no")
WHERE "Departments"."dept_name" = 'Sales'
ORDER BY "Employees"."emp_no";

--Sales and Development Department
SELECT "Employees"."emp_no",
		"Employees"."last_name",
		"Employees"."first_name",
		"Departments"."dept_name"
FROM "Employees"
	INNER JOIN "Dept_Employee"
	ON ("Employees"."emp_no" = "Dept_Employee"."emp_no")
	INNER JOIN "Departments"
	ON ("Dept_Employee"."dept_no"="Departments"."dept_no")
WHERE "Departments"."dept_name" IN ('Sales', 'Development')
ORDER BY "Employees"."emp_no";

--Employees that share the last name
SELECT "last_name", COUNT("last_name")
FROM "Employees"
GROUP BY "last_name"
ORDER BY COUNT("last_name") DESC;
