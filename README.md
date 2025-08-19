Walmart Retail Data Analysis
📊 Project Overview
This project analyzes Walmart's retail transaction data to uncover insights into sales performance, customer behavior, and operational efficiency across multiple branches. The analysis addresses key business questions to support data-driven decision making.

📁 Dataset
Source: Kaggle (Walmart Retail Data)

Original Dataset: Raw transactional data with sales information

Cleaned Dataset: walmart.cl - Processed and enhanced data ready for analysis

🛠️ Data Processing
Python Data Cleaning
The raw data underwent comprehensive cleaning and preparation:

Removed null/missing values

Created necessary derived columns (proper date formats, calculated fields)

Standardized categorical values

Ensured data consistency and quality

Exported cleaned data as CSV for SQL analysis

SQL Analysis
Performed detailed analysis using MySQL to answer specific business questions:

Used window functions for ranking and comparisons

Implemented Common Table Expressions (CTEs) for complex queries

Created temporal analysis using date functions

Generated performance metrics across multiple dimensions

🔍 Business Questions Answered
1. Payment Method Analysis
Identified different payment methods and their transaction volumes

Calculated quantity sold by payment type

2. Product Performance
Found highest rated product categories in each branch

Determined average, minimum, and maximum ratings by city and category

3. Temporal Patterns
Identified busiest days for each branch based on transaction volume

Categorized sales into morning, afternoon, and evening shifts

Analyzed transaction patterns across different time periods

4. Financial Analysis
Calculated total profit for each category considering profit margins

Ranked categories by profitability

Identified branches with revenue decreases year-over-year

5. Operational Insights
Determined most common payment methods for each branch

Analyzed sales performance across different branches

🗃️ Database Schema
The analysis uses a single table walmart.cl with the following key columns:

Branch: Store location identifier

City: City where store is located

Customer_type: Type of customer

Gender: Customer gender

Product_line: Category of product

Unit_price: Price per item

Quantity: Number of items purchased

Total: Total transaction amount

Date: Transaction date

Time: Transaction time

Payment: Payment method used

Rating: Customer rating (1-10)

proper_date3: Formatted date column (YYYY-MM-DD)

📈 Key Findings
Payment Preferences
[Insert key findings about payment methods]

Top Performing Categories
[Insert findings about highest rated products]

Temporal Patterns
[Insert insights about busy days/times]

Financial Performance
[Insert revenue and profit insights]

🚀 Technical Implementation
Tools Used
Python: Pandas, NumPy for data cleaning

MySQL: Data analysis and querying

MySQL Workbench: Database management and query execution

SQL Techniques Applied
Window Functions (RANK, OVER, PARTITION BY)

Common Table Expressions (CTEs)

Date/Time functions (STR_TO_DATE, DAYNAME, HOUR)

Aggregate functions with GROUP BY

JOIN operations for comparative analysis

Type conversion and NULL handling

🎯 Business Impact
This analysis provides actionable insights for:

Optimizing staffing based on peak transaction times

Inventory management by identifying popular product categories

Payment processing optimization

Branch performance comparisons and improvement strategies

Customer satisfaction enhancement through rating analysis

🔮 Future Enhancements
Integration with visualization tools (Tableau/Power BI)

Predictive analytics for sales forecasting

Seasonal trend analysis

👥 Author
Ujaan Majumder

GitHub: https://github.com/pabloujaan2k3

📄 License
This project is for educational purposes. Dataset sourced from Kaggle under [mention license if applicable].
