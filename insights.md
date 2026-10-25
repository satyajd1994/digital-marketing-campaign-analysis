# Digital Marketing Campaign Performance — Business Insights

## 1. Project Objective

The objective of this project is to analyze digital marketing campaign performance across multiple channels, audience segments, devices, and dates using SQL.

The analysis focuses on marketing efficiency, conversion performance, advertising costs, and attributed revenue.

**Dataset note:** This project uses synthetic data generated for portfolio practice. The results are illustrative and do not represent actual business performance.

## 2. Business Questions

1. Which marketing channels generate the highest return on ad spend?
2. Which channels have the highest click-through and conversion rates?
3. Which campaigns have relatively high acquisition costs?
4. How does performance differ across mobile, desktop, and tablet?
5. Which audience segments convert most effectively?
6. How does campaign performance change over time?
7. Which campaigns may need further investigation or optimization?

## 3. Key Performance Indicators

| KPI | Formula | Business Purpose |
|---|---|---|
| CTR | Clicks / Impressions × 100 | Measures how often impressions lead to clicks |
| Conversion Rate | Conversions / Clicks × 100 | Measures the proportion of clicks that convert |
| CPC | Ad Spend / Clicks | Measures average cost per click |
| CPA | Ad Spend / Conversions | Measures average cost per conversion |
| ROAS | Attributed Revenue / Ad Spend | Measures revenue generated per unit of advertising spend |

## 4. Analysis Approach

### Campaign Performance

Aggregate impressions, clicks, conversions, spend, and revenue to understand campaign-level results.

### Channel Comparison

Compare Google Ads, Facebook Ads, Instagram Ads, LinkedIn Ads, YouTube Ads, and Email Marketing using consistent KPIs.

### Campaign Ranking

Use SQL window functions to rank campaigns by ROAS and compare conversion efficiency.

### Audience and Device Analysis

Compare performance across audience segments, countries, and devices to identify potential opportunities for further investigation.

### Monthly Trends

Aggregate campaign metrics by month to explore changes in traffic, conversions, spend, and attributed revenue.

## 5. Preliminary Business Recommendations

These are hypotheses to test against the query results, not confirmed findings.

- **Budget allocation:** Investigate channels with stronger ROAS and sufficient conversion volume before considering budget changes.
- **Conversion optimization:** Review campaigns with many clicks but relatively few conversions to identify possible landing-page or audience issues.
- **Cost management:** Investigate campaigns with high CPA and low ROAS before reducing their budgets.
- **Device optimization:** Compare conversion rates and CPA by device before adjusting device-specific targeting.
- **Audience targeting:** Evaluate segment-level results while considering sample sizes and campaign objectives.
- **Trend monitoring:** Review monthly performance to identify patterns that may warrant further investigation.

## 6. Limitations

- The dataset is synthetic and does not describe real advertising activity.
- The dataset does not include campaign objectives, profit margins, or customer lifetime value.
- Attributed revenue is not the same as profit.
- Results may be affected by differences in campaign size, audience, and marketing objective.
- Correlation or differences in observed performance do not establish causation.

## 7. Next Steps

- Execute and validate all SQL queries against the dataset.
- Review the actual results before writing quantified conclusions.
- Build an Excel dashboard with KPI summaries and channel comparisons.
- Add charts for monthly trends, ROAS, CPA, and conversion rates.
- Update this document with verified findings from the completed analysis.
## 8. Channel Performance Findings

The channel-level SQL analysis was executed against 10,000 synthetic campaign records.

### Results

| Channel | CTR | CPA | ROAS |
|---|---:|---:|---:|
| Email Marketing | 4.67% | 1.46 | 96.85x |
| YouTube Ads | 4.62% | 5.39 | 27.42x |
| Instagram Ads | 4.73% | 8.33 | 17.73x |
| Facebook Ads | 4.68% | 10.23 | 13.68x |
| Google Ads | 4.68% | 17.56 | 7.99x |
| LinkedIn Ads | 4.73% | 46.57 | 3.08x |

*All figures are based on synthetic data. Currency is unspecified.*

