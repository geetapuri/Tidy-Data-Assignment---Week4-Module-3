# run_analysis.R
#Step 1. Downloading and Unzipping dataset
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", 
              destfile = "Dataset.zip")

#Unzip the data file
unzip(zipfile = "Dataset.zip")

#Step 2. Reading the data sets and merging them into 1
#Load the Training data set first
setwd("~/Technology/Coursera/R/Cleaning Data - Module 3/Week4Assignment/UCI HAR Dataset/train")
x_train <- read.table("X_train.txt")
y_train <- read.table("Y_train.txt")
subject_train <- read.table("subject_train.txt")

#Load the test data set
setwd("~/Technology/Coursera/R/Cleaning Data - Module 3/Week4Assignment/UCI HAR Dataset/test")
x_test <- read.table("X_test.txt")
y_test <- read.table("Y_test.txt")
subject_test <- read.table("subject_test.txt")

#Load features
setwd("~/Technology/Coursera/R/Cleaning Data - Module 3/Week4Assignment/UCI HAR Dataset")
features <- read.table("features.txt")

#Read Activity Labels
activity_labels <- read.table("activity_labels.txt")

#Step 3 - Assigning names to columns

#training cols
colnames(subject_train) <- "subject_id"
colnames(x_train) <- features[,2]
colnames(y_train) <- "activity_ID"

#test cols
colnames(x_test) <- features[,2]
colnames(y_test) <- "activity_ID"
colnames(subject_test) <- "subject_ID"

colnames(activity_labels) <- c("activity_ID", "activity_type")

#Step 4 - Merge train cols into 1 data set - common_train
common_train <- cbind(y_train, subject_train, x_train)

#Step 5 - Merge test cols into 1 data set - common_test
common_test <- cbind(y_test, subject_test, x_test)

#Step 6 - Merge common training and common test into one data set - common_data
common_data <- rbind(common_train, common_train)

#Step 7 - Make new table with only values related to mean and std 
mean_std_new <- common_data[grepl("mean|std|activity_ID|subject_ID", names(common_data))]

#Step 8 - Using descriptive names for activities - 
final_table_descriptive <- merge(mean_std_new, activity_labels, by="activity_ID", all.x=TRUE)

#Step 9 - Making the second tidy data set using aggregate
second_tidy_data <- aggregate(. ~subject_ID + activity_ID, final_table_descriptive, mean)

#Step10 - Order the second tidy data set by subject ID and activity ID
second_tidy_data <- second_tidy_data[order(second_tidy_data$subject_ID, second_tidy_data$activity_ID),]

#Step 11 - Write the table in txt format
write.table(second_tidy_data, "second_tidy_data.txt", row.name=FALSE)











