# Financial Transaction Risk & Fraud Analytics Platform

An end-to-end financial fraud analytics project that uses Python, PostgreSQL, SQL, anomaly detection, risk scoring, and Power BI to identify suspicious transactions and communicate actionable insights.

## Project Overview

Financial transaction fraud is difficult to detect because fraudulent activity represents a small proportion of total transactions. This project analyzes the PaySim simulated mobile-money transaction dataset, engineers risk indicators, assigns transaction risk levels, and visualizes fraud patterns through an interactive Power BI dashboard.

## Business Objectives

- Analyze transaction patterns and identify suspicious activity.
- Investigate fraud concentration across transaction types.
- Build a risk-scoring approach combining rule-based indicators and anomaly detection.
- Prioritize high-risk transactions for investigation.
- Communicate key findings through SQL analytics and Power BI.

## Technology Stack

- **Python:** Data cleaning, exploratory data analysis, feature engineering, and anomaly detection
- **Pandas:** Data manipulation and analysis
- **Jupyter Notebook:** Analysis and experimentation
- **PostgreSQL:** Transaction storage and analytical views
- **Docker Compose:** Local database environment
- **SQL:** Fraud aggregation, risk segmentation, and investigation queries
- **Power BI:** Interactive dashboards and business insights
- **Git and GitHub:** Version control

## Project Workflow

1. Profile and explore the PaySim dataset.
2. Engineer transaction-level risk indicators.
3. Apply rule-based checks and anomaly detection.
4. Assign risk scores and categorize transactions into Low, Medium, High, and Critical.
5. Load transaction data into PostgreSQL.
6. Create SQL views for executive metrics, fraud patterns, risk segmentation, and high-risk investigation.
7. Build a four-page Power BI dashboard.
8. Translate analytical findings into business recommendations.

## Dataset

The project uses the PaySim simulated mobile-money transaction dataset.

- **Total transactions:** 6,362,620
- **Labelled fraud transactions:** 8,213
- **Labelled fraud rate:** 0.1291%
- **Transaction types:** CASH_IN, CASH_OUT, DEBIT, PAYMENT, and TRANSFER

The full dataset and generated transaction-level output files are excluded from this repository because of their size. Obtain the dataset from its original source and place it in the local `data/` directory before running the analysis.

## Key Findings

- All 8,213 labelled fraud transactions in this dataset occur in TRANSFER and CASH_OUT transactions.
- The current risk-scoring approach classifies 69,647 transactions as High or Critical risk.
- High and Critical categories capture 99.60% of labelled fraud transactions.
- These categories capture approximately 99.90% of the transaction value associated with labelled fraud.

These are retrospective results on a simulated dataset. The value associated with labelled fraud should not be interpreted as confirmed financial loss, and the capture rate is not validated production performance.

## Power BI Dashboard

The report contains four pages:

1. **Executive Risk Overview** — Key transaction and fraud metrics.
2. **Fraud Patterns & Transaction Analysis** — Fraud patterns by transaction type, risk level, and simulated day.
3. **Risk Intelligence & Investigation** — Risk distribution, fraud value by risk level, and high-risk transaction details.
4. **Business Recommendations** — Key findings and recommended monitoring actions.

The Power BI report is included in `powerbi/fraud analysis.pbix`.

## Repository Structure

```text
financial-transaction-risk-fraud-analytics/
├── data/                       # Local datasets; excluded from Git
├── notebooks/
│   └── 01_data_profiling.ipynb
├── outputs/                    # Generated outputs; excluded from Git
├── powerbi/
│   └── fraud analysis.pbix
├── sql/
│   └── fraud_analytics.sql
├── .env.example
├── .gitignore
├── docker-compose.yml
└── README.md
```

## Getting Started

### Prerequisites

- Python 3.10 or compatible version
- Docker Desktop with Docker Compose
- PostgreSQL-compatible client
- Power BI Desktop (Windows)

### 1. Clone the repository

```bash
git clone https://github.com/Preetam-13/financial-transaction-risk-fraud-analytics.git
cd financial-transaction-risk-fraud-analytics
```

### 2. Configure the environment

Create a local `.env` file based on the example:

```powershell
Copy-Item .env.example .env
```

Edit `.env` and set a local PostgreSQL password. Do not commit `.env`.

### 3. Start PostgreSQL

```bash
docker compose up -d
```

The database is configured for local development on port `5433`. If you change the password after a database volume has already been initialized, remember that changing the environment variable alone does not change the existing PostgreSQL user's password.

### 4. Run the analysis

Obtain the PaySim dataset from its original source and place it in `data/`. Open `notebooks/01_data_profiling.ipynb` in Jupyter Notebook or VS Code and follow the analysis.

Additional data-processing and risk-scoring steps may be required before the complete transaction table and SQL views can be recreated.

### 5. Explore the SQL analysis

Run the queries in `sql/fraud_analytics.sql` against your locally populated PostgreSQL database, adjusting the connection settings and table setup as needed.

### 6. Open the Power BI report

Open `powerbi/fraud analysis.pbix` in Power BI Desktop. If prompted, configure the PostgreSQL connection for your local environment and refresh the data.

## Limitations

- PaySim is a simulated dataset and does not represent a live financial institution's transactions.
- Risk thresholds and anomaly detection results depend on the project's features and configuration.
- High fraud capture may come with false positives; precision, recall, and investigation workload should be assessed before deployment.
- The project is an analytical prototype, not a production fraud prevention system.

## Future Improvements

- Add precision, recall, F1-score, and ROC-AUC evaluation.
- Tune risk thresholds using a validation dataset.
- Evaluate false positives and investigation capacity.
- Automate data ingestion and model evaluation.
- Add repeatable environment setup and testing.

## Author

**Preetam Yadav**

Computer Science Engineering | Data Analytics | Fraud Analytics | Machine Learning