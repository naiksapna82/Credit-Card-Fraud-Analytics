# Credit Card Fraud Analytics | Excel, SQL & Power BI

### Identifying Unusual Spending Behaviour and Prioritising Fraud Risk

**Business Analytics Capstone Project | December 2019 Transaction Data**

## Executive Summary

Analysed **42,308 credit card transactions** to identify unusual spending patterns, assess fraud exposure across merchant categories, and translate transaction-level data into actionable fraud-monitoring recommendations.

The project combines statistical analysis in Microsoft Excel, SQL-based data exploration and validation, and interactive visualisation using Power BI.

### Key Results

| Metric | Finding |
|---|---|
| Transactions analysed | 42,308 |
| Total transaction value | 2,966,148.83 |
| Flagged fraudulent transactions | 180 |
| Overall observed fraud rate | 0.43% |
| Highest-risk category | Online shopping |
| Online shopping fraud rate | 1.30% |
| Share of flagged transaction value from online shopping | Approximately 44% |

## Business Problem

Financial institutions need to identify suspicious transaction behaviour while allocating fraud-monitoring resources efficiently.

This project examines historical transactions to answer three questions:

1. Which spending categories exhibit elevated observed fraud rates?
2. How do transaction amounts, customer attributes and geographical patterns differ?
3. How can analytical findings support risk-based monitoring and fraud-prevention decisions?

## Tools and Techniques

**Microsoft Excel:** Descriptive statistics, pivot tables, correlation analysis, transaction segmentation and AI-assisted risk summaries.

**MySQL:** Data exploration, aggregation, merchant analysis, fraud-rate calculations, joins and data-quality validation.

**Power BI:** Transaction dashboards, spending distributions, category comparisons and geographical visualisations.

## Key Business Insights

### 1. Online shopping requires greater monitoring attention

Online shopping recorded 42 flagged transactions and an observed fraud rate of 1.30%, compared with the overall rate of 0.43%.

It also accounted for approximately 44% of flagged transaction value.

### 2. Fraud risk varies across categories

In-store grocery recorded a 0.94% observed fraud rate, while miscellaneous online purchases recorded 0.91%.

These categories warrant closer investigation alongside online shopping.

### 3. High spending does not necessarily indicate fraud

Travel had the highest average transaction amount at 121.69, but its observed fraud rate was relatively low at 0.15%.

This illustrates why transaction size alone is insufficient for risk classification.

### 4. Data quality affects analytical reliability

Only 187 transactions, or 0.44% of the dataset, could be matched to coordinates through the separate location file.

The issue was associated with card identifiers stored in shortened scientific notation, limiting reliable geographical analysis using that join.

## Business Recommendations

- Prioritise risk-based authentication and transaction monitoring for categories with elevated observed fraud rates.
- Investigate transaction-frequency spikes, unusual spending amounts and suspicious merchant activity.
- Improve identifier preservation and data-quality controls before combining transaction and location datasets.
- Validate proposed monitoring rules against false positives, fraud losses and additional historical periods before deployment.

## Project Scope and Limitations

This is a historical descriptive analytics project, not a deployed fraud-detection system.

The analysis does not establish predictive model accuracy, quantify realised fraud prevention or demonstrate production-level real-time detection.

## Portfolio Focus

**Core competencies demonstrated:** Data exploration, SQL querying, statistical analysis, data validation, dashboard development, risk assessment and business recommendations.