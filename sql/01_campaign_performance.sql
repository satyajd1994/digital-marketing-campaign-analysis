
-- Digital Marketing Campaign Performance Analysis
-- Dataset: Synthetic campaign data for portfolio practice
-- SQL dialect: PostgreSQL

-- 1. Overall campaign performance
SELECT
    COUNT(*) AS total_records,
    SUM(impressions) AS total_impressions,
    SUM(clicks) AS total_clicks,
    SUM(conversions) AS total_conversions,
    ROUND(SUM(ad_spend), 2) AS total_ad_spend,
    ROUND(SUM(revenue), 2) AS total_revenue
FROM campaign_data;

-- 2. Key marketing KPIs
SELECT
    ROUND(100.0 * SUM(clicks) /
        NULLIF(SUM(impressions), 0), 2) AS ctr_percent,

    ROUND(100.0 * SUM(conversions) /
        NULLIF(SUM(clicks), 0), 2) AS conversion_rate_percent,

    ROUND(SUM(ad_spend) /
        NULLIF(SUM(clicks), 0), 2) AS cost_per_click,

    ROUND(SUM(ad_spend) /
        NULLIF(SUM(conversions), 0), 2) AS cost_per_acquisition,

    ROUND(SUM(revenue) /
        NULLIF(SUM(ad_spend), 0), 2) AS roas
FROM campaign_data;

-- 3. Performance by campaign
SELECT
    campaign_id,
    campaign_name,
    channel,
    SUM(impressions) AS impressions,
    SUM(clicks) AS clicks,
    SUM(conversions) AS conversions,
    ROUND(SUM(ad_spend), 2) AS ad_spend,
    ROUND(SUM(revenue), 2) AS revenue,
    ROUND(100.0 * SUM(clicks) /
        NULLIF(SUM(impressions), 0), 2) AS ctr_percent,
    ROUND(SUM(ad_spend) /
        NULLIF(SUM(conversions), 0), 2) AS cost_per_acquisition,
    ROUND(SUM(revenue) /
        NULLIF(SUM(ad_spend), 0), 2) AS roas
FROM campaign_data
GROUP BY campaign_id, campaign_name, channel
ORDER BY roas DESC;

-- 4. Monthly performance trend
SELECT
    DATE_TRUNC('month', date::date) AS campaign_month,
    SUM(impressions) AS impressions,
    SUM(clicks) AS clicks,
    SUM(conversions) AS conversions,
    ROUND(SUM(ad_spend), 2) AS ad_spend,
    ROUND(SUM(revenue), 2) AS revenue
FROM campaign_data
GROUP BY DATE_TRUNC('month', date::date)
ORDER BY campaign_month;
