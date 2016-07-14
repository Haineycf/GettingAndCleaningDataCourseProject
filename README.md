# GettingAndCleaningDataCourseProject
The purpose of this project was to import data from the web, merge data files, extract columns and obtain the mean for the columns all in a nice tidy format.

course assignment: https://www.coursera.org/learn/data-cleaning/peer/FIZtT/getting-and-cleaning-data-course-project

more specifically:
data from:https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
background: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

the dataset was from a smart watch that monitored movement.  This script combines data from X_test and y_test and combines them with X_train and y_train files.  next it extracts columns with mean or average in them (file: mergedata). The file Ind_mean takes the average for each column based on the individuals reading (file:y_train and y_test).
