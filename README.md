# FlowSpace — Sign-Up Conversion Funnel Analysis

**Role:** Product Analyst | **Stack:** Snowflake, dbt, SQL, Python

## Business problem
A fictional productivity web app wants to understand where users abandon registration and whether conversion differs between mobile and desktop. This portfolio exercise uses **synthetic data**, not actual company results.

## Questions
1. Of users who start registration in September 2026, what proportion complete within 24 hours?
2. Which funnel transition has the largest drop-off?
3. How does conversion differ between mobile and desktop?

## Funnel
`signup_page_viewed` → `signup_started` → `signup_details_submitted` → `signup_completed`

## Definitions
- Cohort: first registration start per anonymous visitor in September 2026.
- Conversion: valid completion after the preceding funnel steps, within 24 hours of registration start.
- Funnel steps are ordered by timestamps; duplicate event IDs must not inflate counts.
- Device is attributed at registration start; missing values become `unknown`.
- Event timestamps are treated as UTC. Events on October 1 may complete September 30 starts.
- Some data is intentionally inconsistent; audit anomalies rather than quietly discarding them.

## Repository layout
- `data/raw/`: synthetic CSV
- `scripts/`: local CSV validation
- `sql/`: Snowflake exploration queries
- `dbt/`: dbt project (to be initialized after environment setup)
- `analysis/`: outputs and charts
- `docs/`: data dictionary and methodology

## Local validation
From the repository root: `python3 scripts/validate_csv.py`

## Next steps
Initialize dbt locally, then create a Snowflake trial, load raw events, and build staging/intermediate/mart models with tests. Export final results before the trial ends.
