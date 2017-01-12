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
