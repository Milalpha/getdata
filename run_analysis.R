# set the working directory
setwd("~/DScoursera/UCI HAR Dataset")
list.files()
setwd("~/DScoursera/UCI HAR Dataset/test/")
list.files()
setwd("~/DScoursera/UCI HAR Dataset/train/")
list.files()
setwd("~/DScoursera/UCI HAR Dataset")
getwd()

# Load the dplyr package
library(dplyr)

# Read data from test files
Xtest <- read.table ("~/DScoursera/UCI HAR Dataset/test/X_test.txt")
Ytest <- read.table ("~/DScoursera/UCI HAR Dataset/test/y_test.txt")
subjectTest <- read.table ("~/DScoursera/UCI HAR Dataset/test/subject_test.txt")

# Read data from train files
Xtrain <- read.table ("~/DScoursera/UCI HAR Dataset/train/X_train.txt")
Ytrain <- read.table ("~/DScoursera/UCI HAR Dataset/train/y_train.txt")
subjectTrain <- read.table ("~/DScoursera/UCI HAR Dataset/train/subject_train.txt")

# Merge the training and the test sets to create one data set.
testData <- cbind(subjectTest, Ytest, Xtest)
trainData <- cbind(subjectTrain, Ytrain, Xtrain)
rawData <- rbind(testData, trainData)

# List of all features
features <- readLines ("~/DScoursera/UCI HAR Dataset/features.txt")

# Assign names to columns 
colnames(rawData) <- c("Subject","Activity", features)
Dataset <- arrange(rawData,Subject, Activity)

# Extract only the measurements on the mean and standard deviation for each measurement. 
meanStd <- grep("mean|std", features)
a <- grep("meanFreq", features)
b <- setdiff(meanStd, a)
b <- b + 2
Dataset <- select(Dataset, 1:2, b)

# Use descriptive activity names to name the activities in the data set
Dataset$Activity[Dataset$Activity=='1'] <- 'WALKING'
Dataset$Activity[Dataset$Activity=='2'] <- 'WALKING_UPSTAIRS'
Dataset$Activity[Dataset$Activity=='3'] <- 'WALKING_DOWNSTAIRS'
Dataset$Activity[Dataset$Activity=='4'] <- 'SITTING'
Dataset$Activity[Dataset$Activity=='5'] <- 'STANDING'
Dataset$Activity[Dataset$Activity=='6'] <- 'LAYING'

# Appropriately label the data set with descriptive variable full names.
n <- names(Dataset)
names(Dataset) <- gsub("\\()","", names(Dataset))
names(Dataset) <- gsub("-"," ", names(Dataset))
names(Dataset) <- gsub("[0-9]", "", names(Dataset))
names(Dataset) <- gsub("[1:10]","", names(Dataset))
names(Dataset) <- gsub("^t", "time", names(Dataset))
names(Dataset) <- gsub("^f", "frequency", names(Dataset))
names(Dataset) <- gsub("Acc", "Accelerometer", names(Dataset))
names(Dataset) <- gsub("Gyro", "Gyroscope", names(Dataset))
names(Dataset) <- gsub("Mag", "Magnitude", names(Dataset))
names(Dataset) <- gsub("BodyBody", "Body", names(Dataset))

# From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.
TidyData <- aggregate(. ~Subject + Activity, Dataset, mean)
TidyData <- arrange(TidyData, Subject, Activity)

# Export independent tidy data set "tidyData.txt" with the average of each variable for each activity and each subject.
write.table(TidyData, file = "tidyData.txt", row.names = FALSE)
