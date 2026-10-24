"""Validate source file without third-party dependencies."""
import csv
from collections import Counter
from pathlib import Path

path = Path(__file__).resolve().parents[1] / 'data/raw/flowspace_signup_events.csv'
required = {'event_id','user_id','session_id','event_name','event_timestamp',
            'event_date','device_category','traffic_source','platform'}
with path.open(newline='', encoding='utf-8') as f:
    reader = csv.DictReader(f)
    assert required.issubset(reader.fieldnames or []), 'Missing expected columns'
    rows = list(reader)
print('Rows:', len(rows))
print('Unique visitors:', len({r['user_id'] for r in rows}))
print('Event counts:', dict(Counter(r['event_name'] for r in rows)))
print('Duplicate event IDs (extra rows):', len(rows)-len({r['event_id'] for r in rows}))
print('Missing devices:', sum(not r['device_category'] for r in rows))
assert len(rows) > 0
