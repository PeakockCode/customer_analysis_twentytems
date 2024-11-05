![header image](assets/images/company_logo/1.png)

# Project: Analysis and Improvement of Twentytems' Online Sales Performance

This workflow outlines the process of analyzing, visualizing, and improving the performance of the online shop Twentytems using SQL, Python and Power BI. By leveraging customer journey data, feedback scores, and engagement metrics, we aim to provide actionable insights that enhance conversion rates and customer engagement.

## Overview:

### Data Source:

- Customer Journey Data: Provided by the marketing department, including website visits and purchase information.  
- Customer Reviews Data: Feedback collected from various platforms, essential for sentiment analysis.  
- Engagement Data: Metrics related to customer interactions with marketing content, including clicks and likes.  

### Project Steps:  

**1. Data Acquisition:**  
  - Gathered data from various sources including customer reviews and engagement metrics.  
    Check the source data:  
    Path: assets/source_data  
    
**2. Data Exploration with Excel:**  
  - Analyze the dataset to understand its structure and quality.  

**3. SQL Data Cleaning and Preparation:**  
  - Import the CSV file into Microsoft SQL Server for cleaning, standardization and preparation.  
  - Create selects or views for simplified access to key columns and metrics.  
  - SQL queries for data cleaning and preparation can be found in:  
    Path: assets/sql/queries  
  - Export the final cleaned data.  
  - Check the cleaned data files:  
    Path: assets/sql/final_csv_exported_views  

**4. Data Enrichment with Python:**  
  - Analyze reviews to understand customer sentiment with NLTK Library  
  - Check the python code for the sentiment analysis:  
    Path: assets/jupyter_lab/sentiment_analysis/sentiment_analysis.ipynb  
  - Check the final dataset with sentiment analysis:  
    Path: assets/jupyter_lab/analyzed_data/customer_analyzed_reviews.csv  

**5. Data Visualization:**  
  - Create Power BI dashboards using the cleaned data to build visualizations that showcase key performance indicators.  
  - Use the cleaned data (from the SQL view and customer_analyzed_reviews.csv) to create an in-depth analysis dashboard in Power BI.  
  - Note:  
    - You can view images of the dashboards:  
      Path: assets/images/dashboards  
    - Download the original Power BI dashboard file:  
      Path: dashboard/OnlineRetailBusinessCustomerAnalysisDashboard.pbix  

### Key Performance Indicators (KPIs):  
- **Conversion Rate:** The percentage of visitors who complete a purchase.  
- **Customer Engagement Rate:** Level of interaction with marketing content (clicks, likes, comments).  
- **Customer Feedback Score:** Average rating from customer reviews.  
  
### Conclusion:  
This project aims to identify key areas for improvement in Twentytems' marketing strategies by analyzing conversion rates, engagement metrics, and customer feedback. The recommendations derived from the analysis will provide actionable insights to enhance overall performance and drive business growth.
