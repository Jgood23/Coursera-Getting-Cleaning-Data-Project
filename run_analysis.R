#Reading data files into R:

subject_test <- read.table("./UCIHAR/subject_test.txt")
X_test <- read.table("./UCIHAR/X_test.txt")
Y_test <- read.table("./UCIHAR/Y_test.txt")

subject_train <- read.table("./UCIHAR/subject_train.txt")
X_train <- read.table("./UCIHAR/X_train.txt")
Y_train <- read.table("./UCIHAR/Y_train.txt")

features <- read.table("./UCIHAR/features.txt")
activity_labels <- read.table("./UCIHAR/activity_labels.txt")

#Merging all data into a single dataset

X_total <- rbind(x_train, x_test)
Y_total <- rbind(y_train, y_test)
subject_total <- rbind(subject_train, subject_test)
all <- cbind(sub_total, y_total, x_total)
rm(X_test,Y_test,X_train,Y_train,subject_train,subject_test,X_total,Y_total,subject_total)

#Providing column names based on features

Name_feature <- as.character(features[,2])
New_column <- c(“Subject”, “Activity”, Name_feature)
Name_column(all) <- New_column

#Getting only the mean and standard dev.

Mean_only <- grep(“mean()”, Name_column(all)))
StandardDev_only <- <- grep(“std()”, Name_column(all)))
RColumn <- c(Mean_only, StandardDev_only)
RColumn2 <- sort(RColumn)

Dataframe1 <- all[, c(1,2,RColumn2)]
Dataframe2 <- Dataframe[, !grep1(“Freq”,Name_column(Dataframe1))]
rm(Dataframe1, all)

