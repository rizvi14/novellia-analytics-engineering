# Analytics Engineering Assignment

## Approach
- Upon examining the goal of the exercise, my approach was to use the largest file so that I had sufficient sample data to glean insights from.
- I opted to use DuckDB because I have noticed it being a great local DB option that is performant and flexible with multiple file types.
- I don't have a whole lot of "pure" ETL experience from raw sources, so I was able to generate a script that took JSONs into DuckDB.
- I then scoped down my dbt project to only stage the resource types that would answer the questions, namely:
1. Patient
2. Observations
3. Diagnostic Reports
4. Immunizations

- Since only one of the questions necessitated a JOIN, I opted to not create any ***final*** analytical tables because the answers I needed were already available from the data in stg tables.

## Assumptions
- I assumed that the columns I generated in my stg models were the appropriate, primary reference columns for patient data.
