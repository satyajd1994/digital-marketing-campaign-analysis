
-- Digital Marketing Campaign Analysis
-- File: 02_channel_analysis.sql
-- Dataset: Synthetic campaign data for portfolio practice
-- SQL dialect: DuckDB-compatible SQL

-- 1. Performance by marketing channel
SELECT
    channel,
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
        100.0 * SUM(conversions) /
        NULLIF(SUM(clicks), 0), 2
    ) AS conversion_rate_percent,

    ROUND(
        SUM(ad_spend) /
        NULLIF(SUM(conversions), 0), 2
    ) AS cost_per_acquisition,

    ROUND(
        SUM(revenue) /
        NULLIF(SUM(ad_spend), 0), 2
    ) AS roas
FROM "digital_marketing_campaign_data.csv"
GROUP BY channel
ORDER BY roas DESC;


-- 2. Monthly marketing performance
SELECT
    DATE_TRUNC('month', CAST(date AS DATE)) AS campaign_month,
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
    ) AS cost_per_acquisition,

    ROUND(
        SUM(revenue) /
        NULLIF(SUM(ad_spend), 0), 2
    ) AS roas
FROM "digital_marketing_campaign_data.csv"
GROUP BY DATE_TRUNC('month', CAST(date AS DATE))
ORDER BY campaign_month;


-- 3. Performance by device
SELECT
    device,
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
        100.0 * SUM(conversions) /
        NULLIF(SUM(clicks), 0), 2
    ) AS conversion_rate_percent,

    ROUND(
        SUM(ad_spend) /
        NULLIF(SUM(conversions), 0), 2
    ) AS cost_per_acquisition,

    ROUND(
        SUM(revenue) /
        NULLIF(SUM(ad_spend), 0), 2
    ) AS roas
FROM "digital_marketing_campaign_data.csv"
GROUP BY device
ORDER BY roas DESC;
