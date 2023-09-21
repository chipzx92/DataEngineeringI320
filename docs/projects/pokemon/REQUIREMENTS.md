# Requirements for Pokemon Project

## Overview
You have been provided with a collection of CSV files containing information about all 802 Pokemon spanning Seven Generations of the Pokemon Series. These files encompass information such as the fundamental statistics of Pokemon, their effectiveness against different types, dimensions, weight, egg steps, capture rates, and more.

## Requirements
Professor Oak is currently involved in research to uncover fascinating insights about Pokemon from various generations. Your role is to aid in analyzing the data to provide answers to the following questions:

1. Display the top 3 most frequently occurring primary Pokemon types, and determine the count of Pokemon without secondary types.
   
2. Identify the most common primary types among Legendary Pokemon.
   
3. Determine which generation has the lowest average catch rate and which has the highest average catch rate. 
   
4. Find the type of Pokemon that is easiest and hardest to catch.
   
5. Discover the heaviest and tallest Pokemon, and determine how many of them are legendary.
   
6. Identify the top 10 Pokemon with the highest base total stats and determine which of them are weak to ice type Pokemon. 

Come up with another interesting question and answer that might help Professor Oak with his research.

## Project Details
The name of your project is pokemon. In your Jupyter notebook under the projects directory, you will find the pokemon project. There is a data directory with your CSV files and a src directory where you will write your code.

You have 4 CSV files:
* **pokemon.csv**
* **pokemon_capture_stats.csv**
* **pokemon_stats.csv**
* **pokemon_type_advantage.csv**

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

