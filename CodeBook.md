# The Code Book 

## Study Design
### Descriptions on experimental methods for raw data collection
  The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz were recorded. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

  The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

### Each of the record in the resulting raw data contains
* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration
* Triaxial Angular velocity from the gyroscope
* A 561-feature vector with time and frequency domain variables. 
* Its activity label. 
* An identifier of the subject who carried out the experiment.

### Descriptions on the feature selection
  The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

  Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

  Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

## Code Book
### Transformations to Clean Up the Data

The run_analysis.R script performs the following steps to clean up the data:

1. Step 1: Merge the train and test data into one data set
  1) Step 1-1: read in the "features.txt" to extract the variable names, and in the meantime, extract the locations for the names that contains "mean" and "std"
  2) Step 1-2: extract data from the "test" fold into "df1" data set
  3) Step 1-3: extract data from the "train" fold into "df2" data set
  4) Step 1-4: merge the "df1" and "df2" data sets into one "df3" data set
2. Step 2: Select the columns with mean and standard deviation for each measurement, and change the column-selected data set into a tbl object "data"
3. Step 3: Rename the activities as descriptive names, "data2" is the activity-renamed tbl object
4. Step 4: Rename the variables as descriptive variable names
5. Step 5: Create a tidy data set "tidy", which summarize the mean of each variable for each activity and each subject. 

In the end, output the tidy data set as a txt file "tidy.txt".

### The Variables
* Subject: nominal variable with the ID for each subject who performed the activity, ranging from 1 to 30. 
* Activity: categorical variable that describes the six activities each subject performed: walking, walking_upstairs, walking_downstairs, sitting, standing, laying

* Other remaining variables are combinations of the followings: 

  - mean(): Mean value
  - std(): Standard deviation
  - meanFreq(): Weighted average of the frequency components to obtain a mean frequency

  with

  - tBodyAcc-X/Y/Z
  - tGravityAcc-X/Y/Z
  - tBodyAccJerk-X/Y/Z
  - tBodyGyro-X/Y/Z
  - tBodyGyroJerk-X/Y/Z
  - tBodyAccMag
  - tGravityAccMag
  - tBodyAccJerkMag
  - tBodyGyroMag
  - tBodyGyroJerkMag
  - fBodyAcc-X/Y/Z
  - fBodyAccJerk-X/Y/Z
  - fBodyGyro-X/Y/Z
  - fBodyAccMag
  - fBodyAccJerkMag
  - fBodyGyroMag
  - fBodyGyroJerkMag

The units used for the accelerations are 'g's (gravity of earth -> 9.80665 m/seg2).

The gyroscope units are radians/second. 



