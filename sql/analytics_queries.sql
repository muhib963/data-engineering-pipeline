--Total Revenue
SELECT SUM("Quantity" * "UnitPrice")
FROM sales;

--Total Products Sold
SELECT SUM("Quantity")
FROM sales;

--Total Orders
SELECT COUNT(DISTINCT "InvoiceNo")
FROM sales;

--Total Customers
SELECT COUNT(DISTINCT "CustomerID")
FROM sales;

--Top Selling Products
SELECT
"Description",
SUM("Quantity") AS total_units
FROM sales
GROUP BY "Description"
ORDER BY total_units DESC
LIMIT 10;

--Top Customers
SELECT
"CustomerID",
SUM("Quantity" * "UnitPrice") AS total_spent
FROM sales
GROUP BY "CustomerID"
ORDER BY total_spent DESC
LIMIT 10;

--Revenue Trend
SELECT
DATE_TRUNC('month', "InvoiceDate") AS month,
SUM("Quantity" * "UnitPrice") AS revenue
FROM sales
GROUP BY month
ORDER BY month;

--Revenue by Country
SELECT
"Country",
SUM("Quantity" * "UnitPrice") AS revenue
FROM sales
GROUP BY "Country"
ORDER BY revenue DESC;

--Hourly Sales Pattern
SELECT
EXTRACT(HOUR FROM "InvoiceDate") AS hour,
SUM("Quantity" * "UnitPrice") AS revenue
FROM sales
GROUP BY hour
ORDER BY hour;