SELECT
Company.Name,           Company.Phonenum,
Customer.email,         Customer.CustID,
Orders.Quantity,        Orders.OrderID,
Jobsheet.Description,   Jobsheet.Datesubmit,
Product.ProdType,       Product.Description,
Payment.amount,			Payment.method
FROM Company, Customer, Orders, Jobsheet, Product, OrdersProduct, Payment
WHERE
Company.companyID = Customer.companyID AND
Customer.CustID = Orders.CustID AND
Orders.OrderID = Jobsheet.OrderID AND
Orders.OrderID = OrdersProduct.OrderID AND OrdersProduct.Productcode = Product.Productcode AND
Orders.OrderID = Payment.OrderID AND
Customer.type = 'Gov' AND
Orders.Quantity > 40
;