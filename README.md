# thc-analytics

## Overview

The current challenge has the goal of creating a fluid pipeline that cleans and process Orders and Sales data to answer the following business questions:

1) What is the number of orders in year 2026?
2) What is the number of orders per month in year 2026?
3) What is the average number of products per order for each month of the year 2026?
4) Create a table for orders in years 2025 & 2026 with a column that gives the quantity of products in the order.
5) Segment order into 3 groups: New, Returning & VIP
6) Create a table that has an additional column with the order segmentation.
7) Portray the semantic layer for LookML: Model, View and Explore files.

Link to the THC Marketing Dashboard on Data Studio: https://datastudio.google.com/s/tf0Ciqqel6w

## Setup & Installation

### Prerequisites

The following where used to run the project:
* **VS Code**: As IDE with the **dbt Power User** extension installed
* **Google Cloud Platform (GCP)**: Access to a GCP project with BigQuery enabled
* **GCP Service Account Key**: A JSON key file with BigQuery Admin / Data Editor permissions

---

## Local Environment Setup

- **Clone the repository:**
   ```bash
   git clone [https://github.com/franborgesd/thc-analytics.git](https://github.com/franborgesd/thc-analytics.git)
   cd thc-analytics
'''

- Install dependencies:
```bash
pip install dbt-bigquery
```

## Pipeline Architecture:
The pipeline follows an ELT architecture structured to automate the operations, be easily reproduced and avoid big operational overhead.

### Core Design Principles

1. **In-Warehouse Transformation (ELT)**: Computations are offloaded to Google BigQuery, utilizing its cloud-native compute capacity rather than transforming data locally.
2. **Modular dbt DAG**: Data models are structured in incremental layers (Staging → Intermediate → Marts). Dependencies are managed automatically enabling a single `dbt run` execution.
3. **Idempotent Operations**: Models use declarative SQL targets to ensure running the pipeline multiple times produces consistent, deterministic results without risk of duplicate entries.
4. **Direct Analytics Consumption**: The finalized reporting marts feed Data Studio directly, delivering pre-aggregated, business-ready datasets that require zero manual joins or custom queries.

