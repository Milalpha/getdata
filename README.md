<center><h3>Course Project</h3></center>
<center>________________________________________</center>
<center><h1>Getting and Cleaning Data</h1></center>
<center>________________________________________</center>
</br>
The purpose of this project is to demonstrate an ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. In this file it is described how the script <a href="https://github.com/Milalpha/getdata/blob/master/run_analysis.R"> run_analysis.R</a> works to get the tidy dataset <a href="https://github.com/Milalpha/getdata/blob/master/tidyData.txt">tidyData.txt</a>.

All variables and measurements are listed in the <a href="https://github.com/Milalpha/getdata/blob/master/Codebook.md"> CodeBook</a>.
</br>  
<center>________________________________________</center>
  </br>
Below are all steps done in the script and their meaning. 
</br>
<h4># Setting the working directory</h4>  
<p>Assuming that the .zip file has been downloaded and unzipped, setting the working directory of the unzipped file, checking all the files and subdirectories in it with all files in them.</p>   
    setwd("~/DScoursera/UCI HAR Dataset")
    list.files()
    setwd("~/DScoursera/UCI HAR Dataset/test/")
    list.files()
    setwd("~/DScoursera/UCI HAR Dataset/train/")
    list.files()
    setwd("~/DScoursera/UCI HAR Dataset")
    getwd()  
</br>
<h4># Loading the dplyr package</h4>  
<p>To manipulate data, we will use the dplyr package</p>  
    library(dplyr)  


</br>
<h4># Readng data from "test"" files</h4>  

    Xtest <- read.table ("~/DScoursera/UCI HAR Dataset/test/X_test.txt")
    Ytest <- read.table ("~/DScoursera/UCI HAR Dataset/test/y_test.txt")
    subjectTest <- read.table ("~/DScoursera/UCI HAR Dataset/test/subject_test.txt")  
</br>
<h4># Reading data from "train"" files</h4>  
    Xtrain <- read.table ("~/DScoursera/UCI HAR Dataset/train/X_train.txt")
    Ytrain <- read.table ("~/DScoursera/UCI HAR Dataset/train/y_train.txt")
    subjectTrain <- read.table ("~/DScoursera/UCI HAR Dataset/train/subject_train.txt")  
</br>
<h4># Merging training and test sets to create one dataset</h4>  
<p>Combining by column "subject" in test, Ytest, Xtest.</p>  
    testData <- cbind(subjectTest, Ytest, Xtest)  
<p>Combining by column "subject" in train, Ytrain, Xtrain</p>
    trainData <- cbind(subjectTrain, Ytrain, Xtrain)  
<p>Merging two combined datasets by rows.</p>  
    rawData <- rbind(testData, trainData)  
</br>
<h4># List of all features</h4>  
    features <- readLines ("~/DScoursera/UCI HAR Dataset/features.txt")  
</br>
<h4># Assigning names to columns</h4>   
    colnames(rawData) <- c("Subject","Activity", features)
<p>Order the merged dataset by Subject and Activity.</p>
    Dataset <- arrange(rawData,Subject, Activity)  
</br>
<h4># Extracting only the measurements on the mean and standard deviation for each measurement</h4>   
    meanStd <- grep("mean|std", features)
    a <- grep("meanFreq", features)
    b <- setdiff(meanStd, a)
    b <- b + 2
    Dataset <- select(Dataset, 1:2, b)
</br>
<h4># Using descriptive activity names to name the activities in the data set</h4>  
    Dataset$Activity[Dataset$Activity=='1'] <- 'WALKING'
    Dataset$Activity[Dataset$Activity=='2'] <- 'WALKING_UPSTAIRS'
    Dataset$Activity[Dataset$Activity=='3'] <- 'WALKING_DOWNSTAIRS'
    Dataset$Activity[Dataset$Activity=='4'] <- 'SITTING'
    Dataset$Activity[Dataset$Activity=='5'] <- 'STANDING'
    Dataset$Activity[Dataset$Activity=='6'] <- 'LAYING'  
</br>
<h4># Appropriately labeling the data set with descriptive variable full names</h4>  
    n <- names(Dataset)
    names(Dataset)<-gsub("\\()","",names(Dataset))
    names(Dataset)<-gsub("-"," ",names(Dataset))
    names(Dataset)<-gsub("[1:10]","",names(Dataset))
    names(Dataset)<-gsub("mean","Mean",names(Dataset))
    names(Dataset)<-gsub("correlation","Correlation",names(Dataset))
    names(Dataset)<-gsub(" std"," Standard Deviation",names(Dataset))
    names(Dataset)<-gsub(" t", "Time", names(Dataset))
    names(Dataset)<-gsub(" f", "Frequency", names(Dataset))
    names(Dataset)<-gsub("([Aa]cc)", "Acceleration", names(Dataset))
    names(Dataset)<-gsub("([Mm]ag)", "Magnitude", names(Dataset))
    names(Dataset)<-gsub("(gravity)","Gravity",names(Dataset))
    names(Dataset)<-gsub("([Gg]yro)", "Gyroscope", names(Dataset))
    names(Dataset)<-gsub("BodyBody","Body",names(Dataset))
    names(Dataset)<-gsub("[0-9]", "", names(Dataset))  
</br>
<h4># From the data set in step 4, creating a second, independent tidy data set with the average of each variable for each activity and each subject</h4>  
    TidyData <- aggregate(. ~Subject + Activity, Dataset, mean)
    TidyData <- arrange(TidyData, Subject, Activity)  
</br>
<h4># Exporting independent tidy data set "tidyData.txt" with the average of each variable for each activity and each subject</h4>  
    write.table(TidyData, file = "tidyData.txt", row.names = FALSE)  
</br>
</br>