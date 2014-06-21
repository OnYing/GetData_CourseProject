#Set working directory
setwd("C:/Users/On Ying/Documents/Coursera/GettingandCleaningData/Course Project")
#Download and unzip file
temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",temp)
unzip(temp)

# Part 1, 4 and 5
#Merges the training and the test sets to create one data set.
#Uses descriptive activity names to name the activities in the data set.
#Appropriately labels the data set with descriptive variable names. 

#Read test files

#Read test file containing the activity labels
activitylabels_test <- read.table("UCI HAR Dataset/test/y_test.txt")
#Name the column containing the activity labels
colnames(activitylabels_test) <- "Activity"

#Read test file containing the subject IDs
subjects_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
#Name the column containing the subject IDs
colnames(subjects_test) <- "Subject"

#Read test file containing the actual data values
temp_testset <- read.table("UCI HAR Dataset/test/X_test.txt", nrows=5)
classes <- sapply(temp_testset, class)
values_test <- read.table("UCI HAR Dataset/test/X_test.txt", colClasses=classes)

#Read test file containing the features(aka variables)
features <- read.table("UCI HAR Dataset/features.txt")
#Name the columns containing the actual values according to the features file (second column)
colnames(values_test) <- features[,2]

#Create test set
testset <- cbind(activitylabels_test, subjects_test, values_test)

#Repeat for the training files
activitylabels_train <- read.table("UCI HAR Dataset/train/y_train.txt")
colnames(activitylabels_train) <- "Activity"
subjects_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
colnames(subjects_train) <- "Subject"
temp_trainset <- read.table("UCI HAR Dataset/train/X_train.txt", nrows=5)
classes <- sapply(temp_trainset, class)
values_train <- read.table("UCI HAR Dataset/train/X_train.txt", colClasses=classes)
colnames(values_train) <- features[,2]
trainset <- cbind(activitylabels_train, subjects_train, values_train)

#Create merged set
fullset <- rbind(testset, trainset)

#Read in activities txt file
activities <- read.table("UCI HAR Dataset/activity_labels.txt")
#Change activity column in full set from integer to factor, name levels with the appropriate labels
fullset$Activity <- factor(fullset$Activity,
                    levels = activities[,1],
                    labels = activities[,2]) 

# Part 2
# Extract only the measurements on the mean and standard deviation for each measurement. 
mean_columns <- grep("mean()", colnames(fullset), fixed=TRUE)
std_columns <-grep("std()", colnames(fullset), fixed=TRUE)
selected_columns <- c(1, 2, mean_columns, std_columns)
selection <- fullset[, c(sort(selected_columns))]

# Part 6
# Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
# Use aggregate function to calculate the average of each variable, separate for each activity and each subject.
aggregation <- aggregate(x=selection, by=list(selection$Activity, selection$Subject), FUN="mean")
# Remove old activity and subject columns
final <- aggregation[c(-3,-4)]
# Get vector of the columnnames of the aggregation2 dataframe without the new activity and subject names
variables <- colnames(final)
variables <- variables[c(-1, -2)]
avg <- c("Avg-")
variables2 <- paste(avg,variables, sep="")
# Rename columnnames including the first two columns
colnames(final) <- c("Activity", "Subject", variables2)
# write tidy dataset into txt file
write.table(final, file="tidy_dataset.txt", row.names=FALSE)