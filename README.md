# Getting-and-Cleaning-Data-Course-Project
This is the repo for the course project for the coursera course Getting and Cleaning Data. It contains the following files:

- **run_analysis.R** To run this file, you should download the UCI HAR Dataset to your working directory, unzip it, and place it in a folder called "UCI HAR Dataset". This data set can be downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. You should also download the R package dplyr. 
The run_analysis.R script does the following:
- 1. It loads the X_train.txt and X_test.txt files, names their columns using the names given in the features.txt file, and merges them into a data frame called mergedSet by rowbinding them. 
- 2. It then extracts only the measurements in mergedSet on mean and standard deviation. To do this, it uses the grep function to find the indices of columns with the string "mean" or "std". It then re-defines mergedSet accordingly.
- 3. To make the variable names of the mergedSet more readable, the script then eliminates the dashes in the names.
- 4. Next, the script creates a column for the activities. It draws the activity data from the y_train.txt and the y_test.txt files, recasting them into a factor with six levels each of which corresponds to one of the six activities. Finally, the script column binds this factor variable with mergedSet.
- 5. Similarly, the script then creates a factor variable for subject id and column binds it with mergedSet.
- 6. Finally, the script creates a second, tidy data set called Tidy and saves it to a file called "tidy" in the working directory. For each subject and each activity, Tidy shows the average of each measurement. To create Tidy, the script calls the aggregate function on mergedSet with suitable agruments. 
- **Codebook.md** This file describles the variables and the data.
- **README.md** The README file for the this repo.
- **tidy.txt** The data set tidy outputted by run_analysis.R. It can be read into R or R studio via "read.csv(file = "./tidy.txt", header = TRUE, sep = "")". 
