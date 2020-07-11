library(dplyr)
if (!file.exists("getdata_projectfiles_UCI.zip")) {
  download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",
                "getdata_projectfiles_UCI.zip",method="curl")
}

if (!file.exists("UCI HAR Dataset")) {
  unzip("getdata_projectfiles_UCI.zip")
}

setwd("UCI HAR Dataset")

features <- read.table("features.txt", col.names = c("id","func"))
activity <- read.table("activity_labels.txt", col.names = c("id", "type"))

setwd("test")
test_x <- read.table("X_test.txt", col.names = features$func)
test_y <- read.table("Y_test.txt", col.names = "cod")
subject_test <- read.table("subject_test.txt", col.names = "subject")

setwd("../train")
train_x <- read.table("X_train.txt", col.names = features$func )
train_y <- read.table("Y_train.txt", col.names = "cod")
subject_train <- read.table("subject_train.txt", col.names = "subject")

x <- union_all(train_x, test_x)
y <- union_all(train_y, test_y)
subject <- union_all(subject_test,subject_train)

data <- cbind(subject, x, y)

data <- data %>% select(subject, cod, contains("mean"), contains("std"))

data <- merge(data, activity, by.x = "cod", by.y = "id", all=TRUE)



names(data)<-gsub("^t", "Time", names(data))
names(data)<-gsub("tBody", "TimeBody", names(data))
names(data)<-gsub("cod", "Y_code", names(data))
names(data)<-gsub("subject", "Subject", names(data))
names(data)<-gsub("Timeype", "TypeActivity", names(data))
names(data)<-gsub("^f", "Frequency", names(data))
names(data)<-gsub("Acc", "Accelerometer", names(data))
names(data)<-gsub("Gyro", "Gyroscope", names(data))
names(data)<-gsub("BodyBody", "Body", names(data))
names(data)<-gsub("Mag", "Magnitude", names(data))
names(data)<-gsub("angle", "Angle", names(data))
names(data)<-gsub("...X", ".X", names(data))
names(data)<-gsub("...Z", ".Z", names(data))
names(data)<-gsub("...Y", ".Y", names(data))
names(data)

avg <- data %>% group_by(Subject,TypeActivity) %>% summarise_all(mean)
