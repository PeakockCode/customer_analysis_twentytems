-- Connect to the Online_retail_busines database and perform queries on the products table.
USE Online_retail_busines;

-- Select all columns from the products table to retrieve the complete list of products.
SELECT 
	*
FROM
	products;

-- Drop the view if it exists to avoid errors when creating a new one.
DROP View IF EXISTS ViewProducts;

GO

-- Create a view that selects specific columns from the products table 
-- and categorizes each product's price into defined price ranges.
CREATE VIEW ViewProducts AS
	SELECT 
		ProductID,
		ProductName,
		Price,
		CASE 
			WHEN Price < 50 THEN 'Low'
			WHEN Price BETWEEN 50 AND 200 THEN 'Medium'
			ELSE 'High'
			END AS PriceRangeCategory
	FROM 
		products;

GO

-- Select all columns from the ViewProducts view to display categorized product information.
SELECT 
	*
FROM
	ViewProducts;