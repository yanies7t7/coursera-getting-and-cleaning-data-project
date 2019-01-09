## Set Working Directory ##

setwd("D:/Suriani/My Desk 2016/02 Commercial Analytics (CA)/Cousera/Getting and Clensing Data/Assignment/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset")

## Test dataset

Xtest <- read.table("X_test.txt")
Ytest <- read.table("y_test.txt")
Subjectest <- read.table("subject_test.txt")

## Train dataset

Xtrain <- read.table("X_train.txt")
Ytrain <- read.table("y_train.txt")
Subjectrain <- read.table("subject_train.txt")

## Features data

features <- read.table("features.txt")


## 1.Merges the training and the test sets to create one data set.

X <- rbind(Xtrain, Xtest)
Y <- rbind(Ytrain, Ytest)
Subject <- rbind(Subjectrain, Subjectest)


## 2.Extracts only the measurements on the mean and standard deviation for each measurement.

index<-grep("mean\\(\\)|std\\(\\)", features[,2])
length(index)

X<-X[,index]
dim(X)

## 3.Uses descriptive activity names to name the activities in the data set

activity <- read.table("activity_labels.txt")

Y[,1]<-activity[Y[,1],2]
head(Y) 

## 4.Appropriately labels the data set with descriptive variable names.

names<-features[index,2]
names(X)<-names
names(Y)<-"Activity"
names(Subject)<-"SubjectID"

AllData<-cbind(Subject, Y, X)
head(AllData)

## 5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

library(magrittr)
library(dplyr)
FinalData <- AllData %>%
group_by(SubjectID, Activity) %>%
summarise_all(funs(mean))

#Please upload the tidy data set created in step 5 of the instructions.
#Please upload your data set as a txt file created with write.table() using row.name=FALSE (do not cut and paste a dataset directly into the text box, as this may cause errors saving your submission).

write.table(FinalData, file = "FinalResult.txt", row.names = FALSE)

dim(FinalData)
head(FinalData)
str(FinalData)





