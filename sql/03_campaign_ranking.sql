
-- Digital Marketing Campaign Analysis
-- File: 03_campaign_ranking.sql
-- Dataset: Synthetic campaign data for portfolio practice
-- SQL dialect: DuckDB-compatible SQL

-- 1. Top 10 campaigns by ROAS
SELECT
    campaign_id,
    campaign_name,
    channel,
    SUM(impressions) AS impressions,
    SUM(clicks) AS clicks,
    SUM(conversions) AS conversions,
    ROUND(SUM(ad_spend), 2) AS ad_spend,
    ROUND(SUM(revenue), 2) AS revenue,

    ROUND(
        SUM(revenue) /
        NULLIF(SUM(ad_spend), 0), 2
    ) AS roas,

    ROUND(
        SUM(ad_spend) /
        NULLIF(SUM(conversions), 0), 2
    ) AS cost_per_acquisition
FROM "digital_marketing_campaign_data.csv"
GROUP BY
    campaign_id,
    campaign_name,
    channel
ORDER BY roas DESC
LIMIT 10;


-- 2. Bottom 10 campaigns by ROAS
SELECT
    campaign_id,
    campaign_name,
    channel,
    SUM(impressions) AS impressions,
    SUM(clicks) AS clicks,
    SUM(conversions) AS conversions,
    ROUND(SUM(ad_spend), 2) AS ad_spend,
    ROUND(SUM(revenue), 2) AS revenue,

    ROUND(
        SUM(revenue) /
        NULLIF(SUM(ad_spend), 0), 2
    ) AS roas,

    ROUND(
        SUM(ad_spend) /
        NULLIF(SUM(conversions), 0), 2
    ) AS cost_per_acquisition
FROM "digital_marketing_campaign_data.csv"
GROUP BY
    campaign_id,
    campaign_name,
    channel
ORDER BY roas ASC
LIMIT 10;


-- 3. Campaign ranking by conversion volume
SELECT
    campaign_id,
    campaign_name,
    channel,
    SUM(conversions) AS total_conversions,
    ROUND(SUM(ad_spend), 2) AS ad_spend,
    ROUND(SUM(revenue), 2) AS revenue,

    ROUND(
        SUM(revenue) /
        NULLIF(SUM(ad_spend), 0), 2
    ) AS roas,

    ROUND(
        SUM(ad_spend) /
        NULLIF(SUM(conversions), 0), 2
    ) AS cost_per_acquisition
FROM "digital_marketing_campaign_data.csv"
GROUP BY
    campaign_id,
    campaign_name,
    channel
ORDER BY total_conversions DESC
LIMIT 10;
