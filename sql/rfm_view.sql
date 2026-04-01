CREATE OR REPLACE VIEW "rfm_segments" AS
SELECT
    "CustomerID",
    "recency",
    "frequency",
    "monetary",
    "R_score",
    "F_score",
    "M_score",
    CASE
        WHEN "R_score" >= 4 AND "F_score" >= 4 AND "M_score" >= 4 THEN 'Champions'
        WHEN "F_score" >= 4 AND "M_score" >= 3 THEN 'Loyal Customers'
        WHEN "M_score" >= 4 THEN 'Big Spenders'
        WHEN "R_score" >= 4 AND "F_score" >= 3 THEN 'Potential Loyalists'
        WHEN "R_score" <= 2 AND "F_score" >= 3 THEN 'At Risk'
        WHEN "R_score" <= 2 AND "F_score" <= 2 THEN 'Lost Customers'
        ELSE 'Other'
    END AS "Customer_Segment"
FROM "rfm_analysis";