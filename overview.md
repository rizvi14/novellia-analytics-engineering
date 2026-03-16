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
- I assumed that I only needed 4 source tables based on the types of questions in the assignment. I then identified those resource types independently.
- I assumed that the non_null and unique primary key tests were the only critical dbt tests to write on these tables.

## Tradeoffs
- I didn't opt for a "direct on file" querying method because I wanted to gain the experience of deploying / virtualizing a DB. This also gave me increased clarity and formal separation between each of the steps.
- I ***prefer*** working in Deepnote for open source notebook-based analyses, but it would have required setting up all the data in the Deepnote environment since it doesn't have a native DuckDB integration.
- I remained at the staging layer in dbt since the questions in the analysis didn't necessitate the need for any big pre-aggregations.