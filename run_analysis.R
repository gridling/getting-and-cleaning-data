install.packages("dplyr")
library(dplyr)

cd = getwd()
cd0 = "./UCI HAR Dataset/"

## read in "features.txt" as the variable names, 
## extract the locations of the names which contains "mean" and "std"
setwd(cd0)
feature <- read.table("features.txt")
mean <- grep("mean", feature[,2])
std <- grep("std", feature[,2])

## "+2" of the locations of extracted mean and std variables  
## due to the 1st and 2nd columns of the intermediate data set are designed to
## be "Subject" and "Activity" variables
mean2 <- mean + 2
std2 <- std + 2

## extract the "test" data into "df1" data set
setwd("./test")
test = dir()
sub1 <- read.table(test[2])
x1 <- read.table(test[3])
y1 <- read.table(test[4])
df1 <- cbind(sub1, y1, x1)
colnames(df1)[c(1,2)] = c("Subject", "Activity")

## extract the "train" data into "df2" data set
setwd("..")
setwd("./train")
train = dir()
sub2 <- read.table(train[2])
x2 <- read.table(train[3])
y2 <- read.table(train[4])
df2 <- cbind(sub2, y2, x2)
colnames(df2)[c(1,2)] = c("Subject", "Activity")

## Step 1: merge the train and test data into one "df3" data set
## alternative: df3 <- rbind(df1, df2)
df3 <- merge(df1, df2, by=intersect(names(df1), names(df2)), all=TRUE)

## Step 2: "data" is the column-extracted data set which changed into a tbl object
col_mean <- df3[, mean2]
col_std <- df3[, std2]
df4 <- cbind(df3[,c(1,2)], col_mean, col_std)
data <- tbl_df(df4)

## Step 3: "data2" is the activity-renamed tbl object
walking <- filter(data, Activity == 1)
walking[,2] <- "walking"
walking_upstairs <- filter(data, Activity == 2)
walking_upstairs[,2] <- "walking_upstairs"
walking_downstairs <- filter(data, Activity == 3)
walking_downstairs[,2] <- "walking_downstairs"
sitting <- filter(data, Activity == 4)
sitting[,2] <- "sitting"
standing <- filter(data, Activity == 5)
standing[,2] <- "standing"
laying <- filter(data, Activity == 6)
laying[,2] <- "laying"
data2 <- rbind(walking, walking_upstairs, walking_downstairs, 
               sitting, standing, laying)

## Step 4: rename the variables as descriptive variable names
mean_names <- as.character(feature[,2][mean])
std_names <- as.character(feature[,2][std])
colnames(data2) <- c("Subject", "Activity", mean_names, std_names)

## Step 5: create a tidy data set "tidy" which summarize 
##         the mean of each variable for each activity and each subject
data3 <- group_by(data2, Subject, Activity)
tidy <- summarize_each(data3, funs(mean))

write.table(tidy, file = "tidy.txt", row.names = FALSE)
