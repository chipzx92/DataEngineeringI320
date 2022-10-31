# Requirements for Saturday Night Live

## Overview
You have been given a set of CSV files containing data on the TV show Saturday Night Live.  The data originally comes from the http://www.snlarchives.net website, via the https://github.com/hhllcks/snldb repo.

Your client is a journalist who wishes to explore questions about the show in a retrospective article. 

## Requirements
Your task is to analyze the data and present a dashboard that answers the following questions (using data products):

1. Which actors have appeared the most times?
    * in any capacity?
    * as host?

2. How has the number of segments in each episode changed over time?

3. How has the ratio of female to male appearances changed over time?
    * for cast members
    * for hosts
    * for all appearances

Come up with another interesting question and answer that you can get from the data that you think 
the journalist might want to write about?

## Project Details
Use the `music_festival` project as a reference (in `projects/music_festival`) for the files and content that you need.

Use the `320d_project_report_template.ipynb` as the basis for your project report. Make a copy in your project folder (and rename to match your project).

The name of your project is `sat_night_live`. In your [Jupyter notebook](https://notebook.dei320.net) under the
`projects` directory, you will find the `sat_night_live` project. There is a `data` directory with your CSV 
files and a `src` directory where you will write your code.

You have 5 CSV files:

* **seasons.csv** — All the seasons of SNL, including the year they were broadcast.
* **episodes.csv** — All the episodes of SNL, showing when they aired, which season they belonged to and the order they were shown in.
* **segments.csv** — All the segments in which actors appeared, together with the order the segments were shown in.  On the archive site these are known as 'titles' but that was confusing for non-SNL afficionados so it was renamed to `segment`.
* **appearances.csv** — A row for each time an actor appears in a segement, together with a name (if any) for the role, whether it was a speaking part, and whether the actor was (at this time) a cast member, guest, music act etc (the `capacity` in which the actor appeared).
* **actors.csv** — All the actors that have appeared in SNL segments, together with their gender.

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
