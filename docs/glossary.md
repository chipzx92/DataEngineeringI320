# Glossary of Data Engineering Terms
**analytics**  
Analytics is defined as the *systematic computational analysis of data or statistics*<sup>1</sup>. 

In our context, analytics are what we will perform on data transformed in our data pipelines to produce 
reports and visualizations. There are several different sub-categories of analytics, including:
* descriptive analytics
* predictive analytics
* prescriptive analytics

**analytical system**  
A computing system or platform specifically dedicated to processing data for the purpose of
reporting on, analyzing, and visualizing that data. The heart of most analytical systems is a 
data warehouse or data lake, but other architectures are also possible.

**aws**  
Amazon Web Services<sup>2</sup>. Amazon's cloud computing service, which is the most popular cloud platform. 
Some of the more popular AWS services are:
* EC2 (Elastic Compute Cloud) - provides the VM you will log into for your labs and semester project.
* RDS (Relational Database Service) - hosted database services.
* S3 (Simple Storage Service) - data object storage.

There are many dozens of other services provided by AWS.

**DAG**   
DAG stands for Directed Acyclic Graph<sup>3</sup>. A DAG is a graph consisting of vertices (nodes) and edges
(lines) were the edges connect the vertices.
- starting from a single vertice
- edges join each of the vertices (a graph)
- in one single direction (directed)
- with no cycling back to previously joined vertices (acylic)

**data flow diagram**  
A data flow diagram<sup>17</sup> (DFD) maps out the flow of information for any process or system.   

**data lake**  
A data lake is defined as *a system or repository of data stored in its natural/raw format, usually 
object blobs or files*.<sup>4</sup>

**data pipeline**  
A data pipeline<sup>5</sup> is a series of programs or tasks that transforms a set of input datasets into a set
of output datasets, usually in the form of a DAG where each individual task is a vertice in the DAG
and the edges define the path of execution. 

The path of execution in the data pipeline DAG implicitly defines dependencies between
tasks. If we have a simple graph A -> B -> C, where A, B, and C are tasks and -> defines the flow 
of execution, then C is dependent on B, meaning that B must complete successfully before C can be
executed.

The phases of the data pipeline can be defined as follows:
* Ingestion - Loading data from source system(s) into a data warehouse or data lake.
* Transformation - Restructuring data into a format suitable for analytical processing (for example, transforming source tables into a star schema).
* Presentation - Making transformed data available through BI Tools (e.g. Superset), APIs, or other tools.

**data product**  
One definition of a data product is a *reusable data asset, built to deliver a trusted dataset, for 
a specific purpose*.<sup>6</sup>

In this class, we narrow the definition of a data product to be a dataset we create in a data
pipeline for the specific purpose of creating reports or analytics.

