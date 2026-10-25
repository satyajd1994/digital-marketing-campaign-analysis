
-- Audience Segment Performance Analysis
-- Dataset: Synthetic digital marketing campaign data

SELECT
    audience_segment,
    COUNT(*) AS records,
    SUM(conversions) AS conversions,
    ROUND(SUM(ad_spend), 2) AS ad_spend,
    ROUND(SUM(revenue), 2) AS revenue,
    ROUND(
        100.0 * SUM(conversions) /
        NULLIF(SUM(clicks), 0), 2
    ) AS conversion_rate_percent,
    ROUND(
        SUM(ad_spend) /
        NULLIF(SUM(conversions), 0), 2
    ) AS cpa,
    ROUND(
        SUM(revenue) /
        NULLIF(SUM(ad_spend), 0), 2
    ) AS roas
FROM "digital_marketing_campaign_data.csv"
GROUP BY audience_segment
ORDER BY roas DESC;
