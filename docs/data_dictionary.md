# Raw events data dictionary

| Field | Snowflake type | Description |
|---|---|---|
| event_id | VARCHAR | Event identifier; duplicate IDs may appear |
| user_id | VARCHAR | Anonymous visitor ID, available before account creation |
| session_id | VARCHAR | Session identifier |
| event_name | VARCHAR | One of four registration events |
| event_timestamp | TIMESTAMP_NTZ | UTC event time |
| event_date | DATE | Calendar date of event |
| device_category | VARCHAR | mobile, desktop, or missing |
| traffic_source | VARCHAR | Acquisition source |
| platform | VARCHAR | web |

Synthetic events are not observed business results. Event counts do not equal deduplicated users or conversion rates.
