# Requirements for WTA (Women's Tennis Association) Project

## Overview
You have been provided with a collection of CSV files containing information about tennis matches
between players in the Women's Tennis Association from 2020-2023. The files contain the players, their matches,
their rankings week by week, and the different types of tournaments they play in.

## Requirements
The IT Director for the WTA would like to get the following information to prepare for the 2024
tour season:

1. What players have risen the most in rank from 2020 to the present in each tourney level?

2. What players have fallen the furthest in rank from 2020 to the present in each tourney level?

3. What players have won the most matches in each tourney level?

4. What countries have the best winning percentage in each tourney level?

5. Who wins more matches (as a percentage) - left-handed players or right-handed players?

6. Who wins more matches by age, as a percentage (round the age to an integer)? Can we determine if there is a range of years where players are in their prime or not?

Come up with another interesting question and answer that might help the IT Director with their research.

## Project Details
The name of your project is wta. In your Jupyter notebook under the projects directory, you will find the wta project. 
There is a data directory with your CSV files and a src directory where you will write your code.

You have 5 CSV files:
* **wta_matches.csv**
* **wta_players.csv**
* **wta_rankings.csv**
* **wta_rankings_current,csv**
* **wta_tourney_levels.csv**

## Project Steps 
Use the `music_festival` project as a reference (in `projects/music_festival`) for the files and content that you need.

Use the `320d_project_report_template.ipynb` as the basis for your project report. Make a copy in your project folder (and rename to match your project).

The name of your project is `dwts`. In your [Jupyter notebook](https://notebook.dei320.net) under the
`projects` directory, you will find the `dwts` project. There is a `data` directory with your CSV 
files and a `src` directory where you will write your code.

For your project, you will need to do each of these steps:
1) Create your staging tables.
   * Create an concrete data example from the data.
   * Create a conceptual E-R diagram of the staging tables.
   * Create a physical E-R diagram of the staging tables.
   * Write the CREATE TABLE statements for the staging tables.
   * Run the script to execute the CREATE TABLE statements.
2) Load the data from the CSV files into your staging tables.
   * Write the \copy commands to load the CSV files into the staging tables.
   * Run the script to execute the \copy commands.
3) Create your dimensional model (star schema).
   * Identify the fact(s) in your data and the grain of the data.
   * Create the transformation diagram.
   * Create a concrete example of the star schema data.
   * Create a conceptual E-R diagram of the star schema.
   * Create a physical E-R diagram of the star schema.
   * Write the dbt model files to create the star schema.
4) Create your data products.
   * Decide what data products you need to create to answer the questions in the requirements.
   * Write the dbt model files to create the data products.
5) Create reports and visualizations that answer the questions posed in the requirements.
   * You should have a mix of tabular reports and charts - use whatever is most appropriate to answer the questions.

