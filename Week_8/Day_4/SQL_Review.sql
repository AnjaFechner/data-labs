USE adventureworks;

# Task 1: Write a SELECT statement that lists the customerid along with their account number, type, the city lives in and their postalcode.

SELECT c.customerID, c.AccountNumber, c.CustomerType, a.City, a.PostalCode FROM customer c
JOIN customeraddress ca
ON c.CustomerID = ca.CustomerID
JOIN address a
ON ca.AddressID = a.AddressID;

# Task 2: Write a SELECT statement that lists the 20 most recently launched products, their name and colour

SELECT p.name, p.color, p.ProductID
FROM product p
ORDER BY p.SellStartDate DESC
LIMIT 20;

# Task 3: Write a SELECT statement that shows how many products are on each shelf in 2/5/98, broken down by product category and subcategory

SELECT count(pi.Quantity), pc.Name as category, psc.name as subcategory, pi.shelf, pi.ModifiedDate
FROM productinventory pi
JOIN product p
ON pi.ProductID = p.ProductID
LEFT JOIN productsubcategory psc
ON p.ProductSubcategoryID = psc.ProductSubcategoryID
LEFT JOIN productcategory pc
ON psc.ProductCategoryID = pc.ProductCategoryID
WHERE DATE_FORMAT(pi.ModifiedDate, "%d/%m/%Y") = '02/05/1998'
GROUP BY pi.shelf;

# Task 4: I am trying to track down a vendor email address… his name is Stuart and he works at G&K Bicycle Corp. Can you help?

SELECT v.Name, c.EmailAddress, c.FirstName, c.LastName FROM vendor v
JOIN vendorcontact vc
ON v.VendorID = vc.VendorID
JOIN contact c
ON vc.ContactID = c.ContactID
WHERE v.Name LIKE "%Bicycle Corp." and c.FirstName LIKE "%Stuart%";

#TASK 5: What’s the total sales tax amount for sales to Germany? What’s the top region in Germany by sales tax?

# -> sales tax amount for sales in Germany

SELECT st.Name, sum(soh.TaxAmt) as total_tax FROM salesorderheader soh
JOIN salesterritory st
ON soh.TerritoryID = st.TerritoryID
WHERE st.Name = "Germany"
GROUP BY st.Name;

#  -> What’s the top region in Germany by sales tax?

SELECT sum(soh.TaxAmt) as total_tax, sp.Name, sp.CountryRegionCode FROM stateprovince sp
JOIN address a
ON sp.StateProvinceID = a.StateProvinceID
JOIN customeraddress ca
ON a.AddressID = ca.AddressID
JOIN salesorderheader soh
ON ca.CustomerID = soh.CustomerID
WHERE sp.CountryRegionCode = "DE"
GROUP BY sp.Name
ORDER BY sum(soh.TaxAmt) DESC;

#Task6: 6. Summarise the distinct # transactions by month

SELECT count(trh.TransactionID) as Total_Transaction, DATE_FORMAT(trh.TransactionDate, "%m.%Y") as "Month_Year" FROM transactionhistory trh
GROUP BY DATE_FORMAT(trh.TransactionDate, "%m.%Y");

#Task 7: Which ( if any) of the sales people exceeded their sales quota this year and last year?

SELECT sp.SalesPersonID,
CASE
	WHEN (sp.SalesYTD > sp.SalesQuota and sp.SalesLastYear > sph.SalesQuota) THEN "exceeded both years"  
	WHEN (sp.SalesYTD > sp.SalesQuota or sp.SalesLastYear > sph.SalesQuota) THEN "exceeded both years"  
	ELSE "no excceded"
END as "exceeded sales quota"
FROM salesperson sp 
JOIN salespersonquotahistory sph
ON sp.SalesPersonID = sph.SalesPersonID

#Task 8: Do all products in the inventory have photos in the database and a text product descriptions? 



#Task 9: What's the average unit price of each product name on purchase orders which were not fully, but at least partially rejected?


#Task 10: How many engineers are on the employee list? Have they taken any sickleave?


#Task 11: How many days difference on average between the planned and actual end date of workorders in the painting stages?