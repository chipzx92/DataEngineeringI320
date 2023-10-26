# Requirements for IMDB Ratings Project

## Overview
You have been given a set of CSV files from the IMDB (Internet Movie DataBase) for the following movie
genres:
- Drama
- Crime
- Mystery
- War
- Film Noir

Your data files contain the titles, the genres of those movies, and the directors, actresses, and 
actors in those movies. The IMDB marketing VP would like to know what were the highest rated movies 
of the last decade, what directors, actresses, and actors had the highest average rating for their 
movies, and what the highest rated movies in each genre were.

## Requirements
Determine a cutoff for the minimum number of votes for ranking a movie (based on the assumption that 
the more votes a movie gets, the more popular it is). Justify your answer.

All of the following questions should be answered using the cutoff value for the minimum number of
votes.

1. What are the top 10 highest rated movies for the last 5 years?  
2. What directors (with at least 3 movies) have the highest average rating?    
3. What actresses (with at least 3 movies) have the highest average rating? 
4. Pick 5 famous actors or actresses and rank them by average_rating of their movies.
5. What are the 3 highest rated movies in each genre for those 5 famous actors/actresses?  

Come up with another interesting question and answer that you can get from the data that you think 
the marketing VP should know.

## Project Details
The name of your project is `imdb`. In your [Jupyter notebook](https://notebook.dei320.net) under the
`projects` directory, you will find the `imdb_drama` project. There is a `data` directory with your CSV 
files and a `src` directory where you will write your code.

You have 5 CSV files:
* **imdb_titles** - Titles of movies released between 2000 and 2022.
* **imdb_title_ratings** - Ratings of all movie titles.
* **imdb_title_genres** - The genre(s) for each movie title.
* **imbd_person_title_roles** - The directors, actresses, and actors for each title.
* **imdb_genres** - The genres for these films

## Project Steps
Use the `music_festival` project as a reference (in `projects/music_festival`) for the files and content that you need.

Use the `320d_project_report_template.ipynb` as the basis for your project report. Make a copy in your project folder (and rename to match your project).

For your project, you will need to do each of these steps:
1. Create your staging tables.
   * Create an concrete data example from the data.
   * Create a conceptual E-R diagram of the staging tables.
   * Create a physical E-R diagram of the staging tables.
   * Write the CREATE TABLE statements for the staging tables.
   * Run the script to execute the CREATE TABLE statements.
2. Load the data from the CSV files into your staging tables.
   * Write the \copy commands to load the CSV files into the staging tables.
   * Run the script to execute the \copy commands.
3. Create your dimensional model (star schema).
   * Identify the fact(s) in your data and the grain of the data.
   * Create the transformation diagram.
   * Create a concrete example of the star schema data.
   * Create a conceptual E-R diagram of the star schema.
   * Create a physical E-R diagram of the star schema.
   * Write the dbt model files to create the star schema.
4. Create your data products.
   * Decide what data products you need to create to answer the questions in the requirements.
   * Write the dbt model files to create the data products.
5. Create reports and visualizations that answer the questions posed in the requirements.
   * You should have a mix of tabular reports and charts - use whatever is most appropriate to answer the questions.
