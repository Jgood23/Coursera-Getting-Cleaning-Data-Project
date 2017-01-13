#Reading data files into R:

Activitylabels <- read.table("./UCI HAR Dataset/activity_labels.txt")[,2]
Features <- read.table("./UCI HAR Dataset/features.txt")[,2]
Xtest <- read.table("./UCI HAR Dataset/test/X_test.txt")
Ytest <- read.table("./UCI HAR Dataset/test/y_test.txt")
Subjecttest <- read.table("./UCI HAR Dataset/test/subject_test.txt")
names(Xtest) = Features
Extractfeatures <- grepl("mean|std", features)

#Loading activity data while taking measurements for mean and standard dev. only

Xtest = Xtest[,Extractfeatures]
Ytest[,2] = Activitylabels[Y_test[,1]]
names(Ytest) = c("Activity_ID", "Activity_Label")
names(Subjecttest) = "subject"
Testdata <- cbind(as.data.table(Subjecttest), Ytest, Xtest)

#Loading train data while taking measurements for mean and standard dev. only

Xtrain <- read.table("./UCI HAR Dataset/train/X_train.txt")
Ytrain <- read.table("./UCI HAR Dataset/train/y_train.txt")
Subjecttrain <- read.table("./UCI HAR Dataset/train/subject_train.txt")
names(Xtrain) = features
Xtrain = Xtrain[,Extractfeatures]

Ytrain[,2] = Activitylabels[Ytrain[,1]]
names(Ytrain) = c("Activity_ID", "Activity_Label")
names(Subjecttrain) = "subject"
Traindata <- cbind(as.data.table(Subjecttrain), Ytrain, Xtrain)

#Merge test and train data, and use dcast to apply mean function

Data = rbind(Testdata, Traindata)
IDlabels = c("subject", "Activity_ID", "Activity_Label")
Datalabels = setdiff(colnames(Data), IDlabels)
Meltdata = melt(Data, id = IDlabels, measure.vars = Datalabels)
Tidydata = dcast(Meltdata, subject + Activitylabels ~ variable, mean)
write.table(Tidydata, file = "./tidy_data.txt")
