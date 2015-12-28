
<center><h1>CodeBook</h1></center>
</br>

------------------------------------------------------------------------------------------

<h2>Introduction</h2>
This codebook contains all the information related to the variables in the tidy dataset <a href="https://github.com/Milalpha/getdata/blob/master/tidyData.txt">tidyData.txt</a> and the script  <a href="https://github.com/Milalpha/getdata/blob/master/run_analysis.R"> run_analysis.R</a> for the Course Project at the Coursera "Getting and Cleaning Data" course.
 
------------------------------------------------------------------------------------------

<h2>Raw data</h2>
The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
Here are the data for the project: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

<h4>The following files have been used:</h4>

<ul> 
<li> Training set - "train/X_train.txt"</li>
<li> Training labels - "train/y_train.txt"</li>
<li> Test set - "test/X_test.txt"</li>
<li> Test labels - "test/y_test.txt"</li>
<li> All features - "features.txt"</li>
<li> Class and activity labels - "activity_labels.txt"</li>
</ul>

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).

These signals were used to estimate variables of the feature vector for each pattern:
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

<h4>Activity labels:</h4>

<ol> 
<li> WALKING </li>
<li> WALKING_UPSTAIRS </li>
<li> WALKING_DOWNSTAIRS </li>
<li> SITTING </li>
<li> STANDING </li>
<li> LAYING </li>
</ol>

<h4>Variables in a raw dataset:</h4>

<ul> 
<li>tBodyAcc-XYZ</li>
<li>tGravityAcc-XYZ</li>
<li>tBodyAccJerk-XYZ</li>
<li>tBodyGyro-XYZ</li>
<li>tBodyGyroJerk-XYZ</li>
<li>tBodyAccMag</li>
<li>tGravityAccMag</li>
<li>tBodyAccJerkMag</li>
<li>tBodyGyroMag</li>
<li>tBodyGyroJerkMag</li>
<li>fBodyAcc-XYZ</li>
<li>fBodyAccJerk-XYZ</li>
<li>fBodyGyro-XYZ</li>
<li>fBodyAccMag</li>
<li>fBodyAccJerkMag</li>
<li>fBodyGyroMag</li>
<li>fBodyGyroJerkMag</li>
30 in test and training sets
</ul>
------------------------------------------------------------------------------------------

<h2>Tidy Dataset</h2>

Final tidy data was exported to "tidyData.txt""

To generate a tidy dataset, the following has been done in the run_analysis.R code:

1. Read data from test files</br>
2. Read data from train files</br>
3. Merge the training and the test sets to create one data set</br>
4. List of all features</br>
5. Assign names to columns </br>
6. Extract only the measurements on the mean and standard deviation for each measurement</br>
7. Use descriptive activity names to name the activities in the data set</br>
8. Appropriately label the data set with descriptive variable full names</br>
9. From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject</br>
10. Export independent tidy data set "tidyData.txt" with the average of each variable for each activity and each subject</br>


------------------------------------------------------------------------------------------
<h2>Variables in the tidy dataset</h2>

The first two variables are Subject and Activity:
Subject: subject that did the experiment 
Activity: one of the 6 activities (see above)

 [1] "Subject"                                          
 [2] "Activity"  
 
All other variables are mean and standard deviation for each measurement.

<h4>Measurments:</h4>

BodyAcceleration
GravityAcceleration
BodyAccelerationJerk
BodyGyroscope
BodyGyroscopeJerk
BodyAccelerationMagnitude
GravityAccelerationMagnitude
BodyAccelerationJerkMagnitude
BodyGyroscopeMagnitude
BodyGyroscopeJerkMagnitude

<h4>Mean and standard deviation:</h4>

 [3] "TimeBodyAcceleration Mean X"                              
 [4] "TimeBodyAcceleration Mean Y"                              
 [5] "TimeBodyAcceleration Mean Z"                              
 [6] "TimeBodyAcceleration Standard Deviation X"                
 [7] "TimeBodyAcceleration Standard Deviation Y"                
 [8] "TimeBodyAcceleration Standard Deviation Z"                
 [9] "TimeGravityAcceleration Mean X"                           
