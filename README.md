# novellia-analytics-engineering
Novellia Analytics Engineering Assignment

Steps taken to develop the repo
1. Download files from the assignment and upload to repo for reader context
2. Created `.gitignore` to exclude large source data folder (`sample-bulk-fhir-datasets-1000-patients/`), the zip file, `.DS_Store`, and `.duckdb` database files to stay within GitHub limits
3. Added `.vscode/settings.json` to configure DuckDB viewer for `.parquet`, `.csv`, and `.tsv` files
4. Connected local repo to GitHub remote and pushed branch
5. Set up Python virtual environment (`venv/`) and installed `duckdb`
6. Wrote `load.py` to ingest all NDJSON files from the source data folder into a local DuckDB database (`novellia.duckdb`), one table per FHIR resource type