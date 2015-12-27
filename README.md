# getting-and-cleaning-data

## General Description
This is a course project for Coursera course "**Getting and Cleaning Data**".
The original data is from experiments on human body motions recorded by the embedded inertial sensors of smartphone. 
The original data and data set information can be obtained here: 
[OriginData](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
The goal is to combine the two data groups "train" and "test", to extract the variables with "mean" and "standard deviation", and to calculate the average of each variable for each activity and each subject, then output the result as a tidy data set. 

## Steps To Run the R Script
1. First, download the raw data to analyze [SamsungData](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
2. After unzipping the downloaded file, there is a fold named "UCI HAR Dataset".
3. Open the RStudio. *Change the current working directory to the fold which contains the "UCI HAR Dataset"*. 
(or cut the "UCI HAR Dataset" and paste it into the current working directory.)
4. Run the R script "run_analysis.R" in this Repo. 
5. The output will be a tidy data set written into a txt file named "tidy.txt"

