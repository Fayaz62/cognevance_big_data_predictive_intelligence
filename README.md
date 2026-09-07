# Big Data Analytics & Predictive Intelligence

**Domain:** E-commerce / Customer Analytics
**Author:** Shaik Fayaz Ahammaed
**Program:** Data Science & Data Analytics Internship — Cognevance Technologies

## Overview

This project builds a complete analytics pipeline over a large-scale customer
transactions dataset — from raw data through feature engineering, SQL-based
business intelligence, a predictive churn model, and an executive dashboard.

## Project Architecture

```
cognevance_big_data_predictive_intelligence/
├── dataset/
│   ├── customer_transactions.csv     # 4,000 transactions, 1,148 customers
│   └── customer_rfm_features.csv     # Engineered RFM features per customer
├── sql/
│   └── analytics_queries.sql         # 10 business-intelligence queries
├── notebook/
│   └── predictive_model.ipynb        # Feature engineering + model training
├── dashboard/
│   ├── dashboard_interactive.html    # Interactive dashboard (Plotly — hover/zoom/filter)
│   └── dashboard_full.png            # Static executive dashboard (Matplotlib)
├── report/
│   └── Big_Data_Analytics_Report.pdf # Full project report
├── model_results.json                # Model evaluation metrics
└── requirements.txt
```

## Workflow

1. **Data Collection** — Generated a large-scale, realistic e-commerce
   transactions dataset (4,000 transactions across 1,148 customers, 8 cities,
   7 product categories, 18 months of activity).
2. **Feature Engineering** — Computed RFM (Recency, Frequency, Monetary)
   features per customer, plus average order value, category diversity, and
   demographics.
3. **SQL Analytics** — Wrote 10 business-intelligence queries covering
   revenue trends, category performance, customer segmentation, churn
   identification, and high-value customer detection.
4. **Predictive Modeling** — Trained a Random Forest classifier to predict
   customer churn (no purchase in 180+ days), evaluated with ROC-AUC,
   precision, recall, and F1-score.
5. **Dashboard** — Built an executive dashboard visualizing KPIs, revenue
   trends, category/city performance, churn distribution, and model feature
   importance.
6. **Reporting** — Compiled findings into a business-facing PDF report with
   recommendations.

## Key Results

| Metric | Value |
|---|---|
| Total Revenue | ~Rs 16.3M |
| Transactions | 4,000 |
| Unique Customers | 1,148 |
| Churn Rate | 29.5% |
| Model | Random Forest Classifier |
| ROC-AUC | 0.708 |
| Precision (Churn) | 0.53 |
| Recall (Churn) | 0.46 |

## Tools Used

Python (Pandas, NumPy, Scikit-learn, Matplotlib), SQL, RFM Analysis,
Random Forest, Business Intelligence Dashboarding

## Note on the Dashboard

Two dashboard versions are included:
- **`dashboard_interactive.html`** — a real interactive dashboard (built with
  Plotly) with hover tooltips, zoom, and pan, viewable by opening the file
  directly in any browser — no server required.
- **`dashboard_full.png`** — a static snapshot (Matplotlib) of the same KPIs
  and charts, for quick preview without opening a browser.

Both were generated programmatically in Python rather than in Power BI/Tableau,
to keep the full pipeline reproducible from source. The KPIs, charts, and
layout follow standard BI-dashboard conventions and are driven by the same
underlying data and model results documented in this repo.

## Business Recommendations

- **Target the 29.5% churn segment** with re-engagement campaigns —
  recency and low order frequency are the strongest churn predictors.
- **Electronics and Home & Furniture** drive the largest share of revenue —
  prioritize inventory and marketing spend accordingly.
- **Hyderabad and Mumbai** are the top-performing markets — consider
  city-specific promotions to replicate this performance in lower-revenue
  cities.
- **Monetary value and purchase frequency** are the top two churn
  predictors — a loyalty/rewards program targeting mid-frequency customers
  could reduce churn before it happens.
