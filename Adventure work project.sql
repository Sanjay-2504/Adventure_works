use adventure_works;
show tables;
select * from factinternetsales;



# Q0 - Union 
create table InternetSales as
SELECT * FROM FactInternetSales
UNION
SELECT * FROM factinternetsales_new  ;

select * from internetsales;

#Q1 - Productname
select EnglishProductName from dimproduct;

#Q2 - Customer Full Name
select * ,concat(firstname,' ' ,MiddleName,' ' ,LastName) as CustomerFullName from dimcustomer;
#Q3
SELECT
    YEAR(orderdatekey) AS Year,
    MONTH(orderdatekey) AS Monthno ,
    MONTHNAME(orderdatekey) AS Monthfullname,
    CONCAT(YEAR(orderdatekey), '-', DATE_FORMAT(orderdatekey, '%b')) AS YearMonth,
    QUARTER(orderdatekey) AS Quarter,
    DAYOFWEEK(orderdatekey) AS Weekdayno,
    DAYNAME(orderdatekey) AS Weekdayname,
    CONCAT(YEAR(orderdatekey), '-', LPAD(FLOOR((MONTH(orderdatekey)+2)/3), 2, '0')) AS FinancialMonth,
    CONCAT(YEAR(orderdatekey), '-Q', QUARTER(orderdatekey)) AS FinancialQuarter
FROM internetsales;


#Q4 -- Sales
select * , (UnitPrice * OrderQuantity* (1 - UnitPriceDiscountPct) ) as Total_Sales  from internetsales;

# Total Sales
SELECT sum( (unitprice * orderquantity) - UnitPriceDiscountPct ) AS TotalSales
FROM InternetSales;

#Q5 -- Production Cost
SELECT *,(ProductStandardCost * orderquantity) AS Productioncost
FROM internetsales;

# Total Production Cost
SELECT sum(ProductStandardCost * orderquantity) AS Productioncost
FROM internetsales;

#Q6 -- Profit

select * , ((UnitPrice * OrderQuantity* (1 - UnitPriceDiscountPct)) -  (ProductStandardCost * orderquantity)) as profit from internetsales;






