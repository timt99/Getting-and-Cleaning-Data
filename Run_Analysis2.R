

library(plyr)
library(dplyr)

#Step 1
#load the dataset
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile= "Dataset.zip")
unzip("Dataset.zip")

#Step2
#Read the test and training dataset 
x_traindata <- read.table("UCI HAR Dataset/train/X_train.txt")
y_traindata <- read.table("UCI HAR Dataset/train/y_train.txt")
subjectTrain <- read.table("UCI HAR Dataset/train/subject_train.txt")


x_testdata <- read.table("UCI HAR Dataset/test/X_test.txt")
y_testdata <- read.table("UCI HAR Dataset/test/y_test.txt")
subjectTest <- read.table("UCI HAR Dataset/test/subject_test.txt")

#Merge testing set together


x_dataset <- bind_rows(x_traindata, x_testdata)


y_dataset <- rbind(y_traindata, y_testdata)



subject_dataset <- bind_rows(subjectTrain, subjectTest)



#Step 2
#Extract only the measurements on the mean and standard deviation for each measurement

features <- read.table("UCI HAR Dataset/features.txt")

#Get only columns with mean or std in their names


featuresMeanStd <- grep(".*mean.*|.*std.*", features[,2])


#subset the desired columns

x_dataset <- x_dataset[, featuresMeanStd]



#correct the column names
names(x_dataset) <- features[featuresMeanStd,2]


#Step 3 
#Use descriptive activity names to name the activities in the data set

dataActivity <- read.table("UCI HAR Dataset/activity_labels.txt")

#update values with correct activity names
y_dataset[,1] <- dataActivity[y_dataset[,1], 2]

#correct column name

names(y_dataset) <- "activity"

# label dataset with descriptive variable names
#correct column name
names(subject_dataset) <- "subject"



#Merge all data into a single data set



alldata <- bind_cols(subject_dataset, x_dataset, y_dataset)



averagesData <- ddply(alldata, c("subject", "activity"), function(x) colMeans(x[, 1:80]))


write.table(averagesData, file="average_Data.txt", row.name= FALSE, col.names = TRUE, sep="\t", quote= FALSE )




