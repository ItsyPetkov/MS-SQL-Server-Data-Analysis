IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'rpt')
BEGIN
    EXEC ('CREATE SCHEMA rpt');
END;
GO

-- Which products and categories generate the highest revenue and sales volume?
--
-- Importance: 
--		1) Identifies top-performing products and categories
--		2) Informs inventory planning, product investment, and promotional focus.
--		3) Supports merchandising and assortment optimisation.
--
-- Target Users:
--		1) Commercial Director
--		2) Merchandising Manager
--		3) Inventory & Supply Chain Teams
--
-- Key Performance Indicators (KPI):
--		1) Total Revenue
--		2) Units Sold
--		3) Average Selling Price (ASP)
--		4) Revenue Contribution %
--		5) Top Products by Revenue
--		6) Top Categories by Revenue

CREATE OR ALTER VIEW rpt.vw_product_category_performance AS
SELECT 
    P.product_name, 
    C.category_name, 
    SUM(OI.list_price * OI.quantity) AS total_revenue,
    SUM(OI.quantity) AS total_units_sold,
    ROUND(
        SUM(OI.quantity * OI.list_price) / NULLIF(SUM(OI.quantity), 0), 
        2
    ) AS average_selling_price
FROM order_items AS OI
JOIN products AS P ON OI.product_id = P.product_id
JOIN categories AS C ON P.category_id = C.category_id
GROUP BY P.product_name, C.category_name;
GO

-- How do sales trends vary by time (month, year)?
--
-- Importance:
--		1) Reveals seasonality and demand cycles.
--		2) Supports forecasting, budgeting, and capacity planning.
--		3) Enables performance tracking against targets.
--
-- Target Users:
--		1) Finance Director
--		2) Sales Leadership
--		3) Operations Planning
--
-- Key Performance Indicators (KPI):
--		1) Monthly Revenue Trend
--		2) Year-over-Year Growth (%)
--		3) Peak vs Off-Peak Sales Periods

CREATE OR ALTER VIEW rpt.vw_sales_trends_monthly AS
SELECT 
    YEAR(O.order_date) AS order_year, 
    MONTH(O.order_date) AS order_month,
    SUM(OI.quantity * OI.list_price) AS total_revenue
FROM orders AS O
JOIN order_items AS OI ON O.order_id = OI.order_id
GROUP BY 
    YEAR(O.order_date), 
    MONTH(O.order_date);
GO

-- Which stores and regions perform best and which are underperforming?
--
-- Importance:
--		1) Highlights geographic strengths and weaknesses.
--		2) Enables targeted store improvement initiatives.
--		3) Supports location-based investment decisions.
--
-- Target Users: 
--		1) Regional Managers
--		2) Retail Director
--		3) Strategy & Expansion Teams
--
-- Key Performance Indicators (KPI):
--		1) Revenue by Store
--		2) Orders by Store
--		3) Average Order Value (AOV)
--		4) Revenue per Staff Member

CREATE OR ALTER VIEW rpt.vw_store_performance AS
SELECT 
    S.store_name, 
    S.city, 
    S.state,
    COUNT(DISTINCT O.order_id) AS total_orders,
    SUM(OI.quantity * OI.list_price) AS total_revenue,
    ROUND(
        SUM(OI.quantity * OI.list_price) / 
        NULLIF(COUNT(DISTINCT O.order_id), 0), 
        2
    ) AS average_order_value
FROM stores AS S
JOIN orders AS O ON S.store_id = O.store_id
JOIN order_items AS OI ON O.order_id = OI.order_id
GROUP BY 
    S.store_name, 
    S.city, 
    S.state;
GO

-- Who are our most valuable customers and what are their purchasing patterns?
--
-- Importance:
--		1) Enables customer segmentation and loyalty strategy.
--		2) Drives targeted marketing and personalisation.
--		3) Supports retention and lifetime value optimisation.
--
-- Target Users:
--		1) Marketing Director
--		2) CRM & Loyalty Teams
--		3) Commercial Strategy
--
-- Key Performance Indicators (KPI):
--		1) Top 10 Customers by Lifetime Value (LTV)
--		2) Average Spend per Customer
--		3) Purchase Frequency
--		4) Repeat Purchase Rate

