-- Connect to the Online_retail_busines database and perform queries on the products table.
USE Online_retail_busines;

-- Select all columns from the customers table to retrieve the complete list of customers.
SELECT 
	*
FROM
	customers;

-- Select all columns from the geography table to retrieve the complete list of geographic locations.
SELECT 
	*
FROM
	geography;

-- Drop the view if it exists to avoid errors when creating a new one.
DROP View IF EXISTS ViewCustomersGeography;

GO
-- Create a view that combines customer data with geographic data, selecting only the necessary columns.
CREATE VIEW ViewCustomersGeography AS(
	SELECT 
		c.CustomerID,
		c.CustomerName,
		c.Email,
		c.Gender,
		c.Age,
		g.Country,
		g.City
	FROM 
		customers AS c
	JOIN 
		geography AS g
	ON 
		c.GeographyID=g.GeographyID
);

GO

-- Select all columns from the ViewCustomersGeography table to retrieve the complete list of customers ordered by CustomerID.
SELECT 
	* 
FROM 
	ViewCustomersGeography
ORDER BY 
	CustomerID;

----------------------------------------
/* VERIFICATION PART - SIMPLE CHECK*/
----------------------------------------
-- Define CTE to count the number of customers per country to check our data output. 
-- Initially, the SELECT statement counts customers for each country (we can compare this data with our expectations).
-- Then, the CTE code totals the number of customers across all countries (we can verify our results against our data).
WITH cte_cust_country_count AS (
	SELECT 
		Country,
		COUNT(Country) AS customer_per_country_count -- Counting occurrences of each country.
	FROM 
		ViewCustomersGeography
	GROUP BY Country -- Grouping results by Country to get counts for each.
)
SELECT
	SUM(customer_per_country_count) AS total_customer_country_count -- Summing up the individual country counts.
FROM 
	cte_cust_country_count;