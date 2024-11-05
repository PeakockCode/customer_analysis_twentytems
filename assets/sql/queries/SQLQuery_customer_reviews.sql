-- Connect to the Online_retail_busines database and perform queries on the products table.
USE Online_retail_busines;

-- Select all columns from the customer reviews table to retrieve the complete list of reviews.
SELECT 
	*
FROM
	customer_reviews;

-- Drop the view if it already exists to avoid errors during creation.
DROP VIEW IF EXISTS ViewCustomersReview;

GO

-- Create a view to select necessary columns from the customer reviews table. 
-- Trim whitespace from both sides of the review text and replace double spaces with a single space.
CREATE VIEW ViewCustomersReview AS
	SELECT 
		ReviewID,
		CustomerID, 
		ProductID,
		ReviewDate,
		Rating,
		TRIM(REPLACE(ReviewText, '  ', ' ')) AS ReviewText -- Clean up the review text by replacing double spaces and trimming whitespace.
	FROM
		customer_reviews;

GO

SELECT 
	*
FROM
	ViewCustomersReview
ORDER BY ReviewID;