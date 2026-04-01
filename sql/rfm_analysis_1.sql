CREATE TABLE cleaned_sales AS
SELECT *
FROM sales
WHERE "Quantity" > 0
  AND "UnitPrice" > 0;

WITH customer_metrics AS (
    SELECT
        "CustomerID",
        MAX("InvoiceDate") AS last_purchase,
        COUNT(DISTINCT "InvoiceNo") AS frequency,
        SUM("Quantity" * "UnitPrice") AS monetary
    FROM cleaned_sales
    GROUP BY "CustomerID"
),

rfm AS (
    SELECT
        "CustomerID",
        DATE_PART('day', CURRENT_DATE - last_purchase) AS recency,
        frequency,
        monetary
    FROM customer_metrics
)

SELECT
    "CustomerID",
    recency,
    frequency,
    monetary,
    NTILE(5) OVER (ORDER BY recency ASC) AS R_Score,
    NTILE(5) OVER (ORDER BY frequency DESC) AS F_Score,
    NTILE(5) OVER (ORDER BY monetary DESC) AS M_Score,
    CONCAT(
        NTILE(5) OVER (ORDER BY recency ASC),
        NTILE(5) OVER (ORDER BY frequency DESC),
        NTILE(5) OVER (ORDER BY monetary DESC)
    ) AS RFM_Segment
FROM rfm
ORDER BY RFM_Segment DESC;