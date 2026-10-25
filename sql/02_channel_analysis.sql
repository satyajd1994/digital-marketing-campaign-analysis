
-- Digital Marketing Campaign Performance
-- Channel-Level Analysis
-- Dataset contains synthetic campaign data

-- 1. Compare marketing channels
SELECT
    channel,
    COUNT(*) AS total_records,
    SUM(impressions) AS total_impressions,
    SUM(clicks) AS total_clicks,
    SUM(conversions) AS total_conversions,
    ROUND(SUM(ad_spend), 2) AS total_ad_spend,
    ROUND(SUM(revenue), 2) AS total_revenue,
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
FROM campaign_data
GROUP BY channel
ORDER BY roas DESC;


-- 2. Rank channels by return on ad spend
SELECT
    channel,
    ROUND(
        SUM(revenue) /
        NULLIF(SUM(ad_spend), 0), 2
    ) AS roas,
    RANK() OVER (
        ORDER BY
            SUM(revenue) /
            NULLIF(SUM(ad_spend), 0) DESC
    ) AS roas_rank
FROM campaign_data
GROUP BY channel;


-- 3. Compare device performance
SELECT
    device,
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
        SUM(revenue) /
        NULLIF(SUM(ad_spend), 0), 2
    ) AS roas
FROM campaign_data
GROUP BY device
ORDER BY roas DESC;


-- 4. Compare audience segments
SELECT
    audience_segment,
    SUM(clicks) AS clicks,
    SUM(conversions) AS conversions,
    ROUND(
        100.0 * SUM(conversions) /
        NULLIF(SUM(clicks), 0), 2
    ) AS conversion_rate_percent,
    ROUND(SUM(ad_spend), 2) AS ad_spend,
    ROUND(SUM(revenue), 2) AS revenue
FROM campaign_data
GROUP BY audience_segment
ORDER BY conversion_rate_percent DESC;
