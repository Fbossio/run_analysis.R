library(reshape2)
## Create a file to store data
if(!file.exists("./data")){dir.create("./data")}

## Download the data files
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile = "./data/dataset.zip", method = "curl")

## Unzip the data sets
unzip(zipfile = "./data/dataset.zip", exdir = "./data")

## Obtaining the file extensions
files_test <- list.files("./data/UCI HAR Dataset/test", full.names = TRUE)
files_train <- list.files("./data/UCI HAR Dataset/train", full.names = TRUE)
files_others <- list.files("./data/UCI HAR Dataset", full.names = TRUE)

## Reading the "test" data sets
subject_test <- read.table(files_test[2], header = FALSE)
X_test <- read.table(files_test[3], header = FALSE)
y_test <- read.table(files_test[4], header = FALSE)

## Reading the "train" data sets
subject_train <- read.table(files_train[2], header = FALSE)
X_train <- read.table(files_train[3], header = FALSE)
y_train <- read.table(files_train[4], header = FALSE)

## Reading the "activity_lables" and "features"
activity_labels <- read.table(files_others[1], header = FALSE, stringsAsFactors = FALSE)
features <- read.table(files_others[3], header = FALSE, stringsAsFactors = FALSE)
features <- features[,2] 

## Merging data sets
subject <- rbind(subject_train, subject_test)
activity <- rbind(y_train, y_test)
X <- rbind(X_train, X_test)
DF <- cbind(subject, activity, X)
colnames(DF) <- c("subject", "activity", features)

## Replacing the activity codes with descriptive variable names
DF$activity <- factor(DF$activity, levels = c(1:6), labels = activity_labels$V2)

## Extracting the mean and sd variables
cols_selected <- grep("mean|std", colnames(DF))
data.extracted <- DF[, c(1, 2, cols_selected)]
                
## Creating a data set with the average of each variable
data.melt <- melt(data.extracted, id=c("subject", "activity")) ### Melting the extracted datas set
tidy_data <- dcast(data.melt, subject + activity ~ variable, mean)
write.table(tidy_data, file = "./data/tidy_data.txt", row.names = FALSE, sep = ",")