CREATE OR ALTER VIEW rpt.vw_customer_lifetime_value AS
SELECT TOP 10
    C.customer_id,
    CONCAT(C.first_name, ' ', C.last_name) AS customer_name,
    COUNT(DISTINCT O.order_id) AS total_orders,
    SUM(OI.quantity * OI.list_price) AS lifetime_value,
    ROUND(
        SUM(OI.quantity * OI.list_price) / 
        NULLIF(COUNT(DISTINCT O.order_id), 0), 
        2
    ) AS average_order_value
FROM customers AS C
JOIN orders AS O ON C.customer_id = O.customer_id
JOIN order_items AS OI ON O.order_id = OI.order_id
GROUP BY 
    C.customer_id, 
    C.first_name, 
    C.last_name;
GO

-- How effective are staff sales performance and store operations?
--
-- Importance:
--		1) Identifies top and bottom performers.
--		2) Informs training, incentives, and workforce planning.
--		3) Supports productivity optimisation.
--
-- Target Users:
--		1) HR Director
--		2) Retail Operations
--		3) Store Managers
--
-- Key Performance Indicators (KPI):
--		1) Revenue by Sales Representative
--		2) Orders per Sales Representative
--		3) Revenue per Order
--		4) Top & Bottom Performers

CREATE OR ALTER VIEW rpt.vw_staff_performance AS
SELECT 
    ST.staff_id,
    CONCAT(ST.first_name, ' ', ST.last_name) AS staff_name, 
    S.store_name,
    COUNT(DISTINCT O.order_id) AS total_orders,
    SUM(OI.quantity * OI.list_price) AS total_revenue,
    ROUND(
        SUM(OI.quantity * OI.list_price) / 
        NULLIF(COUNT(DISTINCT O.order_id), 0), 
        2
    ) AS revenue_per_order
FROM staffs AS ST
JOIN stores AS S ON ST.store_id = S.store_id
JOIN orders AS O ON ST.staff_id = O.staff_id
JOIN order_items OI ON O.order_id = OI.order_id
GROUP BY 
    ST.staff_id, 
    ST.first_name, 
    ST.last_name, 
    S.store_name;
GO

-- Which brands generate the highest revenue and sales volume?
--
-- Importance:
--		1) Supports brand partnership decisions.
--		2) Guides marketing spend and inventory investment.
--		3) Optimises supplier negotiations.
--
-- Target Users:
--		1) Commercial Director
--		2) Procurement
--		3) Brand Managers
--
-- Key Performance Indicators (KPI):
--		1) Revenue by Brand
--		2) Units Sold by Brand
--		3) Average Selling Price by Brand

CREATE OR ALTER VIEW rpt.vw_brand_performance AS
SELECT 
    B.brand_name, 
    SUM(OI.quantity) AS total_units_sold,
    SUM(OI.quantity * OI.list_price) AS total_revenue,
    ROUND(
        SUM(OI.quantity * OI.list_price) / 
        NULLIF(SUM(OI.quantity), 0), 
        2
    ) AS average_selling_price
FROM order_items AS OI
JOIN products AS P ON OI.product_id = P.product_id
JOIN brands AS B ON P.brand_id = B.brand_id
GROUP BY 
    B.brand_name;
GO

-- What is the optimal discount range to maximise revenue and volume?
--
-- Importance:
--		1) Identifies pricing sweet spots.
--		2) Prevents over-discounting.
--		3) Maximises promotional Return Of Investment (ROI).
--
-- Target Users:
--		1) Pricing & Promotions Teams
--		2) Finance
--		3) Commercial Strategy
--
-- Key Performance Indicators (KPI):
--		1) Revenue by Discount Category (0%, 5%, 10%, 15%, 20%+)
--		2) Units per Discount Category

CREATE OR ALTER VIEW rpt.vw_discount_optimisation AS
SELECT
    CASE
        WHEN discount = 0 THEN '0%'
        WHEN discount <= 0.05 THEN '1–5%'
        WHEN discount <= 0.10 THEN '6–10%'
        WHEN discount <= 0.15 THEN '11–15%'
        WHEN discount <= 0.20 THEN '16–20%'
        ELSE '20%+'
    END AS discount_category,
    SUM(quantity) AS units_sold,
    SUM(quantity * list_price) AS gross_revenue,
    SUM(quantity * list_price * (1 - discount)) AS net_revenue,
    ROUND(
        SUM(quantity * list_price * (1 - discount)) / 
        NULLIF(SUM(quantity * list_price), 0) * 100, 
        2
    ) AS revenue_retention_percentage
