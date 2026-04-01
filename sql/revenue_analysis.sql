-- Total revenue per month
SELECT
    DATE_TRUNC('month', "InvoiceDate") AS month,
    SUM("Quantity" * "UnitPrice") AS total_revenue
FROM cleaned_sales
GROUP BY month
ORDER BY month;

-- Top 10 customers by revenue
SELECT
    "CustomerID",
    SUM("Quantity" * "UnitPrice") AS total_revenue
FROM cleaned_sales
GROUP BY "CustomerID"
ORDER BY total_revenue DESC
LIMIT 10;