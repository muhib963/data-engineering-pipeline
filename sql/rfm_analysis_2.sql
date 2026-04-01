CREATE TABLE "rfm_analysis" AS
WITH customer_metrics AS (
    SELECT
        "CustomerID",
        MAX("InvoiceDate") AS "last_purchase",
        COUNT(DISTINCT "InvoiceNo") AS "frequency",
        SUM("Quantity" * "UnitPrice") AS "monetary"
    FROM "cleaned_sales"
    WHERE "CustomerID" IS NOT NULL
    GROUP BY "CustomerID"
),

rfm_base AS (
    SELECT
        "CustomerID",
        DATE_PART('day', CURRENT_DATE - "last_purchase") AS "recency",
        "frequency",
        "monetary"
    FROM customer_metrics
),

rfm_scores AS (
    SELECT
        "CustomerID",
        "recency",
        "frequency",
        "monetary",
        NTILE(5) OVER (ORDER BY "recency" ASC) AS "R_score",
        NTILE(5) OVER (ORDER BY "frequency" DESC) AS "F_score",
        NTILE(5) OVER (ORDER BY "monetary" DESC) AS "M_score"
    FROM rfm_base
)

SELECT
    "CustomerID",
    "recency",
    "frequency",
    "monetary",
    "R_score",
    "F_score",
    "M_score",
    CONCAT("R_score","F_score","M_score") AS "RFM_Segment"
FROM rfm_scores;