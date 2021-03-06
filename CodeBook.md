#Codebook

#Source of the Data & Project Data:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

#Data Set Information:

The data was collected through experiments conducted with a group of 30 volunteers who ranged from 19 to 48 years of age. Each individual performed six activities: walking, walking upstairs, walking downstairs, sitting, standing, and lying down while wearing a Samsung Galaxy S II on their waist. Utilization of the phone’s embedded accelerometer and gyroscope allowed 3-axial linear acceleration and 3-axial angular velocity to be captured at a constant rate of 50Hz. The resulting dataset was randomly partitioned into two sets, in which 70% of volunteers’ data were selected for the training data, and the rest for the test data.

Sensor signals were pre-processed by applying noise filters and subsequently sampling in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings per window). The sensor acceleration signal was separated via a Butterworth low-pass filter into body acceleration and gravity. The gravitational force was assumed to have only low frequency components, and therefore a filter with 0.3 Hz cutoff frequency was utilized. A vector of features was obtained by calculating variables from the time and frequency domain from each window.

#Script Details:

R script called run_analysis.R was created with the following details:

1. Merged the training and the test sets to create one data set.
2. Extracted only the measurements on the mean and standard deviation for each measurement.
3. Used descriptive activity names to name the activities in the data set
4. Appropriately labeled the data set with descriptive variable names.
5. From the data set in step 4, created a second, independent tidy data set with the average of each variable for each activity and each subject.
