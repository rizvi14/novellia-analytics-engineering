# novellia-analytics-engineering
Novellia Analytics Engineering Assignment

**Instructions to run this assignment**
1. Clone the repo
2. Download the large sample file of data "sample-bulk-fhir-datasets-1000-patients' from [here](https://github.com/smart-on-fhir/sample-bulk-fhir-datasets/archive/refs/heads/1000-patients.zip).
3. Extract the contents of the zip into sample-bulk-fhir-datasets-1000-patients/
4. Create and activate a virtual environment by running the following in Terminal: `python3 -m venv venv source venv/bin/activate`
5. Run load.py in Terminal: `python 3 load.py`.
6. Configure `~/.dbt/profiles.yml` to point to the local `novellia.duckdb` file.
7. Run/build the dbt models while in the novellia/ dbt project folder. Run: `cd novellia` to get to the right directory. Then run `dbt build --select staging`.
8. Run the necessary Jupyter notebooks to see analysis work. Each Jupyter notebook's kernel needs to be restarted/interrupted if you want to run a different notebook.

**Steps taken to develop the repo**
1. Download files from the assignment and upload to repo for reader context
2. Created `.gitignore` to exclude large source data folder (`sample-bulk-fhir-datasets-1000-patients/`), the zip file, `.DS_Store`, and `.duckdb` database files to stay within GitHub limits
3. Added `.vscode/settings.json` to configure DuckDB viewer.
4. Connected local repo to GitHub remote and pushed branch.
5. Set up Python virtual environment (`venv/`) and installed `duckdb`.
6. Wrote `load.py` to ingest all NDJSON files from the source data folder into a local DuckDB database (`novellia.duckdb`), one table per FHIR resource type.
7. Initialized a dbt project (`novellia/`) using the `dbt-duckdb` adapter and configured `~/.dbt/profiles.yml` to point at the local DuckDB database.
8. Created `models/staging/sources.yml` declaring the 4 necessary FHIR tables as dbt sources, enabling staging models to reference them via `{{ source('fhir', '<table>') }}`
9. Wrote 4 staging models (`stg_patient`, `stg_immunization`, `stg_diagnosticreport`, `stg_observation`) to flatten nested FHIR JSON fields into clean, typed columns
10. Ran `dbt run --select staging` to build staging views in DuckDB
11. This is where my Claude use ceased - I am starting to now just use the staging views that I created to answer the questions directly via Jupyter notebook setup. I will not use Claude to double check my answers either.
12. Create tests since the assignment specifically asks for the project to include them.
13. Submit all answers within Jupyter notebooks with supporting queries.
14. Prepare to submit my Loom video, and also test anonymously to understand what the flow should look like if someone needs to download my repo and run it.