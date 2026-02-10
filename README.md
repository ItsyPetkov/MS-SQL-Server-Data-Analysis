# Retail Business Intelligence & Executive Reporting Framework (MS SQL Server RDBMS Exploration) 

This portfolio project uses a relational retail database designed to replicate a real-world enterprise sales environment within a fictional bike retail business. The data captures transactional activity across customers, products, stores, staff, brands, and geographic regions, enabling comprehensive end-to-end analysis of commercial performance, customer lifetime value, workforce productivity, pricing effectiveness, and regional dynamics. A structured SQL Server reporting framework is developed to transform raw transactional data into executive-ready business intelligence through a series of optimised views, KPIs, and analytical layers. This project demonstrates how advanced SQL-based analytics can support strategic decision-making, uncover performance drivers, identify growth opportunities, and highlight operational inefficiencies, delivering actionable insights typically produced through enterprise BI platforms, but implemented entirely within Microsoft SQL Server.

## Table of Contents

## Target Users: Executive Leadership, Commercial Management & Business Stakeholders

This analysis is designed for senior business leaders, commercial decision-makers, and operational managers seeking to enhance retail performance through structured, data-driven insights. It delivers actionable intelligence across product strategy, customer value management, store and workforce productivity, brand performance, promotional effectiveness, and geographic expansion. 

## Understanding the Data

The database used throughout this project is the Bike Store Relational Database | SQL available at https://www.kaggle.com/datasets/dillonmyrick/bike-store-sample-database. The database itself is comprised of nine csv files: 1) customers.csv; 2) staffs.csv; 3) orders.csv; 4) stores.csv; 5) order_items.csv; 6) categoreis.csv; 7) brand.csv; 8) products.csv; and 9) stocks.csv.

The image below provides the reader with the interconnections of the relational database.

<img width="742" height="602" alt="image" src="https://github.com/user-attachments/assets/8e39c19e-5c02-42cc-ac57-f57564f92977" />

Data processing will be applied in Microsoft SQL Server. For more information, please read the Data Analysis Framework section below.

## Data Analysis Framework

This is an SQL Relational DataBase Management System project aiming to explore the complex relationships between multiple tables.

Topics that are covered in this exploration include:

BASICS: SELECT, FROM, WHERE, IN, LIKE, BETWEEN, GROUP BY, ORDER BY, WildCards, CREATE/DROP TABLE, HAVING, CASE, IF, INSERT, MAX(), MIN(), AVG(), SUM(), COUNT() Statements/clauses , primary and compund keys

INTERMEDIATES: Subqueries, Various window functions including ROW_NUMBER(), RANK(), DENSE_RANK() and aggragate functions, PARTITION BY, Common Table Expressions (CTEs)

ADVANCED: LEAD and LAG, RECURSION, TRIGGERS and AUTOMATION, DATE, DATETIME, DATEPART(), DATEDIFF()

All of these topics have been explored in server_config.sql, basics.sql, intermediates.sql and advanced.sql.

Next stages involve: 1) data reporting by producing a Bike Store Analytics Layer in MS SQL Server using STORED PROCEDURES, VIEWS, SCHEMAS and multiple QUERIES; and 2) data storytelling by delivering a comprehensive analysis presentation using MS PowerPoint. The output of both steps is available in the GitHub repository under 'SQL_Deployment_Script.sql' and 'Stakeholder report.pptx', respectively.

## Analytical Focus & Key Business Questions

This section presents a set of strategic business questions developed for key stakeholders across the fictional organisation, including 1) Executive Leadership; 2) Commercial & Sales Management; 3) Finance & Business Performance; and 4) Strategy & Business Intelligence. These questions reflect the core priorities of each group and are designed to uncover critical insights into commercial performance, operational efficiency, and growth opportunities. Collectively, they support data-driven decision-making across sales optimisation, customer value management, workforce productivity, pricing and promotional strategy, and geographic expansion, enabling leadership to align strategic objectives with measurable business outcomes.

List of business-related enquiries and their relevance:

1) *Which products and categories generate the highest revenue and sales volume?* => Helps leadership optimise product strategy, inventory investment, and merchandising focus.
   
2) *How do sales trends vary by time (month, year)?* => Enables forecasting accuracy, seasonal planning, and proactive capacity management.
   
3) *Which stores and regions perform best and which are underperforming?* => Supports targeted operational improvements and smarter geographic investment decisions.
   
4) *Who are our most valuable customers and what are their purchasing patterns?* => Guides personalised marketing, loyalty strategy, and customer lifetime value optimisation.
   
5) *How effective are staff sales performance and store operations?* => Informs workforce planning, performance management, and productivity improvement initiatives.
    
6) *Which brands generate the highest revenue and sales volume?* => Supports supplier strategy, partnership prioritisation, and commercial negotiations.
    
7) *What is the optimal discount range to maximise revenue and volume?* => Enables pricing optimisation while protecting margins and promotional ROI.
    
8) *How does store performance vary by manager?* => Evaluates leadership effectiveness and informs talent development and succession planning.
    
9) *Which geographic regions generate the highest revenue?* => Guides strategic expansion, resource allocation, and regional prioritisation.
    
10) *Which brands respond best to discounting?* => Enables brand-specific promotional strategies and margin protection.

   
## Key Insights & Strategic Action Recommendations

This section presents a concise overview of the patterns and trends revealed through Exploratory Data Analysis (EDA) in relation to each of the questions posed above, followed by recommendations derived from the findings.

### Question 1 Insights and recommendations

**Key Metrics:** 

