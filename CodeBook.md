## Codebook
This document provides information about Tidy, the data set outputted by run_analysis.R. Note that tidy consists of a 180 observations (30 subjects each performing 6 different activities)  of 81 variables (Subject and Activity and 79 measurements). 

##### Variable Names
- Subject: the subject id; it takes values between 1 and 30 and identifies the subject who performed a specific activity.
- Activity: A factor variable with six levels: 1. Walking, 2. Walking Upstairs, 3. Walking Downstairs, 4. Sitting, 5. Standing, 6. Laying. 

The remaining 79 variables refer to measurements taken of a subject performing one of the six activities. The names are as they appear in the original UCI HAR data set, except that the dashes have been eliminated to improve readablity.

##### Data
The data in columns 3 to 81 are averages of the variables for specific subjects performing specific activities.
The original data can be downloaded here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

