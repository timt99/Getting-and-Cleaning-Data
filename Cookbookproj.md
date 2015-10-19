---
title: "Proj1 AllData"
author: "Tim Tran"
date: "October 18, 2015"
output: html_document
---

This is an R Markdown document. Markdown is a simple formatting syntax for authoring HTML, PDF, and MS Word documents. For more details on using R Markdown see <http://rmarkdown.rstudio.com>.

When you click the **Knit** button a document will be generated that includes both content as well as the output of any embedded R code chunks within the document. You can embed an R code chunk like this:

##Introduction

The script perform the 5 steps analysis of the course project definition. 

All data is merged together using the rbind() function. 

Columns with mean and standard deviation measures are taken from the datast. 

After extracting these columns, they are given correct names, taken from featurs.txt.

As activity data is addressed with values 1:6, we take the activity names and IDs from activity_labels.txt and they are substituted in the dataset.

On the whole dataset, those columns with vague column names are corrected.

We generate a new dataset with all average measures for each subject and activity type ( 30 subjects * 6 activities = 180 rows)

Outpout file is called averages_data.txt

Uploaded to GItHUB repository.



##Variables

X_traindata, Y_traindata, subjectTrain, X_testdata, Y_testdata, and subjectTest contain the data from the downloaded files. 

x_dataset, y_dataset , subject_dataset  are merge the previous datasets for further analysis.  

Features contains the correct names for the x_dataset , which are applied to the column names stored.  

FeaturesMeanStd which is a numeric vector used to extract the desired data.   

Alldata merges x_dataset, y_dataset, and subjectTest in a big data set  

AveragesData  contains the relevant averages which will be stored in a .txt file.  Ddpy() from the plyr package is used to apply colMeans() and ease the development.  