FROM order_items
GROUP BY
    CASE
        WHEN discount = 0 THEN '0%'
        WHEN discount <= 0.05 THEN '1–5%'
        WHEN discount <= 0.10 THEN '6–10%'
        WHEN discount <= 0.15 THEN '11–15%'
        WHEN discount <= 0.20 THEN '16–20%'
        ELSE '20%+'
    END;
GO

-- How does store performance vary by manager?
--
-- Importance:
--		1) Evaluates leadership effectiveness.
--		2) Supports performance management and development.
--		3) Informs promotion and succession planning.
--
-- Target Users:
--		1) HR Director
--		2) Retail Director
-- 
-- Key Performance Indicators (KPI):
--		1) Revenue by Manager
--		2) Orders per Manager
--		3) Staff Productivity per Manager

CREATE OR ALTER VIEW rpt.vw_manager_performance AS
SELECT 
    M.staff_id AS manager_id,
    CONCAT(M.first_name, ' ', M.last_name) AS manager_name,
    COUNT(DISTINCT O.order_id) AS total_orders,
    SUM(OI.quantity * OI.list_price) AS total_revenue
FROM staffs AS M
LEFT JOIN staffs AS ST 
    ON ST.manager_id = CAST(M.staff_id AS VARCHAR)
LEFT JOIN orders AS O 
    ON ST.staff_id = O.staff_id
LEFT JOIN order_items AS OI 
    ON O.order_id = OI.order_id
GROUP BY 
    M.staff_id, 
    M.first_name, 
    M.last_name;
GO

-- Which geographic regions generate the highest revenue?
--
-- Importance:
--		1) Guides strategic investment.
--		2) Supports regional prioritisation.
--		3) Enables performance benchmarking.
--
-- Target Users:
--		1) Strategy Director
--		2) Regional Management
--
-- Key Performance Indicators (KPI):
--		1) Revenue by State
--		2) Revenue by City
--		3) Orders by Zip Code

CREATE OR ALTER VIEW rpt.vw_geographic_performance AS
SELECT 
    S.state, 
    S.city,
    SUM(OI.quantity * OI.list_price) AS total_revenue,
    COUNT(DISTINCT O.order_id) AS total_orders
FROM stores AS S
JOIN orders AS O ON s.store_id = o.store_id
JOIN order_items AS OI ON o.order_id = oi.order_id
GROUP BY 
    S.state, 
    S.city;
GO

-- Which brands respond best to discounting?
-- 
-- Importance:
--		1) Identifies brands where promotions drive true incremental demand.
--		2) Optimises brand-level pricing strategy.
--		3) Prevents unnecessary margin erosion.
--
-- Target Users:
--		1) Commercial Strategy
--		2) Brand Managers
--		3) Pricing Teams
--
-- Key Performance Indicators (KPI):
--		1) Revenue from Discounted Sales
--		2) Volume Lift (Units Sold)
--		3) Discount Efficiency / Revenue Retention

CREATE OR ALTER VIEW rpt.vw_brand_discount_response AS
SELECT 
    B.brand_name,
    AVG(OI.discount) AS average_discount,
    SUM(OI.quantity) AS units_sold,
    SUM(OI.quantity * OI.list_price * (1 - OI.discount)) AS net_revenue
FROM order_items AS OI
JOIN products AS P ON oi.product_id = p.product_id
JOIN brands AS B ON p.brand_id = b.brand_id
GROUP BY 
    B.brand_name;
GO

SELECT * FROM rpt.vw_product_category_performance;
SELECT * FROM rpt.vw_sales_trends_monthly;
SELECT * FROM rpt.vw_store_performance;
SELECT * FROM rpt.vw_customer_lifetime_value;
SELECT * FROM rpt.vw_staff_performance;
SELECT * FROM rpt.vw_brand_performance;
SELECT * FROM rpt.vw_discount_optimisation;
SELECT * FROM rpt.vw_manager_performance;
SELECT * FROM rpt.vw_geographic_performance;
SELECT * FROM rpt.vw_brand_discount_response;