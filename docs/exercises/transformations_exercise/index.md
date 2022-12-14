# Data Transformations

We can represent the same data in many different ways.  

I don't mean file formats like Excel, XML, or CSV.  I mean different ways of laying out the data within those files.

In this exercise you have found a bunch of files on a shared server, all about students and their hobbies over the years.  Your task is to merge them all together into a single file.

## The files

You should download [a zip of the files](transformations_files.zip) and work with them on your computer.

### filename: 2011-hobbies.csv

```
Shuyen, dancing; skating
Ravi, dancing; skiing
Diane, skating
```

### filename: 2010-hobbies.xlsx

![2010-hobbies-screenshot](https://user-images.githubusercontent.com/91986/186707202-42c29ac3-423e-47ea-bdc1-d8d8e3ccfe1f.png)

### filename: 2009-records/skaters-new.csv

```
Alvin
Reg
Jin
```

### filename: 2009-records/dancers.csv

```
Micah
Xiao
```

### filename: Aishwarya.csv

```
2009,dancing
2010,dancing
2011,dancing & skating
```

## Desired output file

Your task is to merge all the facts in the files above into one single file. For each file think about where you are finding each piece of information.  This semester we will learn to have the computer do and manage these type of data transformations.

### filename: all_hobbies.xlsx

```
year, person_name, hobby
```

If you don't have excel on your computer, you can also make this as a file in Google Docs.

## Additional reading

We will discuss various ways that data can be organized within files and in databases throughout the semester.  You can read more about this in this paper:

- Kent, W. (1989). The many forms of a single fact. Digest of Papers. COMPCON Spring 89. Thirty-Fourth IEEE Computer Society International Conference: Intellectual Leverage, 438–443. https://doi.org/10.1109/CMPCON.1989.301972

Or on Wikipedia on the pages for [Database Schema](https://en.wikipedia.org/wiki/Database_schema) or [Data Model](https://en.wikipedia.org/wiki/Data_model) (although both are a little more formal than the differently structured files we used today)
