-- Top 10 products by quantity sold
SELECT
    "StockCode",
    "Description",
    SUM("Quantity") AS total_quantity
FROM cleaned_sales
GROUP BY "StockCode", "Description"
ORDER BY total_quantity DESC
LIMIT 10;

-- Top products by revenue
SELECT
    "StockCode",
    "Description",
    SUM("Quantity" * "UnitPrice") AS total_revenue
FROM cleaned_sales
GROUP BY "StockCode", "Description"
ORDER BY total_revenue DESC
LIMIT 10;