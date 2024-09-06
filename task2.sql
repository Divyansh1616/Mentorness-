-- In this i am taking date as DAT due to error issue in my sql developer

SELECT *
FROM walmart_data
WHERE branch = 'A';

DESCRIBE walmart_data;

SELECT 
    Product_line,
    SUM(Total) AS Total_Sales
FROM 
    walmart_data
GROUP BY 
    Product_line;
    
    
SELECT *
FROM walmart_data
WHERE Payment = 'Cash';

SELECT 
    City,
    SUM(Total) AS Total_Gross_Income
FROM 
    walmart_data
GROUP BY 
    City;
    
    
SELECT 
    Branch,
    AVG(Rating) AS Average_Rating
FROM 
    walmart_data
GROUP BY 
    Branch;
    
    
SELECT 
    Product_line,
    SUM(Quantity) AS Total_Quantity_Sold
FROM 
    walmart_data
GROUP BY 
    Product_line;
    
    

SELECT * 
FROM (
    SELECT 
        Product_line,
        Unit_price
    FROM 
        walmart_data
    ORDER BY 
        Unit_price DESC
)
WHERE ROWNUM <= 5;



SELECT 
    Invoice_ID,
    Total,
    cogs
FROM 
    walmart_data
WHERE 
    (Total - cogs) > 30;
    
    
    
SELECT*
FROM 
    walmart_data
WHERE 
    TO_CHAR(Dat, 'D') IN ('1', '7');  -- '1' = Sunday, '7' = Saturday


SELECT
    TO_CHAR(Dat, 'YYYY-MM') AS Month, 
    SUM(Total) AS Total_Sales,  
    SUM(Total - cogs) AS Gross_Income  
FROM
    walmart_data
GROUP BY
    TO_CHAR(Dat, 'YYYY-MM')
ORDER BY
    Month;  
    
    
    
SELECT 
    COUNT(*) AS Number_of_Transactions
FROM 
    walmart_data
WHERE 
    TO_NUMBER(SUBSTR(Time, 1, 2)) >= 18;  



SELECT *
FROM walmart_data
WHERE Total > (
    
    SELECT AVG(Total)
    FROM walmart_data
);
    
    
    
SELECT
    Branch,
    Dat,
    SUM(Total) OVER (PARTITION BY Branch ORDER BY Dat) 
FROM
    walmart_data
ORDER BY
    Branch, Dat;
    
    
SELECT
    City,
    Customer_type,
    SUM(cogs) 
FROM
    walmart_data
GROUP BY
    City,
    Customer_type
ORDER BY
    City, Customer_type;
    
    
    
    



