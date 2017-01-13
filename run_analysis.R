#Loading features and activity labels

activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
activity_labels[,2] <- as.character(activity_labels[,2])
features <- read.table("UCI HAR Dataset/features.txt")
features[,2] <- as.character(features[,2])

#Getting only the mean and standard deviation:

specific_features <- grep(".*mean.*|.*std.*", features[,2])
specific_features.names <- features[specific_features,2]
specific_features.names = gsub('-mean', 'Mean', specific_features.names)
specific_features.names = gsub('-std', 'Std', specific_features.names)
specific_features.names <- gsub('[-()]', '', specific_features.names)

#Loading the data sets

train <- read.table("UCI HAR Dataset/train/X_train.txt")[specific_features]
train_activities <- read.table("UCI HAR Dataset/train/Y_train.txt")
trainSubjects <- read.table("UCI HAR Dataset/train/subject_train.txt")
train <- cbind(trainSubjects, trainActivities, train)
test <- read.table("UCI HAR Dataset/test/X_test.txt")[specific_features]
test_activities <- read.table("UCI HAR Dataset/test/Y_test.txt")
test_subjects <- read.table("UCI HAR Dataset/test/subject_test.txt")
test <- cbind(test_subjects, test_activities, test)

# merging and labeling datasets, as well as converting activities and subjects into factors

allData <- rbind(train, test)
colnames(allData) <- c("subject", "activity", specific_features.names)
allData$activity <- factor(allData$activity, levels = activity_labels[,1], labels = activity_labels[,2])
allData$subject <- as.factor(allData$subject)
allData.melted <- melt(allData, id = c("subject", "activity"))
allData.mean <- dcast(allData.melted, subject + activity ~ variable, mean)

#Writing tidy_data.txt file
write.table(allData.mean, "tidy_data.txt", row.names = FALSE, quote = FALSE)
