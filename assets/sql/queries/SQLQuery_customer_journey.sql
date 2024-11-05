-- Connect to the Online_retail_busines database and perform queries on the products table.
USE Online_retail_busines;

-- Select all columns from the customer_journey table.
SELECT 
	*
FROM
	customer_journey
ORDER BY VisitDate;


----------------------------------------
/* VERIFICATION PART*/
----------------------------------------
-- The CTE to identify duplicate rows based on specific fields (to check if duplicates exist in the dataset)
WITH duplicates_check_cte AS (
	SELECT 
		JourneyID,
		CustomerID,
		ProductID,
		VisitDate,
		Stage,
		Action, 
		Duration,
		-- Assign a row number for each duplicate group based on selected columns
		ROW_NUMBER() OVER(
			PARTITION BY CustomerID, ProductID, VisitDate, Stage, Action
			ORDER BY JourneyID
		) AS row_num
	FROM 
		customer_journey
)
SELECT 
	JourneyID,
	CustomerID,
	ProductID,
	VisitDate,
	Stage,
	Action, 
	Duration,
	row_num,
	-- Count duplicate occurrences for each customer
	COUNT(1) OVER(PARTITION BY CustomerID) AS count_duplicity_divided_by_customerID
FROM 
	duplicates_check_cte
WHERE
	row_num > 1 -- Only select rows where a duplicate exists
ORDER BY CustomerID; --JourneyID --> Optional ordering by CustomerID or JourneyID for clarity


----------------------------------------
/* FINAL RESULTS PART*/
----------------------------------------

-- Drop the view if it already exists to avoid errors during creation.
DROP VIEW IF EXISTS CustomerJourneyView;

GO

CREATE VIEW CustomerJourneyView AS
    -- Select specific columns to be included in the view
	SELECT 
		JourneyID,
		CustomerID,
		ProductID,
		VisitDate,
		Stage,
		Action, 
		-- Use the Duration if available, otherwise use the average duration (from VisitDate) rounded to 2 decimal places; 
		-- if neither is available, default to 0 (we will deal with 0 later in the analysis)
		COALESCE(Duration, ROUND(avg_duration, 2), 0) AS Duration
	FROM 
		(
		-- Subquery to calculate average duration and assign row numbers to handle duplicates
			SELECT 
				JourneyID,
				CustomerID,
				ProductID,
				VisitDate,
				Stage,
				Action,
				Duration,
				-- AVG and OVER functions to calculate the average duration for each VisitDate
				AVG(Duration) OVER(PARTITION BY VisitDate) AS avg_duration,
				-- Assign a row number for each duplicate group based on selected columns
				ROW_NUMBER() OVER(
					PARTITION BY CustomerID, ProductID, VisitDate, UPPER(Stage), Action
					ORDER BY JourneyID		
				) AS row_num
			FROM 
				customer_journey
			-- Uncomment the next line to order the results by VisitDate (optional)
				/*	NOTE:
						- ORDER BY can only be used in the context of a SELECT statement or with TOP in a view
						- It does not affect the view's overall ordering when queried*/
			-- ORDER BY VisitDate
		) AS subquery
	WHERE 
		row_num = 1;

GO

-- Select all columns from the newly created view CustomerJourneyView to review the data.
SELECT 
	*
FROM 
	CustomerJourneyView
ORDER BY VisitDate;

/*Alternatively we could use method for creating the view using another CTE
CREATE VIEW CustomerJourneyView AS
	WITH final_cte AS(
		SELECT 
			JourneyID,
			CustomerID,
			ProductID,
			VisitDate,
			Stage,
			Action, 
			Duration,
			AVG(Duration) OVER(PARTITION BY VisitDate) AS avg_duration,
			-- Assign a row number for each duplicate group based on selected columns
			ROW_NUMBER() OVER(
				PARTITION BY CustomerID, ProductID, VisitDate, Stage, Action
				ORDER BY JourneyID
			) AS row_num
		FROM 
			customer_journey
	)
	SELECT 
		JourneyID,
		CustomerID,
		ProductID,
		VisitDate,
		Stage,
		Action, 
		COALESCE(Duration, ROUND(avg_duration, 2), 0) AS Duration
	FROM 
		final_cte
	WHERE 
		row_num = 1;

GO*/
