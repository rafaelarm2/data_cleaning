# Getting and cleaning data
This repository is an assigment subimited by Rafaela Moreira to collect, work with and clean a data set using R language. The data set used for analysis is about human activity recognition and contains a X, Y and subject train/test txt file, also contains features and label for activities.

### Data
The data set is avaliable here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

### Variable descriptions
x_train - data set from UCI HAR Dataset/train/x_train.txt
y_train - data set from UCI HAR Dataset/train/y_train.txt
x_test - data set from UCI HAR Dataset/test/x_test.txt
y_test - data set from UCI HAR Dataset/test/y_test.txt
subject_test - data set from UCI HAR Dataset/test/subject_test.txt
subject_train - data set from UCI HAR Dataset/test/subject_train.txt
x - data set union by rows from x_train and x_test
y - data set union by rows from y_train and y_test
subject - data set union by rows from subject_test and subject_train
activity - data set from UCI HAR Dataset/activity_labels.txt
data - data set union by columns from x, y and subject using cod from y and id from activity
avg - data set contains avg of all measuraments group by subject and type of activity
