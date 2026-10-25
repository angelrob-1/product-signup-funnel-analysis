import duckdb
import sys
from pathlib import Path

# Select which query to run
query_number = int(sys.argv[1])

# Read the SQL file
sql_file = Path("sql/01_data_exploration.sql")
sql_text = sql_file.read_text()

# Separate queries by semicolon
queries = [
    query.strip()
    for query in sql_text.split(";")
    if query.strip()
]

# Execute the selected query
query = queries[query_number - 1]

result = duckdb.sql(query)
print(result)