[10] "TimeGravityAcceleration Mean Y"                           
[11] "TimeGravityAcceleration Mean Z"                           
[12] "TimeGravityAcceleration Standard Deviation X"             
[13] "TimeGravityAcceleration Standard Deviation Y"             
[14] "TimeGravityAcceleration Standard Deviation Z"             
[15] "TimeBodyAccelerationJerk Mean X"                          
[16] "TimeBodyAccelerationJerk Mean Y"                          
[17] "TimeBodyAccelerationJerk Mean Z"                          
[18] "TimeBodyAccelerationJerk Standard Deviation X"            
[19] "TimeBodyAccelerationJerk Standard Deviation Y"            
[20] "TimeBodyAccelerationJerk Standard Deviation Z"            
[21] "TimeBodyGyroscope Mean X"                                 
[22] "TimeBodyGyroscope Mean Y"                                 
[23] "TimeBodyGyroscope Mean Z"                                 
[24] "TimeBodyGyroscope Standard Deviation X"                   
[25] "TimeBodyGyroscope Standard Deviation Y"                   
[26] "TimeBodyGyroscope Standard Deviation Z"                   
[27] "TimeBodyGyroscopeJerk Mean X"                             
[28] "TimeBodyGyroscopeJerk Mean Y"                             
[29] "TimeBodyGyroscopeJerk Mean Z"                             
[30] "TimeBodyGyroscopeJerk Standard Deviation X"               
[31] "TimeBodyGyroscopeJerk Standard Deviation Y"               
[32] "TimeBodyGyroscopeJerk Standard Deviation Z"               
[33] "TimeBodyAccelerationMagnitude Mean"                       
[34] "TimeBodyAccelerationMagnitude Standard Deviation"         
[35] "TimeGravityAccelerationMagnitude Mean"                    
[36] "TimeGravityAccelerationMagnitude Standard Deviation"      
[37] "TimeBodyAccelerationJerkMagnitude Mean"                   
[38] "TimeBodyAccelerationJerkMagnitude Standard Deviation"     
[39] "TimeBodyGyroscopeMagnitude Mean"                          
[40] "TimeBodyGyroscopeMagnitude Standard Deviation"            
[41] "TimeBodyGyroscopeJerkMagnitude Mean"                      
[42] "TimeBodyGyroscopeJerkMagnitude Standard Deviation"        
[43] "FrequencyBodyAcceleration Mean X"                         
[44] "FrequencyBodyAcceleration Mean Y"                         
[45] "FrequencyBodyAcceleration Mean Z"                         
[46] "FrequencyBodyAcceleration Standard Deviation X"           
[47] "FrequencyBodyAcceleration Standard Deviation Y"           
[48] "FrequencyBodyAcceleration Standard Deviation Z"           
[49] "FrequencyBodyAccelerationJerk Mean X"                     
[50] "FrequencyBodyAccelerationJerk Mean Y"                     
[51] "FrequencyBodyAccelerationJerk Mean Z"                     
[52] "FrequencyBodyAccelerationJerk Standard Deviation X"       
[53] "FrequencyBodyAccelerationJerk Standard Deviation Y"       
[54] "FrequencyBodyAccelerationJerk Standard Deviation Z"       
[55] "FrequencyBodyGyroscope Mean X"                            
[56] "FrequencyBodyGyroscope Mean Y"                            
[57] "FrequencyBodyGyroscope Mean Z"                            
[58] "FrequencyBodyGyroscope Standard Deviation X"              
[59] "FrequencyBodyGyroscope Standard Deviation Y"              
[60] "FrequencyBodyGyroscope Standard Deviation Z"              
[61] "FrequencyBodyAccelerationMagnitude Mean"                  
[62] "FrequencyBodyAccelerationMagnitude Standard Deviation"    
[63] "FrequencyBodyAccelerationJerkMagnitude Mean"              
[64] "FrequencyBodyAccelerationJerkMagnitude Standard Deviation"
[65] "FrequencyBodyGyroscopeMagnitude Mean"                     
[66] "FrequencyBodyGyroscopeMagnitude Standard Deviation"       
[67] "FrequencyBodyGyroscopeJerkMagnitude Mean"                 
[68] "FrequencyBodyGyroscopeJerkMagnitude Standard Deviation"   
