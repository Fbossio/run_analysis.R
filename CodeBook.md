# Code Book
## Source of the raw data
The data was obtained from the Human Activity Recognition Using Smartphones Data Set. It was downloaded from the url: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

## Data transformation
The `run_analysis.R` script performs the following transformations on the working directory and the data:

    1.    Creates the directory `./data` to store the raw data.
    2.    Downloads the zip file that contains the data.
    3.    Unzip the file.
    4.    Reads the data sets using the function `read.table`
    5.    Merges the train and tests data sets using the funtions `rbind` and `cbind`.
    6.    Replaces the activity codes with descriptive variable names, using the function `factor` and specifiying the `levels` and `labels` of the factor.
    7.    Extracts the mean and standard deviation variables using the function `grep` to create a boolean index which returns `TRUE` if the column names contain the words `mean` or `std`, and using it to subset the columns.
    8.    Creates a smaller data set that contains the average of the variables selected in the previous step. The `melt` and `dcast` functions from the `reshape2` package were used to melt and obtain the mean of the variables respectively.
    9.    Stores the tidy data in the `./data` directory, using the `write.table` function.

## Output of the script
The tidy data set consists in a data frame with 81 variables and 180 observations. It contains the mean of the selected variables grouped by activity and subject.





    


