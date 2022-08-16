# Course Syllabus

## Course Description

This class will be a foundational course in Data Engineering principles and practices. This course will enable you to:

- know the professional role of data engineers in organizations and career paths for data professionals.
- understand the data engineering lifecycle
- how to build data pipelines to collect, transform, analyze, and visualize data from multiple source systems. 
- use SQL to transform and query data.
- understand data modeling techniques for organizing and managing data. 

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

## Professors and Office Hours

This course is co-taught by [Chip Young](http://example.com), a working data professional, and [James Howison](https://www.ischool.utexas.edu/people/person_details?PersonID=175), an associate professor in the Texas School of Information.

Office hours are by email request. Also happy to talk before class, please email to set that up.  Please do reach out, happy to chat about anything, including career paths, other courses, life in organizations, and getting the best out of your UTexas experience.

## Land Acknowledgement

We would like to acknowledge that when we are meeting on Indigenous land. Moreover, we would like to acknowledge and pay our respects to the Carrizo & Comecrudo, Coahuiltecan, Caddo, Tonkawa, Comanche, Lipan Apache, Alabama-Coushatta, Kickapoo, Tigua Pueblo, and all the American Indian and Indigenous Peoples and communities who have been or have become a part of these lands and territories in Texas, here on Turtle Island.

## Course Objectives
Learn fundamentals of data engineering.  
Be able to apply the principles used in class to build a simple data pipeline and visualize the data.  
Prepare students for careers as data professionals.  

## Computing Resources
You need a laptop with a browser to access the data visualization tool we will use. You will be 
using a virtual machine (VM) on a cloud service to do most of your work. The software used in this 
class will be installed on your VM or as a cloud servicw. However you will need your own laptop for class, able to access the utexas wifi network.  If you do not have a laptop, or yours stops working, the school and unversity has resources available. Please check [these university resources](https://onestop.utexas.edu/keep-learning/#acc_1-1). Check the "Before your classes" section; I believe that you reach out to the Texas One Stop). We will work to have one or two loaner laptops available since we know things sometimes break just before class.

## Course Texts

There are no required texts for the course, but you will find these resources to be useful.

An intro book for MySQL that's available online at UT is: [Learning MySQL](http://www.utxa.eblib.com/patron/FullRecord.aspx?p=540862).

As a member of this class you will have free access to the DataCamp site, I believe that access extends for 6 months. I will establish the access a few weeks into the semester, causing an invitation email to come to the email address registered with the University. The most relevant courses are:

- [Introduction to Python](https://www.datacamp.com/courses/intro-to-python-for-data-science)
- [Intro to SQL for Data Science](https://www.datacamp.com/courses/intro-to-sql-for-data-science)
- [Joining Data in SQL](https://www.datacamp.com/courses/joining-data-in-postgresql)

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

## Assessments

### Weekly Assignments

<!-- The bulk of your course grade (75%) comes from Weekly Assignments. There are assignments throughout each week for this course, covering the material addressed that week.  The weekly assignments are due 11:59 pm on Sunday (this is to ensure that we can grade them before Tuesday class). Late assignments *will receive a grade of zero* but you can drop your 3 lowest grades. It's always worth turning in the assignment, even if late, because the assignments test and drive your learning and your performance helps guide me on material. So not completing an assignment is a sure way to fall behind. Students have used their drops in the past and then been very sad when an actual emergency meant they could not complete their homework.

The assignments, and grading rubric, will be released on Canvas before each Thursday class, so we'll go over the assignment and ensure everyone knows what's required. Each assignment will be turned in through Canvas, usually by uploading a PDF, text, or notebook HTML export file. 

If you've uploaded a PDF there will be comments left on the PDF, in addition to any text comments in Canvas. You can see the comments on the PDF via by using the ["viewing feedback"](https://guides.instructure.com/m/4212/l/352349-how-do-i-view-assignment-feedback-comments-from-my-instructor-using-crocodoc-annotations) button.  -->

### Project

<!--

A portion of the course grade is a project to produce a data engineering workflow (sometimes also called a "data pipeline"). 

The project will be done in pairs. We will have an initial individual assignment to generate ideas, then opportunities to review each other's ideas and form groups. Groups are optional; you may complete this project individually as as a pair. 

Working in pairs for this course does not mean dividing up the work; I require each group member to understand everything about their project. If there is a part of your project that you don't understand or couldn't work with then you are missing a crucial learning opportunity. We work in pairs to work together (supporting each other's learning) not to reduce the amount or diversity of the work that we do.

When I use the word "workflow" (or "pipeline") I mean a process that moves from data you obtain through reading, cleaning, validating, analyzing, and providing results. The workflow includes the data, the scripts that read and query the data, and the final output. We will discuss example projects in class early in the semester. 

The project builds up through the semester (e.g., after we've learned Database Design you will do a design for the database in your workflow), culminating in a full workflow that you demonstrate and describe through the report.

There are more details on the specific Assignment page on Canvas, but note that each project needs at least three datasets from at least two different organizations (i.e., 3 datasets in total, per idea, no more than 2 of those can come from the same organization). In addition your project must handle synonyms of some form (e.g., modeling a single US state that can be referred to as Texas, TX, State of Texas, Tejas, etc.). This page outlines [advice on finding interesting data sources](class_modules/data_sources/) including tools to convert formats.

Example projects from previous years (note that whimsy is encouraged, funny projects keep the focus on wrangling, serious projects keep the focus on the topic. I think you want people to whom you describe this project not to quibble about your analysis, but to appreciate your data wrangling.):

- State education, teachers salaries, public schools. [Report](https://utexas.instructure.com/courses/1189186/files/41274072/download?verifier=yFgdabI46a1l37rxDgurtExKoFOHeUYs0JhpyEpH).
- Visualizing impact of weather on border crossings. [Report](https://utexas.instructure.com/courses/1189186/files/41227376/download?verifier=uK3u7IkSbXWZkr2EKDVlHuCqO7XNPI519VXLZrU6&wrap=1).
- How have "Game of Thrones" character names influenced baby names in the US? [Report](https://utexas.instructure.com/courses/1189186/files/41274102/download?verifier=WKMrLQfg7aBpKDTQW5oCMO3enRMIQfvxmHXg6xQy&wrap=1).
- Lightening strikes and baseball games
- Average age of Oscar winners by gender
- How do solar flares affects temperatures on Earth and on Mars

-->

## Policies

### Academic Integrity

Each student in the course is expected to abide by the University of Texas Honor Code: "As a student of The University of Texas at Austin, I shall abide by the core values of the University and uphold academic integrity." Plagiarism is taken very seriously at UT. Therefore, if you use words or ideas that are not your own (or that you have used in previous class), you must cite your sources and use quote marks appropriately. Otherwise you will be guilty of plagiarism and subject to academic disciplinary action, including failure of the course. In particular, students are reminded that proper citation requires mentioning sources when you use them, not just in a general list of references at the end of a document. You are responsible for understanding [UT's Academic Honesty and the University Honor Code]( https://deanofstudents.utexas.edu/conduct/academicintegrity.php). If this is at all confusing, please take this [Plagarism Tutorial](https://www.lib.usm.edu/plagiarism_tutorial/).

In particular, **any time you use the copy function** from someone else's writing (e.g., an article, blog post) you must have a plan about how you will use those words, how you will use quote marks ("), and how you will cite the work.

### Collaboration policy

The weekly assignments are individual work. However, as long as you meet the condition below, I give you explicit permission to work together with other classmates on the assignments or on your projects. With the same condition, you are also welcome to seek input from people outside the class, such as friends and family. 

The one condition is that you add a note to your homework (ideally through a comment in the Canvas submission) indicating how the work was done and identifying with whom you worked and how (thus ensuring that we are following the Academic Integrity policy above). For example you might say "Daria and I worked on this in the lab together, when we started out we were confused about X but I figured it out and shared that with Daria. Our code is very similar because we worked together". Or perhaps "I was confused about how to pad a string with spaces, and after working at it for 30 minutes I chatted about it with my partner who suggested the xyz method. I was pleased when I got that working myself." When you have worked together your code will have similarities, but you must not turn in identical code; rather you should take code you've worked on together and personalize it through comments that explain what is happening in the code. The comments must be your own, individual, work.

Neither "working together" nor "seeking input" means having others do the work for you; you should always be certain that you are learning and that you understand the code that you have submitted. 

If you have questions on this policy please ask in the Assignment Discussion forum on Canvas and I will answer there. I have this policy because learning to program is both individual hard work and learning how to get help from others. Sometimes chatting through with another class member is just what is needed.

### Sharing of Course Assignment Materials is Prohibited

No assignment materials used in this class, including, but not limited to quizzes, exams, papers, projects, homework assignments, review sheets, and additional problem sets, may be shared online or with anyone outside of the class unless you have my explicit, written permission. Unauthorized sharing of materials promotes cheating. It is a violation of the University’s Student Honor Code and an act of academic dishonesty. I am well aware of the sites used for sharing materials, and any materials found online that are associated with you, or any suspected unauthorized sharing of materials, will be reported to Student Conduct and Academic Integrity in the Office of the Dean of Students. These reports can result in sanctions, including failure in the course. 

###  Class Recordings

Class recordings are reserved only for students in this class for educational purposes and are protected under FERPA. The recordings should not be shared outside the class in any form. Violation of this restriction by a student could lead to Student Misconduct proceedings.

### COVID Caveats

To help keep everyone at UT and in our community safe, it is critical that students report COVID-19 symptoms and testing, regardless of test results, to [University Health Services](https://www.healthyhorns.utexas.edu/), and faculty and staff report to the [HealthPoint Occupational Health Program (OHP)](https://hr.utexas.edu/current/services/occupational-health-program) as soon as possible. [Please see this link to understand what needs to be reported](https://hr.utexas.edu/current/services/occupational-health-program).  In addition, to help understand what to do if a fellow student in the class (or the instructor or TA) tests positive for COVID, see this [University Health Services link](https://healthyhorns.utexas.edu/coronavirus_exposure_action_chart.html).

### Student rights and responsibilities

-	You have a right to a learning environment that supports mental and physical wellness.
-	You have a right to respect.
-	You have a right to be assessed and graded fairly.
-	You have a right to freedom of opinion and expression.
-	You have a right to privacy and confidentiality.
-	You have a right to meaningful and equal participation, and to self-organize groups to improve your learning environment.
-	You have a right to learn in an environment that is welcoming to all people. No student shall be isolated, excluded or diminished in any way.

With these rights come responsibilities:

- You are responsible for taking care of yourself, managing your time, and communicating with the teaching team and with others if things start to feel out of control or overwhelming.
- You are responsible for acting in a way that is worthy of respect and always respectful of others. 
- Your experience with this course is directly related to the quality of the energy that you bring to it, and your energy shapes the quality of your peers' experiences.
- You are responsible for creating an inclusive environment and for speaking up when someone is excluded. In particular, you are responsible for ensuring that your participation does not exclude the participation of others. Office hours are available for in-depth further discussion of advanced topics or other interests that pursuing in depth during class would exclude others.
- You are responsible for holding yourself accountable to these standards, holding each other to these standards, and holding the teaching team accountable as well.

### Personal Pronoun Preference

Professional courtesy and sensitivity are especially important with respect to individuals and topics dealing with differences of race, culture, religion, politics, sexual orientation, gender identity & expression, and nationalities. Class rosters are provided to the instructor with the student’s legal name, unless they have added a “chosen name” with the registrar’s office, which you can do so here: https://utdirect.utexas.edu/apps/ais/chosen_name/. I will gladly honor your request to address you by a name that is different from what appears on the official roster, and by the pronouns you use (she/he/they/ze, etc). Please advise me of any changes early in the semester so that I may make appropriate updates to my records. For instructions on how to add your pronouns to Canvas, visit https://utexas.instructure.com/courses/633028/pages/profile-pronouns. More resources available on the Gender and Sexuality Center’s website, www.utgsc.org.
 
###  Basic Needs Security

Any student who faces challenges securing their food or housing and believes this may affect their performance in the course is urged to contact the Dean of Students for support. UT maintains the UT Outpost (https://deanofstudents.utexas.edu/emergency/utoutpost.php) which is a free on-campus food pantry and career closet. Furthermore, please notify the professor if you are comfortable in doing so. This will enable him to provide any resources that he may possess.

### Mental Health Resources

I urge students who are struggling for any reason and who believe that it might impact their performance in the course to reach out to me if they feel comfortable. This will allow me to provide any resources or accommodations that I can. If immediate mental health assistance is needed, call the Counseling and Mental Health Center (CMHC) at 512-471-3515 or you may also contact Bryce Moffett, LCSW (iSchool CARE counselor) at 512-232-2983. Outside CMHC business hours (8a.m.-5p.m., Monday-Friday), contact the CMHC 24/7 Crisis Line at 512-471-2255.”

### Drop Policy

If you want to drop a class after the 12th class day, you'll need to execute a Q drop before the Q-drop deadline, which typically occurs near the middle of the semester. Under Texas law, you are only allowed six Q drops while you are in college at any public Texas institution. For more information, see: http://www.utexas.edu/ugs/csacc/academic/adddrop/qdrop

International students *must* [meet with the international office](https://global.utexas.edu/isss) before dropping a class that would put them below full-time status. 

## University Resources for Students

Your success in this class is important to me. We will all need accommodations because we all learn differently. If there are aspects of this course that prevent you from learning or exclude you, please let me know as soon as possible. Together we'll develop strategies to meet both your needs and the requirements of the course. There are also a range of resources on campus, detailed below.

### Services for Students with Disabilities

This class respects and welcomes students of all backgrounds, identities, and abilities. If there are circumstances that make our learning environment and activities difficult, if you have medical information that you need to share with me, or if you need specific arrangements in case the building needs to be evacuated, please let me know. 

I am committed to creating an effective learning environment for all students, but I can only do so if you discuss your needs with me as early as possible. Requests for accomodations are quite normal and quite frequent and I promise to maintain the confidentiality of these discussions. If appropriate, also contact [Services for Students with Disabilities](http://ddce.utexas.edu/disability/about/).

### Counseling and Mental Health Center

All of us benefit from support during times of struggle. You are not alone. There are many helpful resources available on campus and an important part of the college experience is learning how to ask for help. Asking for support sooner rather than later is often helpful.
 
If you or anyone you know experiences any academic stress, difficult life events, or feelings like anxiety or depression, we strongly encourage you to seek support.  http://www.cmhc.utexas.edu/individualcounseling.html

### The Sanger Learning Center

All students, including graduate students, are welcome to take advantage of Sanger Center's classes and workshops, private learning specialist appointments, peer academic coaching, and tutoring for more than 70 courses in 15 different subject areas. For more information, please visit  https://ugs.utexas.edu/slc/grad or call 512-471-3614 (JES A332).

### [University Writing Center free programs for grad students]( http://uwc.utexas.edu/grad/)
### [Libraries](http://www.lib.utexas.edu/)
### [IT services](http://www.utexas.edu/its/)
### [Student Emergency Services](http://deanofstudents.utexas.edu/emergency/)

### Important Safety Information

If you have concerns about the safety or behavior of fellow students, TAs or Professors, call BCAL (the Behavior Concerns Advice Line):  512-232-5050. Your call can be anonymous.  If something doesn’t feel right – it probably isn't. Trust your instincts and share your concerns.

