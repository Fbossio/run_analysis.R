# run_analysis.R

## Summary

This repository contains the R code `run_analysis.R` that perform the folowing tasks:

    1.    Downloads data sets from the Samsung's Human Activity Recognition project. 
    2.    Stores the data into the directory `./data` in the working directory.
    3.    Merges the trainig and testing data sets.
    4.    Exteacts only the mean and standard deviation variables.
    5.    Replaces the activity codes with descriptive names.
    6.    Creates a data set with the average of each variable extracted in step 4.
    7.    Stores the resulting data set in the text file `./data/tidy_data.txt`. 

## Source of the data

The data sets were obtained from the Samsung's Human Activity Recognition Datasets, which can be daownloaded from the url: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

## R packages needed

The package `reshape2` was needed to process the raw data. 

## Final output

The tidy data consists in a separated by commas dataset with 88 variables and 180 observations.



 


