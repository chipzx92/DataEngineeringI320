# Requirements for Olympic Games Project

## Overview
You have been given a set of CSV files containing the results for all Olympic events since 1896. 
The Olympics CTO has been asked to provide some statistics about the countries, teams, and athletes
to the board of the International Olympic Committee (IOC). 

## Requirements
The Olympic CTO and her staff would like to you to analyze Olympic event results and answer the
following questions:

1) What country scored the most points:
   * Overall, i.e., in all olympic games (top 3)
   * in each of the last 5 Olympic Games
2) What country has take the most gold medals:
   * Overall (top 3)
   * In each of the last 5 Olympic Games
3) What teams have won the most medals (all medals):
    * Overall (top 3)
    * In each the last 5 Olympic games
4) What athletes have won the most medals? (top 10)

Come up with another interesting question and answer that you can get from the data that you think 
the CTO should know.

## Project Details
Use the `music_festival` project as a reference (in `projects/music_festival`) for the files and content that you need.

Use the `320d_project_report_template.ipynb` as the basis for your project report. Make a copy in your project folder (and rename to match your project).

The name of your project is `olympics`. In your [Jupyter notebook](https://notebook.dei320.net) under the
`projects` directory, you will find the `olympics` project. There is a `data` directory with your CSV 
files and a `src` directory where you will write your code.

You have 5 CSV files:
* **olympics.csv** - Contains the name, year, season, and city of every Olympic Games since 1896.
* **olympic_teams.csv** - Contains all the teams and countries that have participated in the Olympics.
* **olympic_events.csv** - Contains all the events that have been competed in in the Games.
* **olympic_athletes.csv** - Contains all the athletes who have participated in Olympic events.
* **olympic_event_results.csv** - Contains the results of all of the events in the Games.

Scores are awarded as follows for medals:
Gold - 3 points
Silver - 2 points
Bronze - 1 point

## Project Steps
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
