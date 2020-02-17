##################
# Set up library #
##################

library(data.table)
library(plyr)
library(dplyr)
library(tidyr)

###########################
# Download and unzip data #
###########################

# url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
# download.file(url, "dataset.zip")
# unzip("dataset.zip")

############################################
# Import all the data files as data tables #
############################################

# Import activity labels and features
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", header = FALSE)
features <- read.table("UCI HAR Dataset/features.txt", header = FALSE)

# Import test group data
test_labels <- read.table("UCI HAR Dataset/test/y_test.txt", header = FALSE)
test_set <- read.table("UCI HAR Dataset/test/X_test.txt", header = FALSE)
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", header = FALSE)

# Import train group data
train_labels <- read.table("UCI HAR Dataset/train/y_train.txt", header = FALSE)
train_set <- read.table("UCI HAR Dataset/train/X_train.txt", header = FALSE)
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", header = FALSE)


#############################
# Merge and tidy up tables #
#############################

# Make activity labels lower case
 activity_labels[,2] <- tolower(activity_labels[,2])

# Merge the labels and subjects for the test and train sets
labels <- rbind(test_labels, train_labels)
subject <- rbind(subject_test, subject_train)

# Rename columns to make joining and merging easier
labels <- rename(labels, label_num = V1)
activity_labels <- rename(activity_labels, label_num = V1, activity = V2)
subject <- rename(subject, subject = V1)

# Join activity labels to activity label numbers
labels <- left_join(labels, activity_labels)

# Create a variable "group" that notes if observations are for test or train groups 
test_set_labeled <- mutate(test_set, group = "test")
train_set_labeled <- mutate(train_set, group = "train")

# Append "group" to features list so it will merge easily later
features <- rbind(features, data.frame(V1 = 562, V2 = "group"))

# Merge the test and train sets
set <- rbind(test_set_labeled, train_set_labeled) 

# Rename numbered columns of the set to the names of features + "group"
names(set) <- features[,2]

# Merge all the data into a single set
set <- cbind(subject, labels, set)

# Select the columns that include "mean" and "std"
means <- grep("mean", names(set))
stds <- grep("std", names(set))

# Create a list of the columns we want to keep
# (group, subject, and activity are 565, 1, and 3, respectively)
columns <- c(565, 1, 3, means, stds)

# Subset for the columns we want
set <- set[,columns]

# Convert the set into a tibble to make it cleaner/easier to work with
set <- tbl_df(set)

# Replace dashes with underscores and remove () in column names
names(set) <- gsub("-", "_", names(set))
names(set) <- gsub("\\()", "", names(set))

# Remove all the excess intermediate sets and values
rm(activity_labels, features, labels, subject, subject_test, subject_train,
   test_labels, test_set, test_set_labeled, train_labels, train_set,
   train_set_labeled, columns, means, stds)

# We now have a tidy dataset!
View(set)

#########################################################
# Create second, independent tidy data set with average #
# of each variable for each activity and each subject   #
#########################################################

# Create the new set, grouped by activity and subject
set2 <- group_by(set, activity, subject)

# Gets average of each variable for each activity and subject
set2 <- summarize_if(set2, is.numeric, mean)

# Voila!
View(set2)
