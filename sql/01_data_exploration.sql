-- Assignment 03: Initial Data Exploration
-- Project: FlowSpace Signup Funnel Analysis

-- Question 1: Total event records
SELECT
    COUNT(*) AS total_events
FROM read_csv_auto('data/raw/flowspace_signup_events.csv');


-- Question 2: Unique users
SELECT
    COUNT(DISTINCT user_id) AS unique_users
FROM read_csv_auto('data/raw/flowspace_signup_events.csv');


-- Question 3: Event counts by signup stage
-- My original query
SELECT
    event_name,
    COUNT(event_id) AS event_count
FROM read_csv_auto('data/raw/flowspace_signup_events.csv')
GROUP BY event_name;
