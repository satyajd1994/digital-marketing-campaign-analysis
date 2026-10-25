# Digital Marketing Campaign Performance Analysis

## Project Overview

This project analyzes digital marketing campaign performance using SQL to evaluate advertising effectiveness, audience engagement, conversion efficiency, and marketing spend.

The objective is to identify high-performing campaigns, compare marketing channels, and develop data-driven recommendations for improving campaign performance.

**Tools:** SQL, Excel concepts, GitHub

**Dataset:** Synthetic campaign data created for portfolio and SQL practice purposes.

## Business Objectives

- Compare performance across marketing channels.
- Measure impressions, clicks, and conversions.
- Calculate Click-Through Rate (CTR).
- Calculate Conversion Rate.
- Evaluate Cost Per Acquisition (CPA).
- Measure Return on Ad Spend (ROAS).
- Identify high-performing and underperforming campaigns.
- Recommend opportunities to improve marketing efficiency.

## Key Performance Indicators

| KPI | Definition |
|---|---|
| CTR | Clicks / Impressions × 100 |
| Conversion Rate | Conversions / Clicks × 100 |
| CPC | Ad Spend / Clicks |
| CPA | Ad Spend / Conversions |
| ROAS | Attributed Revenue / Ad Spend |

## Project Structure

- `README.md` — Project documentation
- `data/campaign_data.csv` — Synthetic campaign dataset
- `sql/01_campaign_performance.sql` — Campaign-level analysis
- `sql/02_channel_analysis.sql` — Marketing channel comparison
- `sql/03_campaign_ranking.sql` — Campaign ranking and advanced analysis
- `insights.md` — Findings and business recommendations

## Important Note

This project uses synthetic data. Any findings and recommendations will be based on the sample data and are not claims about actual advertising campaigns.

## Project Results and Key Insights

This project analyzes a synthetic digital marketing dataset containing 10,000 records across multiple advertising channels, audience segments, devices, countries, and campaigns.

### Overall Performance

| KPI | Result |
|---|---:|
| Total Records Analyzed | 10,000 |
| Total Impressions | 596.87 million |
| Total Clicks | 27.98 million |
| Total Conversions | 2.44 million |
| Total Ad Spend | 35.80 million |
| Total Revenue | 347.67 million |
| Click-Through Rate (CTR) | 4.69% |
| Conversion Rate | 8.73% |
| Cost per Acquisition (CPA) | 14.66 |
| Return on Ad Spend (ROAS) | 9.71x |

*Currency was not specified in the dataset, so financial figures are presented without a currency symbol.*

### Key Findings

- **Channel performance:** Email Marketing achieved the highest channel-level ROAS at 96.85x in the dataset.
- **Monthly performance:** April recorded the highest monthly ROAS at 10.76x.
- **Device performance:** Tablets achieved the highest device-level ROAS at 10.33x.
- **Audience performance:** Returning Customers had the highest audience-level ROAS at 10.03x.
- **Country performance:** The United States recorded the highest country-level ROAS at 10.21x.
- **Top campaign:** Seasonal Newsletter (C015) achieved a ROAS of 104.42x.
- **Campaign requiring investigation:** Lead Generation (C006) had the lowest campaign-level ROAS at 2.96x and a CPA of 48.67.

### Tools and Skills Demonstrated

- SQL querying and aggregation
- KPI calculations using CTR, conversion rate, CPA, and ROAS
- Campaign, channel, audience, device, country, and monthly analysis
- Campaign ranking and performance comparison
- Business insight generation and recommendations
- GitHub repository management and documentation

### Project Limitations

The dataset is synthetic and intended for learning and portfolio demonstration. The findings do not represent actual business results. ROAS measures revenue relative to advertising spend and does not independently establish profitability.

### Repository Contents

- `data/` — Marketing campaign dataset
- `sql/` — SQL queries for performance analysis
- `insights.md` — Detailed findings and recommendations