* Total Revenue by Product & Category
* Units Sold
* Average Selling Price (ASP)
* Revenue Contribution %
* Top 10 Products & Categories by Revenue
  
**Key Insights:**

* A small group of high-performing products typically drives a disproportionate share of total revenue.

* Certain categories consistently outperform others in both revenue and volume, indicating strong customer preference.

* Long-tail products contribute limited revenue while adding inventory and operational complexity.

**Based on this analysis, I recommend the following actions:**

* Prioritise inventory investment in high-performing products and categories.
* Rationalise or discontinue consistently underperforming Stock Keeping Units (SKU).
* Focus promotional activity and shelf space on top revenue drivers.

### Question 2 Insights and recommendations

**Key Metrics:** 

* Monthly Revenue Trend
* Year-over-Year Growth (%)
* Seasonal Peak vs Off-Peak Sales Periods

**Key Insights:**

* Sales exhibit clear seasonal patterns, with predictable peak and trough periods.

* Certain months consistently outperform others, indicating demand cycles.

* Volatility in monthly revenue may reveal operational or promotional inefficiencies.

**Based on this analysis, I recommend the following actions:**

* Align inventory procurement and workforce planning with seasonal demand.
* Optimise promotional timing to amplify peak sales periods.
* Improve forecasting models using historical seasonality patterns.

### Question 3 Insights and recommendations

**Key Metrics:** 

* Revenue by Store
* Orders by Store
* Average Order Value (AOV)
* Revenue per Staff Member

**Key Insights:**

* Significant performance variance exists across store locations.

* Some stores consistently outperform peers, while others structurally underperform.

* AOV differences suggest uneven customer engagement or selling effectiveness.

**Based on this analysis, I recommend the following actions:**

* Launch targeted improvement programs for underperforming stores.
* Replicate best-practice operational models across weaker locations.
* Prioritise capital investments in high-growth geographies.

### Question 4 Insights and recommendations

**Key Metrics:** 

* Top 10 Customers by Lifetime Value
* Average Spend per Customer
* Purchase Frequency
* Repeat Purchase Rate

**Key Insights:**

* A small group of customers generates a disproportionate share of total revenue.
  
* High-value customers exhibit repeat purchasing and higher basket sizes.
  
* Long-tail customers contribute limited lifetime value.

**Based on this analysis, I recommend the following actions:**

* Implement tiered loyalty and retention programs.
* Personalise offers for high-value and growth-potential customers.
* Shift marketing spend toward lifecycle-based engagement strategies.
  
### Question 5 Insights and recommendations

**Key Metrics:** 

* Revenue by Sales Representative
* Orders per Sales Representative
* Revenue per Order
* Top & Bottom Performers

**Key Insights:**

* Staff performance varies significantly across individuals and stores.

* Top performers consistently generate higher order values and conversion rates.

* Underperformance indicates training gaps or operational inefficiencies.

**Based on this analysis, I recommend the following actions:**

* Introduce targeted training and coaching programmes.
* Redesign incentive structures to reward high performance.
* Implement workforce planning models based on productivity metrics.

### Question 6 Insights and recommendations

**Key Metrics:** 

* Revenue by Brand
* Units Sold by Brand
* Average Selling Price by Brand (ASP)

**Key Insights:**

* Brand revenue concentration indicates reliance on a limited number of suppliers.

* Some brands generate high volume but lower profitability.

* ASP variation suggests pricing and positioning opportunities.

**Based on this analysis, I recommend the following actions:**

* Strengthen partnerships with high-performing brands.
* Renegotiate commercial terms with key suppliers.
* Rebalance brand portfolio toward higher-margin suppliers.

### Question 7 Insights and recommendations

**Key Metrics:** 

* Revenue by Discount Band
* Units Sold by Discount Band
* Revenue Retention %

**Key Insights:**

* Moderate discount levels often generate optimal revenue and volume balance.

* Deep discounting significantly erodes revenue retention.

* Zero or low discount levels may suppress demand.

**Based on this analysis, I recommend the following actions:**

* Establish discount guardrails based on performance bands.
* Prioritise mid-range discount strategies.
* Monitor promotional ROI at product and category levels.

### Question 8 Insights and recommendations

**Key Metrics:** 

* Revenue by Manager
* Orders per Manager
* Staff Productivity per Manager

**Key Insights:**

* Leadership effectiveness has a measurable impact on store performance.

* Some managers consistently outperform peers across all Key Performance Indicators (KPI).

* Variability highlights differences in leadership capability and execution.

**Based on this analysis, I recommend the following actions:**

* Implement leadership development and mentoring programmes.
* Reward top-performing managers with succession opportunities.
* Address capability gaps through targeted coaching.
  
### Question 9 Insights and recommendations

**Key Metrics:** 

* Revenue by State
* Revenue by City
* Orders by Zip Code

**Key Insights:**

* Clear geographic revenue concentration exists.

* Certain cities and states significantly outperform others.

* Some regions show persistent underperformance.

**Based on this analysis, I recommend the following actions:**

* Prioritise growth investments in high-performing regions.
* Develop targeted strategies for underpenetrated markets.
* Rationalise footprint in structurally weak locations.

### Question 10 Insights and recommendations

**Key Metrics:** 

* Revenue from Discounted Sales
* Units Sold under Discount
* Revenue Retention %

**Key Insights:**

* Brands respond very differently to discounting strategies.

* Some brands show strong volume lift with limited margin erosion.

* Others suffer revenue dilution with minimal sales uplift.

**Based on this analysis, I recommend the following actions:**

* Implement brand-specific discount strategies.
* Prioritise promotional activity on brands with high elasticity.
* Negotiate supplier co-funded promotions.
