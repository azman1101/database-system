SELECT
Company.Name,
Customer.contactperson,
Orders.Quantity,
Product.ProdType,
Jobsheet.Description,
Equipment.Name,
Machine.MachineName,
Employee.Name,
Branch.Location
FROM
Company, Customer, Orders,
Product, Jobsheet, Equipment,
Machine, Employee, Branch,
OrdersProduct, OrdersEquipment, OrdersMachine, EmployeeBranch
WHERE
Company.companyID = Customer.companyID AND
Customer.CustID = Orders.CustID AND
Orders.OrderID = OrdersProduct.OrderID AND OrdersProduct.Productcode = Product.Productcode AND
Orders.OrderID = Jobsheet.OrderID AND
Orders.OrderID = OrdersEquipment.OrderID AND OrdersEquipment.Code = Equipment.Code AND
Orders.OrderID = OrdersMachine.OrderID AND OrdersMachine.MachineNum = Machine.MachineNum AND
Jobsheet.EmpID = Employee.EmpID AND
Employee.EmpID = EmployeeBranch.EmpID AND EmployeeBranch.BranchID =  Branch.BranchID AND
Customer.type = 'Gov' AND
(Branch.Location = 'SENAWANG' OR Branch.Location = 'SEREMBAN') AND
Jobsheet.Description = 'Embroidery' AND
Product.ProdType = 'HONEYCOMB'
ORDER BY Equipment.Name DESC;