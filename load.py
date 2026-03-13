import duckdb
import glob
import os

DATA_DIR = "sample-bulk-fhir-datasets-1000-patients"
DB_PATH = "novellia.duckdb"

con = duckdb.connect(DB_PATH)

# Find all unique resource types (e.g., Patient, Encounter, Observation)
ndjson_files = glob.glob(os.path.join(DATA_DIR, "*.ndjson"))
resource_types = set()
for f in ndjson_files:
    filename = os.path.basename(f)
    if filename == "log.ndjson":
        continue
    resource_type = filename.split(".")[0]
    resource_types.add(resource_type)

for resource_type in sorted(resource_types):
    # Glob pattern to pick up all files for this resource type (e.g., Observation.000, Observation.001, ...)
    pattern = os.path.join(DATA_DIR, f"{resource_type}.*.ndjson")
    files = sorted(glob.glob(pattern))

    table_name = resource_type.lower()
    con.execute(f"DROP TABLE IF EXISTS {table_name}")
    con.execute(f"""
        CREATE TABLE {table_name} AS
        SELECT * FROM read_ndjson_auto({files})
    """)

    count = con.execute(f"SELECT COUNT(*) FROM {table_name}").fetchone()[0]
    print(f"Loaded {table_name}: {count} rows")

con.close()
print(f"\nDatabase saved to {DB_PATH}")
