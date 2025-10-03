# Insurance Fraud Detection Analytics – Power BI Project
### Overview
This project is a comprehensive end-to-end fraud detection analytics workflow, built entirely from scratch using SQL, Power Query, DAX, and Power BI Service. With 10,000+ rows of synthetic, messy insurance claims data, the solution transforms raw data into actionable business insights and interactive dashboards for online monitoring.

### Key Features
Realistic Claims Dataset: 10K+ rows generated and cleaned using SQL and Power Query.

Robust Data Modeling: Includes a dedicated Measures Table and semantic data model for fraud KPIs.

Custom DAX Measures: Calculates fraud rates, premiums, demographics, and advanced breakdowns.

Insightful Visuals: Two-page Power BI report covering fraud trends, customer, and geographic insights.

Power BI Service Deployment: Published in a collaborative workspace for monitoring and sharing.

#### Workflow
- Data Preparation & Cleaning Designed and generated insurance claims data using SQL scripts.

### Cleaned data in Power Query Editor:

- Standardized missing text fields (e.g.,"Unknown" for Gender/PolicyType).

- Fixed null/NaN values and inconsistent numeric types.

- Filled missing columns with default values for analytics consistency.

2. Data Modeling & DAX
Built a semantic model with relationships and dedicated Measures Table.

#### Key DAX measures:

- Fraud Detection Rate KPI

- Total and Average Premiums (fraudulent vs. non-fraudulent)

- Time-series trend of fraudulent claims

- Distribution of fraud by City, Policy Type, Gender, Age, and Payment Method

3. Visualization & Insights
Page 1: Fraud Detection Summary
Card KPIs: Total Premium, Fraud Detection Rate, Claims Count

- Bar chart: Comparison of fraudulent vs. non-fraudulent claims

- Trend line: Yearly trend of fraudulent claims

Page 2: Customer & Demographic Insights
Filled map: Fraud count by city

- Pie/bar charts: Breakdown by Policy Type, Payment Method, Age Group, Gender

4. Deployment & Sharing
Created a new Fraud Monitoring workspace in Power BI Service.

- Published the report for real-time business monitoring and cross-team collaboration.

####  Key Insights
- Yearly Decline in Fraudulent Claims: Fraud cases show a downward trend.

- Fraud is Highest Among Middle-Aged Adults.

- Cash and Unknown Payment Methods Lead in Fraud Cases.

- Certain Cities Report Disproportionate Fraud Concentration.

### Tech Stack
- SQL (for data design, generation, and cleansing)

- Power Query Editor (for ETL and data cleaning)

Power BI Desktop (for modeling, DAX, and visualization)

Power BI Service (for deployment and collaboration)

### How to Reproduce
- Prepare or generate a raw claims dataset (10K+ rows) with messy, incomplete values.

- Use Power Query to clean and standardize the data.

- Load into Power BI, build model relationships, and add a Measures Table.

- Create the visuals as described above.

- Publish the report to a Power BI Service workspace for sharing.

## DAX Functions for Data Cleaning and Modeling
        -COALESCE([Column], "Unknown")
- Replace null or blank values with "Unknown" in categorical fields like Gender, PolicyType, etc.

        - IF(ISBLANK([NumericColumn]), 0, [NumericColumn])
- Substitute missing numeric entries with zero for calculations and KPIs.

        - SWITCH(TRUE(), ISNUMBER([Premium]), [Premium], VALUE([Premium]))
- Normalize inconsistent numeric data types when source columns mix text and numbers.

        - CALCULATE([TotalClaims], [FraudFlag]="Yes")
- Aggregation by fraud status for summary KPIs.

        - AVERAGEX(FILTER('Claims', [FraudFlag]="Yes"), [Premium])
- Calculate average premium for fraudulent claims only.

        - COUNTROWS(FILTER('Claims', [PaymentMethod]="Unknown"))
- Count rows with missing or unknown payment methods.

## SQL Queries for Data Cleaning and Preparation
- Replace null categorical fields: 
         
         - UPDATE ClaimsSET Gender = ISNU(Gender'Unknown'),PolicyType = ISNULL(PolicyType, 'Unknown');

- Replace nulls or NaN in numeric columns:

        - UPDATE ClaimsSET Premium = CASE WHEN Premium IS NULL OR Premium = 'NaN' THEN 0 ELSE Premium END;

- Remove excess whitespace or standardize city names:

        - UPDATE ClaimsSET City = RTRIM(LTRIM(City));





