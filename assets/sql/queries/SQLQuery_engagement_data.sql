-- Connect to the Online_retail_busines database and perform queries on the products table.
USE Online_retail_busines;

-- Select all columns from the engagement data table.
SELECT 
	*
FROM
	engagement_data;

-- Drop the view if it already exists to avoid errors during creation.
DROP VIEW IF EXISTS ViewEngagementData;

GO

-- Create a view called ViewEngagementData to simplify access to engagement data 
-- by selecting relevant columns and formatting them appropriately.
CREATE VIEW ViewEngagementData AS
	SELECT 
		EngagementID,
		ContentID,
		CampaignID, 
		ProductId,
		EngagementDate,
		UPPER(REPLACE(ContentType, 'SocialMedia', 'Social Media')) AS ContentType, -- Converts ContentType to uppercase and replaces 'SocialMedia' with 'Social Media'
		LEFT(ViewsClicksCombined, CHARINDEX('-', ViewsClicksCombined)-1) AS "Views", -- Extracts the number of views from ViewsClicksCombined
		RIGHT(ViewsClicksCombined, (LEN(ViewsClicksCombined)-CHARINDEX('-', ViewsClicksCombined))) AS Clicks, -- Extracts the number of clicks from ViewsClicksCombined
		Likes
	FROM 
		engagement_data
	WHERE 
		ContentType!='Newsletter'; -- Filter out rows where ContentType is 'NEWSLETTER'

GO

-- Select all columns from the newly created view ViewEngagementData to review the engagement data.
SELECT 
	*
FROM
	ViewEngagementData
ORDER BY EngagementDate;