**data warehouse**  
A data warehouse<sup>7</sup> is a database system that is dedicated to reporting and analysis. It is 
usually the core component of an organization's analytical system. We will use a Postgres database
for our data warehouse, but many organizations use the new breed of cloud data warehouses such as
[Snowflake](https://www.snowflake.com/en/), [Big Query](https://cloud.google.com/bigquery?utm_source=google&utm_medium=cpc&utm_campaign=na-US-all-en-dr-bkws-all-all-trial-e-dr-1605212&utm_content=text-ad-none-any-DEV_c-CRE_665665924750-ADGP_Hybrid%20%7C%20BKWS%20-%20MIX%20%7C%20Txt_BigQuery-KWID_43700077225652815-kwd-47616965283&utm_term=KW_bigquery-ST_bigquery&gclid=CjwKCAjwivemBhBhEiwAJxNWNw0CWdBW6ZItQsQwjJUDUNuDlc0Y1J4iRilJR7yrSbPkSsnLC5vczhoChOsQAvD_BwE&gclsrc=aw.ds), 
and [Redshift](https://aws.amazon.com/redshift/).

**dbt**  
dbt (Data Build Tool)<sup>8</sup> is an open-source software tool that uses SQL to transform one or more
input database tables into an output table.

We will use dbt to build our data pipelines is this class. dbt allows us to define a pipeline as a
DAG by defining individual transformations as tasks and specifying dependencies between them. 

**dimensional model**  
Also known as a *Star Schema*<sup>9</sup>. A dimensional model is a data model that is optimized for complex
analytical queries. It consists of 2 kinds of tables:
* Fact tables
* Dimension tables

<u>Facts</u> are _measures_ - each row in a fact table is a measurement of something.

We prefer facts to be numeric and _additive_ - that is, we can perform aggregate functions on them
like COUNT, SUM, AVG, MIN, MAX, etc.

<u>Dimensions</u> provide _context_ for different kinds of measurement. They describe what we are 
measuring.

Dimensions consist of descriptive attributes - usually (but not always) text strings or date/times - 
that allow us to label, search, filter, group, and order the data in various ways. 

**ELT**  
Stands for *Extract, Load, and Transform*<sup>10</sup>
A more modern alternative to ETL, in which data is extracted from source systems, loaded in its
original format to an analytical system, and then taken through a series of transformational steps
to produce data products and analytics.

**ETL**  
Stands for *Extract, Transform, and Load*<sup>11</sup>
An older data engineering concept where data is extracted from a source system, transformed in a 
staging area, and then loaded into an analytical system.

**Entity-Relationship Diagram (ERD)**  
An Entity-Relationship Diagram (ERD)<sup>18</sup> visualizes the relationships between entities like people, 
things, or concepts in a database. An ERD will also often visualize the attributes of these entities.
By defining the entities, their attributes, and showing the relationships between them, an ERD 
can illustrate the logical structure of databases. 

**Foreign Key**
A foreign key consists of a column that references the primary key of another table.  The purpose 
of the foreign key is to ensure *referential integrity* of the data. In other words, only values 
that are primary key values in the referenced table are permitted in the foreign key column.

**idempotent**  
An operation that produces the same result no matter how many times it is executed<sup>3</sup>.

This is a term from mathematical theory, but in the context of data engineering it means that 
running a task in a data pipeline or even a series of tasks in a pipeline will produce the same 
result even when run multiple times over the same data.

A simple example of idempotence is writing a task that first deletes all the data in a table
and then reloads the data from the source. A task like this is guaranteed to be idempotent.

**linux**  
Linux<sup>12</sup> is an open-source operating system (OS) that is the most popular server OS on the internet. 
There are many different distributions (versions) of linux

We will build our data pipelines on an EC2 VM running the Ubuntu distribution of linux. 

**operational data source**  
Also referred to as a *source system*. An operational data source is a database or other data store
that is used by an organization's operational systems - the systems that are used to run the
organization. 

For example, the system that processes payments on your credit card is an operational 
system. It will store the record of those payment transactions in a database. That transactional
data in a database will then be copied into an analytical system to be transformed and analyzed.

We often refer to the data from operational systems as "raw data" because it needs to be 
transformed to be useful for analytics.

**orchestration tool**  
Data orchestration is the process of automating the execution and monitoring of data pipelines.<sup>13</sup>
A data orchestration tool automates the management and execution of data pipelines. It visualizes 
data pipelines as DAGs and can show the execution of each pipeline as it occurs.

Popular orchestration tools are [Airflow](https://airflow.apache.org/), [Dagster](https://dagster.io/), and [Prefect](https://www.prefect.io/opensource?&utm_medium=search&utm_campaign=Prefect_Brand&utm_keyword=Prefect&gclid=CjwKCAjwivemBhBhEiwAJxNWNzITUZVr3EK6wC4MALraRVumZQkxeFCEcPLC8A0P8SxyrHa_f9JAzBoC8pgQAvD_BwE).

**Postgres**  
Postgres<sup>14</sup> is an open-source Database Management System (DBMS) originally developed at UC-Berkeley.
Postgres and MySQL are the most popular open-source SQL databases.

We will use Postgres as our database system in this course.

**Primary Key**
A database primary key<sup>15</sup> is a column or combination of columns with a value that uniquely identifies 
each row in a table.

**Superset**  
Superset<sup>16</sup>is an open-source business intelligence tool that can query analytic data stores to build
reports and visualizations.

We will use Superset to create reports and visualizations on the data products we build.

**transformation**  
The process of taking operational data and turning it into data that is useful for analysis.
Transformation can involve any or all of the following steps:
* cleaning - removing bad or duplicate data
* sanitizing - for example, anonymizing Personally Identifying Information (PII) to protect individual's privacy
* scrubbing - removing irrelevant or unnecessary data
* calculating - create new data points from existing data points
* aggregating - summarizing data; for example, doing counts, sums, and averages
* restructuring - organizing data differently to make it easier to understand and query

**Virtual Machine (VM)**  
A virtual machine or VM is defined as *the virtualization or emulation of a computer system*<sup>16</sup>.
We will be doing our work on an EC2 system in AWS that is a virtual machine running Postgres,
JupyterHub notebooks, dbt, and Superset.

## Data Engineering References
These are the most important and influential books on data engineering, databases, and SQL:  
[Data Mesh: Delivering Data-Driven Value at Scale](https://www.amazon.com/Data-Mesh-Delivering-Data-Driven-Value/dp/1492092398/ref=sr_1_1?crid=3SAWWWJHN45E8&keywords=data+mesh+by+zhamak+dehghani&qid=1692474826&sprefix=data+mesh%2Caps%2C138&sr=8-1) - Zhamak Deghani  
[Fundamentals of Data Engineering: Plan and Build Robust Data Systems](https://www.amazon.com/Fundamentals-Data-Engineering-Robust-Systems/dp/1098108302/ref=sr_1_1?crid=1QK5ZGLXJXHH7&keywords=fundamentals+of+data+engineering&qid=1692474979&sprefix=data+engineering%2Caps%2C141&sr=8-1) - Joe Reis and Matt Housley  
[Designing Data-Intensive Applications: The Big Ideas Behind Reliable, Scalable, and Maintainable Systems](https://www.amazon.com/Designing-Data-Intensive-Applications-Reliable-Maintainable/dp/1449373321/ref=sr_1_1?crid=6ZX5DTW5YGIQ&keywords=designing+data+intensive+applications&qid=1692474628&sprefix=data+in%2Caps%2C136&sr=8-1) - Martin Kleppmann  
[The Data Warehouse Toolkit: The Definitive Guide to Dimensional Modeling](https://www.amazon.com/Data-Warehouse-Toolkit-Definitive-Dimensional/dp/1118530802/ref=sr_1_1?crid=U8KARG36H9HF&keywords=ralph+kimball+data+warehouse&qid=1692474713&sprefix=raplh+Kimball%2Caps%2C130&sr=8-1) - Ralph Kimball and Margy Ross  
[Learning SQL: Generate, Manipulate, and Retrieve Data](https://www.amazon.com/gp/product/1492057614/ref=as_li_tl?ie=UTF8&camp=1789&creative=9325&creativeASIN=1492057614&linkCode=as2&tag=booksoncode-20&linkId=3128a4b0016740aaa187152eeeccbbb8) - Alan Beaulieu    
[Database Design and Relational Theory: Normal Forms and All That Jazz](https://www.amazon.com/Database-Design-Relational-Theory-Normal/dp/1484255399/ref=pd_vtp_h_pd_vtp_h_sccl_2/142-7984303-9720919?pd_rd_w=g1jwV&content-id=amzn1.sym.e16c7d1a-0497-4008-b7be-636e59b1dfaf&pf_rd_p=e16c7d1a-0497-4008-b7be-636e59b1dfaf&pf_rd_r=GM1AV87VTTD81DNWHM5V&pd_rd_wg=SIzTn&pd_rd_r=34620033-4b68-4d2f-a476-be788167b0d0&pd_rd_i=1484255399&psc=1) - C.J. Date  
[Storytelling with Data: A Data Visualization Guide for Business Professionals](https://www.amazon.com/Storytelling-Data-Visualization-Business-Professionals/dp/1119002257/ref=sr_1_1?crid=2HEBRP6I9FCO8&keywords=data+visualization&qid=1692477093&s=books&sprefix=Data+Visual%2Cstripbooks%2C112&sr=1-1) - Cole Nussbaumer Knaflic
[The Informed Company: How to Build Modern Agile Data Stacks that Drive Winning Insights](https://www.amazon.com/Informed-Company-Cloud-Based-Explore-Understand/dp/1119748003/ref=sr_1_1?crid=28ARE5W2UP01E&keywords=the+informed+company&qid=1692475170&sprefix=the+informed+company%2Caps%2C133&sr=8-1) - Dave Fowler and Matthew C. David  

These last two books are not books on data engineering or databases, but are the best books available on software architecture and python and I highly recommend them.
[Fundamentals of Software Architecture: An Engineering Approach](https://www.amazon.com/Fundamentals-Software-Architecture-Comprehensive-Characteristics/dp/1492043451/ref=sr_1_1?crid=13PK40JECO3P5&keywords=software+architecture&qid=1692475296&sprefix=software+%2Caps%2C144&sr=8-1) - Mark Richards and Neal Ford  
[Fluent Python: Clear, Concise, and Effective Programming](https://www.amazon.com/Fluent-Python-Concise-Effective-Programming/dp/1492056359/ref=sr_1_1?crid=3KE5AM0JI3DS3&keywords=fluent+python&qid=1692475702&s=books&sprefix=fluent%2Cstripbooks%2C134&sr=1-1) - Luciano Ramalho  

### Notes:
<sup>1</sup>https://en.wikipedia.org/wiki/Analytics  
<sup>2</sup>https://docs.aws.amazon.com/?nc2=h_ql_doc_do  
<sup>3</sup>https://en.wikipedia.org/wiki/Directed_acyclic_graph  
<sup>4</sup>https://en.wikipedia.org/wiki/Data_lake
<sup>5</sup>https://en.wikipedia.org/wiki/Pipeline_(computing)
<sup>6</sup>https://data.world/blog/what-is-a-data-product-and-why-does-it-matter-to-data-mesh/ 
<sup>7</sup>https://en.wikipedia.org/wiki/Data_warehouse
<sup>8</sup>https://en.wikipedia.org/wiki/Data_build_tool
<sup>9</sup>https://en.wikipedia.org/wiki/Star_schema
<sup>10</sup>https://www.astera.com/type/blog/elt-extract-load-and-transform/
<sup>11</sup>https://en.wikipedia.org/wiki/Extract,_transform,_load
<sup>12</sup>https://en.wikipedia.org/wiki/Linux
<sup>13</sup>https://medium.com/memory-leak/data-orchestration-a-primer-56f3ddbb1700
<sup>14</sup>https://www.postgresql.org/
<sup>15</sup>https://www.relationaldbdesign.com/database-analysis/module2/database-primary-key.php
<sup>16</sup>https://superset.apache.org/
<sup>17</sup>https://www.lucidchart.com/pages/data-flow-diagram
<sup>18</sup>https://www.smartdraw.com/entity-relationship-diagram/