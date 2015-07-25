library(dplyr)

# Load the training set.
trainingSet <- read.csv(file = "./UCI HAR Dataset/UCI HAR Dataset/train/X_train.txt", 
                        header = FALSE, 
                        sep="")

# Load the test set.
testSet <- read.csv(file = "./UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt",
                    header = FALSE,
                    sep="")

# Rename the columns of both data sets according to the feature names.
featureNames <- read.csv(file = "./UCI HAR Dataset/UCI HAR Dataset/features.txt",
                  header = FALSE, 
                  sep = "")
featureNames$V2 <- as.character(featureNames$V2)
colnames(trainingSet) <- featureNames$V2
colnames(testSet) <- featureNames$V2

# Merge the data by rowbinding the training and test sets.
mergedSet <- rbind(trainingSet, testSet)

# Extract the only the measurements on mean and standard deviation for each measurement.
relevantColumns <- grep("mean|Mean|std", names(mergedSet))
mergedSet <- mergedSet[, relevantColumns]

# Create a column for Activities. We will treat this column as a factor variable with
# six levels: (1) Walking, (2) Walking Upstairs, (3) Walking Downstairs, (4) Sitting,
# (5) Standing, and (6) Laying
trainingActivities <- read.csv(
    file = "./UCI HAR Dataset/UCI HAR Dataset/train/y_train.txt",
    sep = "", 
    header = FALSE)

trainingActivities <- trainingActivities$V1
testActivities <- read.csv(
    file = "./UCI HAR Dataset/UCI HAR Dataset/test/y_test.txt",
    sep = "",
    header = FALSE)
testActivities <- testActivities$V1
Activities <- factor(c(trainingActivities, testActivities), 
                     levels = c("1", "2", "3", "4", "5", "6"),
                     labels = c("Walking", "Walking Upstairs", "Walking Downstairs", "Sitting", "Standing", "Laying"))
mergedSet <- cbind(Activities, mergedSet)

# Create a column for Subject id.
training_id <- read.csv(
    file = "./UCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt",
    header = FALSE,
    sep="")

test_id <- read.csv(
    file = "./UCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt",
    header = FALSE,
    sep="")

Subject <- c(training_id$V1, test_id$V1)
mergedSet <- cbind(Subject, mergedSet)
mergedSet$Subject <- as.factor(mergedSet$Subject)

## Create a second tidy data set with the average of each variable by subject and activity

Tidy <- aggregate(mergedSet[3:88], by = list(Subject, Activities), FUN = mean, na.rm = TRUE)
Tidy <- rename(Tidy, Subject = Group.1, Activity = Group.2)
write.table(x = Tidy, file = "./tidy.txt", row.names = FALSE)