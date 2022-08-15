# Course Syllabus

## Course Description
This class will be a foundational course in Data Engineering principles and practices.
We will focus on the data engineering lifecycle and how to build data pipelines to collect, 
transform, analyze, and visualize data from multiple source systems. We will discuss data 
modeling techniques for organizing and managing data. We will look at data as an organizational 
asset and as a product. We will examine the various roles data engineers can have in an 
organization and career paths for data professionals.

The class will balance general principles with hands-on experience with some of the tools, 
languages, and techniques of the modern data stack. Emphasis will be placed on SQL as the primary 
language of data engineering along with low- or no-code tools that leverage SQL, plus a little 
python. We’ll walk through building data pipelines end-to-end, from ingesting source data to 
creating analytical data products that deliver value to organizations. We’ll use business 
intelligence tools to build visualizations using those data products. We will look at both 
batch processing and streaming systems to understand their pros and cons. We’ll talk about data 
lakes, data warehouses, ETL/ELT, and batch and streaming systems to understand the pros and cons 
of each. We will look at issues around data quality, understand the uses of data catalogs, examine 
data lineage and data profiling tools, and discuss data governance in organizations. Time 
permitting, we’ll also discuss trends and future directions in data engineering.

Some python or other programming languages are helpful. INF 385M (Database Management), 
INF 385T.9 (Data Wrangling), or INF 380P (Introduction to Programming) are also helpful.

## Office Hours
As requested. I work off-campus during the day but I will meet with students at any time that's 
convenient with at least 24 hours notice.

## Course Objectives
Learn fundamentals of data engineering.  
Be able to apply the principles used in class to build a simple data pipeline and visualize the data.  
Prepare students for careers as data professionals.  

## Computing Resources
You need a laptop with a browser to access the data visualization tool we will use. You will be 
using a virtual machine (VM) on a cloud service to do most of your work. The software used in this 
class will be installed on your VM or as a cloud servicw. If you do not have a laptop, or yours 
stops working, the school and university has resources available. Please check these university 
resources. (Check the “Before your classes” section; I believe that you reach out to the Texas One Stop).

## Course Schedule 
[subject to change as course materials are developed]

### Class 1: Introduction to Data Engineering (Aug 23/25)  
Introductions  
Syllabus review
Definition and Overview of Data Engineering 

“Data Is The New Oil” presentation  
Overview of example end-to-end project  
Overview of semester project  


### Week 2: Introduction to Data Pipelines/End-to-End Presentation (Aug 30/Sep 1)  
Presentation and distribution of sample end-to-end project  
Installation  
Processing steps in the data pipeline w/examples  
Source systems  
Ingestion  
Data cleansing and validation  
Data transformation   
Presentation and Visualization  
ELT vs ETL  
Semester Project  
Assignments of data sources  
Project Definition  
Assignment: Make enhancements to sample project  

### Weeks 3-5: SQL Review (Sep 6/8 13/15 20/22)    
Into to Postgres and psql   
SQL Basics Review  
Different types of Joins especially Outer Joins  
Advanced SQL Features - subqueries, CTE’s, and Window functions   
SQL mini-quiz  

### Week 6: Source Systems and Data Ingestion (Sep 27/29)
What is a Data Lake?  
What is a Data Warehouse?  
Data Lakehouses   
Source Systems  
Replication of source data  
Batch Processing  
Streaming  
Bulk ingestion using the Copy command  
Workshop on ingesting data for semester project  

### Week 7: Data Cleansing and Validation (Oct 4/6)  
Data Quality of Source Systems  
Statistical validation  
Rule-based validation  

### Weeks 8-9: Data Modeling (Oct 11/13 18/20)  
Normalization  
Dimensional Modeling  
Creating Tables  
Schema Migration  
Assignment: Create dimensional model for semester project  

### Week 10: Data Transformation (Oct 25/27)
Building the data warehouse  
Transforming source data into dimensional models  
Building data products (data marts)  
Assignment: Populate dimensional mode for semester project  

### Week 11: Data Presentation and Visualization (Nov 1/3)  
Business Intelligence Tools  
Introduction to Superset  
Creating visualizations  
Assignment: Create visualization for semester project  

### Week 12: Workshop on Semester Projects (Nov 8/10)  

### Week 13: Data and Metadata Management and Governance (Nov 15/Nov 17)  
Data Quality  
Data Catalogs, Data Lineage, and Data Governance  
DataOps and Data Observability  
Mini-quiz   

### Week 14: Trends and New Directions in Data Engineering (Nov 29/Dec 1)  
Data Mesh  
CDC/Streaming/Event Processing for near real-time analytics  
Reverse ETL  
Careers in Data Engineering  
* Data Engineer as an Analytics Engineer  
* Data Engineer as a Software Engineer  
* Data Engineer as a Data Scientist  
* Data Engineer as an Infrastructure Engineer  
