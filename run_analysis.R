# This is for the Getting and Cleaning Data Course Project.  
# The initial comments define the project and are attributable to Jeff Leek.
# Based on the data in https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  
# create one R script called run_analysis.R that does the following. 
# Merges the training and the test sets to create one data set.
# Extracts only the measurements on the mean and standard deviation for each measurement. 
# Uses descriptive activity names to name the activities in the data set
# Appropriately labels the data set with descriptive variable names. 
# From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
# Print statements are progress indicators to provide the console feedback.
print("Step 0")
#------------------------------------------------------
# Step 0
# Initialize environment
#------------------------------------------------------
#Initialize external libraries necessary to perform actions
library(plyr)

#Download external data source and unzip
fileURL = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
destination = "getdata-projectfiles-UCI_HAR_Dataset.zip"
download.file(fileURL, destfile=destination, method="curl")
unzip(destination)

#------------------------------------------------------
# Step 1
# Merge the training and test sets to create one data set
#------------------------------------------------------
print("Step 1")
Xtrain <- read.table("UCI HAR Dataset/train/X_train.txt")
Ytrain <- read.table("UCI HAR Dataset/train/y_train.txt")
subjectTrain <- read.table("UCI HAR Dataset/train/subject_train.txt")

Xtest <- read.table("UCI HAR Dataset/test/x_test.txt")
Ytest <- read.table("UCI HAR Dataset/test/y_test.txt")
subjectTest <- read.table("UCI HAR Dataset/test/subject_test.txt")

# create 'X', 'Y' and 'Subject' data set
Xdata <- rbind(Xtrain, Xtest)
Ydata <- rbind(Ytrain, Ytest)
subjectData <- rbind(subjectTrain, subjectTest)

#------------------------------------------------------
# Step 2
# Extract only the measurements on the mean and standard deviation for each measurement
#------------------------------------------------------
print("Step 2")
features <- read.table("UCI HAR Dataset/features.txt")
# get only columns with mean() or std() in their names
meanAndStdFeatures <- grep("-(mean|std)\\(\\)", features[, 2])

# subset the desired columns
Xdata <- Xdata[, meanAndStdFeatures]
# correct the column names
names(Xdata) <- features[meanAndStdFeatures, 2]

#------------------------------------------------------
# Step 3
# Use descriptive activity names to name the activities in the data set
#------------------------------------------------------
print("Step 3")
activities <- read.table("UCI HAR Dataset/activity_labels.txt")

# update values with correct activity names
Ydata[, 1] <- activities[Ydata[, 1], 2]

# correct column name
names(Ydata) <- "activity"

#------------------------------------------------------
# Step 4
# Appropriately label the data set with descriptive variable names
#------------------------------------------------------
print("Step 4")
# correct column name
names(subjectData) <- "subject"

# combine all the data in a single data set
allData <- cbind(Xdata, Ydata, subjectData)

#------------------------------------------------------
# Step 5
# Create a second, independent tidy data set with the average of each variable
# for each activity and each subject
#------------------------------------------------------
print("Step 5")
# 66 <- 68 columns but last two (activity & subject)
averagesData <- ddply(allData, .(subject, activity), function(x) colMeans(x[, 1:66]))

write.table(averagesData, "averages_tidy_data.txt", row.name=FALSE)
print("Complete!")
