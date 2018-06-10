SELECT Employee.Name, Department.Dept_name, Branch.BranchName
FROM Employee, EmployeeDepartment, Department, Branch, EmployeeBranch
WHERE
Employee.empID = EmployeeDepartment.empID AND EmployeeDepartment.DeptNo = Department.DeptNo AND
Employee.empID = EmployeeBranch.empID AND EmployeeBranch.BranchID = Branch.BranchID;