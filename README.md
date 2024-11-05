![header image](assets/images/company_logo/1.png)

# Project: Analysis and Improvement of Twentytems' Online Sales Performance

This workflow outlines the process of analyzing, visualizing, and improving the performance of the online shop Twentytems using SQL and Power BI. By leveraging customer journey data, feedback scores, and engagement metrics, we aim to provide actionable insights that enhance conversion rates and customer engagement.

## Overview:

### Data Source:

- Customer Journey Data: Provided by the marketing department, including website visits and purchase information.
- Customer Reviews Data: Feedback collected from various platforms, essential for sentiment analysis.
- Engagement Data: Metrics related to customer interactions with marketing content, including clicks and likes.  

### Project Steps:  

**1. Data Acquisition:**  
  - Gather data from various sources including customer reviews and engagement metrics.
    
**2. Data Exploration with Pandas (Python):**  
  - Analyze the dataset to understand its structure and quality.  
  - Save the updated data in updated_twentytems_data.csv.
  - Python code for initial data exploration is provided in the Jupyter notebook:
  - Path: jupyter_lab/twentytems_data_exploration.ipynb

**3. SQL Data Cleaning:**  
  - Import the updated CSV into Microsoft SQL Server for cleaning and standardization.
  - Create views for simplified access to key columns and metrics.
  - SQL queries for data cleaning can be found in:
    Path: sql_server/sql_data_cleaning/SQLQuery_Twentytems.sql
  - Export the final cleaned data as final_twentytems_data.csv.
  - Check the template file:
    Path: sql_server/sql_data_cleaning/final_twentytems_data.csv

**4. Data Visualization:**  
  - Create Power BI dashboards using the cleaned data to build visualizations that showcase key performance indicators.
  - Use the cleaned data (from the SQL view or final_twentytems_data.csv) to create an in-depth analysis dashboard in Power BI.
  - Note:
    - You can view an image of the dashboard:
      Path: images/Twentytems_DashboardImage.png
    - Download the original Power BI dashboard files:
      Path: dashboards/Twentytems_PowerBIDashboard.pbix

### Key Performance Indicators (KPIs):
- Conversion Rate: The percentage of visitors who complete a purchase.
- Customer Engagement Rate: Level of interaction with marketing content (clicks, likes, comments).
- Customer Feedback Score: Average rating from customer reviews.
- 
### Conclusion:
This project aims to identify key areas for improvement in Twentytems' marketing strategies by analyzing conversion rates, engagement metrics, and customer feedback. The recommendations derived from the analysis will provide actionable insights to enhance overall performance and drive business growth.
