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