### Observations

1. Email Marketing had the highest calculated ROAS and lowest CPA in the sample.
2. YouTube Ads ranked second by ROAS.
3. Instagram Ads generated higher ROAS than Facebook Ads and Google Ads.
4. LinkedIn Ads had the highest CPA and lowest ROAS in the sample.
5. CTR values were relatively similar across channels, ranging from 4.62% to 4.73%. This illustrates why CTR alone is insufficient to assess campaign profitability.

### Recommendations

- Investigate why Email Marketing has such a high ROAS, including how costs are represented in the dataset.
- Compare conversion quality and attributed revenue across channels before reallocating budgets.
- Review LinkedIn acquisition costs alongside lead quality, customer lifetime value, and campaign objectives.
- Validate the findings using actual business data before making real marketing decisions.

### Limitations

These figures are illustrative rather than evidence of actual advertising performance. The dataset is synthetic, and the analysis does not account for profit margins, attribution differences, or customer lifetime value.

## 9. Monthly Performance Analysis

The monthly SQL analysis examined performance across all 12 months of the synthetic dataset.

### Key Findings

- October recorded the highest attributed revenue: 32,910,838.01.
- February recorded the lowest attributed revenue: 25,934,352.71.
- April achieved the highest ROAS at 10.76x.
- March recorded the lowest ROAS at 9.07x.
- April had the lowest CPA at 13.45.
- January had the highest CPA at 15.69.

### Business Interpretation

October generated the highest revenue, while April achieved the strongest revenue return per unit of advertising spend. This illustrates that the month generating the most revenue is not necessarily the month with the highest ROAS.

### Recommendations

- Investigate the factors behind October's higher revenue.
- Examine April's advertising costs and conversion efficiency.
- Monitor CPA and ROAS together rather than relying on revenue alone.
- Validate these patterns using actual campaign data before making budget decisions.

*All results are based on synthetic data, and the currency is unspecified.*

## 10. Device Performance Analysis

The device-level analysis compared campaign performance across Mobile, Desktop, and Tablet.

### Key Findings

| Device | Records | Conversion Rate | CPA | ROAS |
|---|---:|---:|---:|---:|
| Tablet | 612 | 8.94% | 13.88 | 10.33x |
| Desktop | 3,163 | 8.66% | 14.58 | 9.78x |
| Mobile | 6,225 | 8.74% | 14.79 | 9.62x |

### Business Interpretation

- Tablet had the highest ROAS and conversion rate in the sample.
- Mobile accounted for the largest volume of records and conversions.
- Desktop performance fell between Tablet and Mobile on ROAS.
- CTR was similar across devices, suggesting that clicks alone do not explain the differences in downstream performance.

### Recommendations

- Investigate Tablet performance while considering its smaller sample size.
- Review Mobile landing-page experience and conversion efficiency.
- Evaluate device performance using conversion volume, CPA, and ROAS together.
- Validate findings with real campaign data before changing budgets.

*All results are based on synthetic data. Currency is unspecified.*

## 11. Audience Segment Analysis

### Key Findings

- **Returning Customers achieved the highest ROAS at 10.03x**, along with the lowest CPA of 14.03.
- **Students recorded the highest conversion rate at 8.92%**, indicating strong conversion performance after clicks.
- **New Customers achieved a ROAS of 9.92x**, making them another strong-performing segment.
- **Enterprise had the lowest ROAS at 9.06x**, the lowest conversion rate at 8.56%, and the highest CPA at 15.89.
- Small Business and General Audience segments delivered similar results, with ROAS values of 9.82x and 9.76x, respectively.

### Recommendations

1. Investigate opportunities to engage returning customers, given their strong ROAS and low CPA.
2. Review the campaigns targeting students to understand what contributes to their high conversion rate.
3. Evaluate Enterprise campaign targeting, messaging, and costs to identify potential improvements.
4. Continue monitoring New Customer acquisition to assess its efficiency and potential for growth.

*Note: These findings are based on synthetic campaign data created for analysis and are not real-world campaign results.*
