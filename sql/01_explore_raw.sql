-- Run after loading CSV into FLOWSPACE_ANALYTICS.RAW.SIGNUP_EVENTS.
SELECT COUNT(*) AS total_rows,
       COUNT(DISTINCT event_id) AS distinct_event_ids,
       COUNT(DISTINCT user_id) AS distinct_users
FROM FLOWSPACE_ANALYTICS.RAW.SIGNUP_EVENTS;

SELECT event_name, COUNT(*) AS event_rows,
       COUNT(DISTINCT user_id) AS unique_users
FROM FLOWSPACE_ANALYTICS.RAW.SIGNUP_EVENTS
GROUP BY event_name ORDER BY event_name;

SELECT device_category, COUNT(*) AS event_rows
FROM FLOWSPACE_ANALYTICS.RAW.SIGNUP_EVENTS
GROUP BY device_category ORDER BY event_rows DESC;

SELECT event_id, COUNT(*) AS occurrences
FROM FLOWSPACE_ANALYTICS.RAW.SIGNUP_EVENTS
GROUP BY event_id HAVING COUNT(*) > 1
ORDER BY occurrences DESC, event_id;

SELECT MIN(event_timestamp) AS earliest_event,
       MAX(event_timestamp) AS latest_event
FROM FLOWSPACE_ANALYTICS.RAW.SIGNUP_EVENTS;
