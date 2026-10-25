
-- Country Performance Analysis
-- Dataset: Synthetic digital marketing campaign data
-- SQL dialect: DuckDB-compatible SQL

SELECT
    country,
    COUNT(*) AS records,
    SUM(impressions) AS impressions,
    SUM(clicks) AS clicks,
    SUM(conversions) AS conversions,
    ROUND(SUM(ad_spend), 2) AS ad_spend,
    ROUND(SUM(revenue), 2) AS revenue,

    ROUND(
        100.0 * SUM(clicks) /
        NULLIF(SUM(impressions), 0), 2
    ) AS ctr_percent,

    ROUND(
        SUM(ad_spend) /
        NULLIF(SUM(conversions), 0), 2
    ) AS cpa,

    ROUND(
        SUM(revenue) /
        NULLIF(SUM(ad_spend), 0), 2
    ) AS roas

FROM "digital_marketing_campaign_data.csv"
GROUP BY country
ORDER BY roas DESC;
