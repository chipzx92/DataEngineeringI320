# Requirements for Dancing With The Stars Project

## Overview
You have been given a set of CSV files containing data on the US TV 'Dancing with the Stars'. The data was collected from Wikipedia (e.g., [DWTS Season 24](https://en.wikipedia.org/wiki/Dancing_with_the_Stars_(American_season_24)). In this show individual celebrities are matched up with a professional ballroom dancer and have to learn ballroom dances each week. Each dance is scored by multiple judges (usually three, sometimes more).

Your client is a journalist who wishes to explore questions about the show in a retrospective article. The topics include judges scoring tendancies, the success of different dance styles, and the strength of different dancing professionals through the 31 seasons for which data is available.

## Requirements
Your task is to analyze the data and present a dashboard that answers the following questions (using data products):

1. What elements have been the most popular over time?
    * Which dance-styles (e.g., Cha-cha-cha or Tango) have been danced the most, across the competition?
    * Whose music is most used in the show?
    * Which songs are the most popular over time?
    * Who are the 5 most frequent non-regular judges?

2. How do scores vary over the weeks, as the competition narrows towards the more competitive couples?
    * Show this for each season; do any stand out?

3. How do scores from regular judges vary?
    * Are some regular judges harsher than others?
    * Are some dance-styles (e.g., Cha-cha-cha or Tango) judged more harshly?

4. Which competitors have received the highest average scores?
    * Which professionals?
        * Overall
        * In each season
    * Which celebrities?
        * Overall
        * In their first season

Come up with another interesting question and answer that you can get from the data that you think 
the journalist might want to write about?

## Project Details
Use the `music_festival` project as a reference (in `projects/music_festival`) for the files and content that you need.

Use the `320d_project_report_template.ipynb` as the basis for your project report. Make a copy in your project folder (and rename to match your project).

The name of your project is `dwts`. In your [Jupyter notebook](https://notebook.dei320.net) under the
`projects` directory, you will find the `dwts` project. There is a `data` directory with your CSV 
files and a `src` directory where you will write your code.

You have 10 CSV files:
* **celebrities.csv** — All the celebrities that have competed
* **professionals.csv** — All the professional dances that have participated in scored performances
* **judges.csv** — All the judges that have given scores
* **couples.csv** – All the couples that have been scored. Note that sometimes celebrities dance with professionals other than their 'main professional' (e.g., "Switch up week" or substitutions for illness/injury)
* **performances.csv** – All the performances that single couples have given (The data excludes multi-couple dances)
* **scores.csv** — The scores given by judges to each dance (If judges gave more than one score to a single performance (e.g., technical score/performance score) the scores have been averaged)
* **primary_dance_styles.csv** — All the dance styles performed (only the first listed style for multi-style dances)
* **primary_songs.csv** — All the songs played during performances (only the first listed song for songs danced to multiple songs)
* **primary_song_artists.csv** — All the artists associated with any song. These are as listed on Wikipedia, so duets by two artists (for example) appear as a separate artist.
* **week_themes.csv** — The names used for different weeks (these overlap between seasons)

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
