# Requirements for Austin Animal Center Outcomes Project

## Overview
You have been given a set of CSV files listing the animals that have been taken into the Austin
Animal Center (AAC) over the years that show the animal id, name, intake date, outcome date, and the
outcome type and subtype. An outcome occurs when the animal leaves the shelter for any reason -
for example, the animal is adopted or the owner reclaims a stray animal.

## Requirements
The AAC shelter director and her staff would like to you to analyze the outcome data to help them
answer the following questions:

1) What is the average number of days in AAC for an animal? 
* By animal type 
* By animal type and breed
* By year by animal type
2) How many animals come into AAC every year, and how many go out?
3) What are the 3 busiest months (by number of intakes) and what are the 3 slowest months.

## Project Details
The name of your project is `aac`. In your [Jupyter notebook](https://notebook.dei320.net) under the
`projects` directory, you will find the `aac` project. There is a `data` directory with your CSV 
files and a `src` directory where you will write your code.

You have 4 CSV files:
* **animals.csv** - Contains the id, name, type, breed, and color of the animals that have come to AAC.
* **animal_outcomes.csv** - Contains the intake and outcomes dates and outcome type/subtype code for each animal.
* **outcome_types.csv** - Contains the outcome type codes.
* **outcome_subtypes.csv** - Contains the outcome subtype codes.

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