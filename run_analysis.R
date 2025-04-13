# run_analysis.R

# Download and unzip data
filename <- "dataset.zip"
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
if (!file.exists(filename)){
  download.file(fileURL, filename, method = "curl")
}
if (!file.exists("UCI HAR Dataset")) {
  unzip(filename)
}
# Read training data
x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")

# Read test data
x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")

# Read features + activity labels
features <- read.table("UCI HAR Dataset/features.txt")
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
# Combine the datasets
x_data <- rbind(x_train, x_test)
y_data <- rbind(y_train, y_test)
subject_data <- rbind(subject_train, subject_test)

# Set column names
colnames(x_data) <- features[, 2]
colnames(y_data) <- "activity"
colnames(subject_data) <- "subject"

# Merge everything into one data frame
merged_data <- cbind(subject_data, y_data, x_data)
# Select only columns with mean() or std()
selected_columns <- grepl("mean\\(\\)|std\\(\\)", features[, 2])
selected_data <- cbind(subject_data, y_data, x_data[, selected_columns])
# Replace activity codes with names
selected_data$activity <- factor(selected_data$activity, 
                                 levels = activity_labels[, 1], 
                                 labels = activity_labels[, 2])
# Clean variable names
names(selected_data) <- gsub("^t", "Time", names(selected_data))
names(selected_data) <- gsub("^f", "Frequency", names(selected_data))
names(selected_data) <- gsub("Acc", "Accelerometer", names(selected_data))
names(selected_data) <- gsub("Gyro", "Gyroscope", names(selected_data))
names(selected_data) <- gsub("Mag", "Magnitude", names(selected_data))
names(selected_data) <- gsub("BodyBody", "Body", names(selected_data))
# Create final tidy dataset
library(dplyr)
tidy_data <- selected_data %>%
  group_by(subject, activity) %>%
  summarise_all(mean)

# Write to file
write.table(tidy_data, "tidy_dataset.txt", row.name = FALSE)
