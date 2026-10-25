
-- Campaign Ranking and Optimization Analysis
-- Synthetic data for portfolio practice
-- SQL dialect: PostgreSQL

-- 1. Rank campaigns by ROAS
WITH campaign_metrics AS (
    SELECT
        campaign_id,
        campaign_name,
        channel,
        SUM(impressions) AS impressions,
        SUM(clicks) AS clicks,
        SUM(conversions) AS conversions,
        SUM(ad_spend) AS ad_spend,
        SUM(revenue) AS revenue
    FROM campaign_data
    GROUP BY campaign_id, campaign_name, channel
)
SELECT
    campaign_id,
    campaign_name,
    channel,
    ROUND(ad_spend, 2) AS ad_spend,
    ROUND(revenue, 2) AS revenue,
    ROUND(
        revenue / NULLIF(ad_spend, 0), 2
    ) AS roas,
    RANK() OVER (
        ORDER BY revenue / NULLIF(ad_spend, 0) DESC
    ) AS campaign_rank
FROM campaign_metrics
ORDER BY campaign_rank;


-- 2. Identify campaigns with high spend
-- and relatively low ROAS
WITH campaign_metrics AS (
    SELECT
        campaign_id,
        campaign_name,
        channel,
        SUM(conversions) AS conversions,
        SUM(ad_spend) AS ad_spend,
        SUM(revenue) AS revenue
    FROM campaign_data
    GROUP BY campaign_id, campaign_name, channel
)
SELECT
    campaign_id,
    campaign_name,
    channel,
    ROUND(ad_spend, 2) AS ad_spend,
    conversions,
    ROUND(revenue, 2) AS revenue,
    ROUND(
        revenue / NULLIF(ad_spend, 0), 2
    ) AS roas
FROM campaign_metrics
WHERE ad_spend > (
    SELECT AVG(total_spend)
    FROM (
        SELECT SUM(ad_spend) AS total_spend
        FROM campaign_data
        GROUP BY campaign_id, campaign_name
    ) AS spend_summary
)
AND revenue / NULLIF(ad_spend, 0) < 2
ORDER BY ad_spend DESC;


-- 3. Calculate cumulative revenue by campaign
WITH campaign_revenue AS (
    SELECT
        campaign_id,
        campaign_name,
        SUM(revenue) AS revenue
    FROM campaign_data
    GROUP BY campaign_id, campaign_name
)
SELECT
    campaign_id,
    campaign_name,
    ROUND(revenue, 2) AS campaign_revenue,
    ROUND(
        SUM(revenue) OVER (
            ORDER BY revenue DESC
            ROWS BETWEEN UNBOUNDED PRECEDING
            AND CURRENT ROW
        ), 2
    ) AS cumulative_revenue
FROM campaign_revenue
ORDER BY revenue DESC;


-- 4. Compare campaign conversion efficiency
SELECT
    campaign_id,
    campaign_name,
    channel,
    SUM(clicks) AS clicks,
    SUM(conversions) AS conversions,
    ROUND(
        100.0 * SUM(conversions) /
        NULLIF(SUM(clicks), 0), 2
    ) AS conversion_rate_percent,
    ROUND(
        SUM(ad_spend) /
        NULLIF(SUM(conversions), 0), 2
    ) AS cost_per_acquisition
FROM campaign_data
GROUP BY campaign_id, campaign_name, channel
ORDER BY conversion_rate_percent DESC;
