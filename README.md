# getting-and-cleaning-data

## General Description
This is a course project for Coursera course "**Getting and Cleaning Data**".

The original data is from experiments on human body motions recorded by the embedded inertial sensors of smartphone. 
The original data and data set information can be obtained here: 
[OriginData](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

The goal is to combine the two data groups "train" and "test", to extract the variables with "mean" and "standard deviation", and to calculate the average of each variable for each activity and each subject, then output the result as a tidy data set. 

## Steps To Run the R Script
1. First, download the raw data to analyze [SamsungData](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
2. After unzipping the downloaded file, there is a fold named "UCI HAR Dataset".
3. Open the RStudio. *Change the current working directory to the fold which contains the "UCI HAR Dataset"*. 
(or cut the "UCI HAR Dataset" and paste it into the current working directory.)
4. Run the R script "run_analysis.R" in this Repo. 
5. The output will be a tidy data set written into a txt file named "tidy.txt"

## What Does The R Script Do?
There were 30 subjects in this smartphone experiment. The collected data were ramdomly seperated into two subsets: 30% as "test data", and 70% as "train data". Six activities were requested to perform by each subjects: walking, walking upstairs, walking downstairs, sitting, standing, and laying. Therefore, there were a total of 30 x 6 = 180 kinds of subject*activity combinations. As for the variables, there were multiple (namely, 561) variables in the raw data. Only the variables regarding to "mean" and "standard deviation" were extracted, and then summarized. 

The run_analysis.R script is to perform the following steps:

1. Step 1: Merge the train and test data into one "df3" data set.
2. Step 2: Extracts only the measurements on the mean and standard deviation for each measurement. Change the column-extracted data set into a tbl object "data".
3. Step 3: Uses descriptive activity names to name the activities in the data set. "data2" is the activity-renamed tbl object.
4. Step 4: Rename the variables as descriptive variable names.
5. Step 5: Create a tidy data set "tidy" which summarize the mean of each variable for each activity and each subject. In the end, output the tidy data set as a txt file "tidy.txt".
